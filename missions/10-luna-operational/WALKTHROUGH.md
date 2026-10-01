# MISSION 10 WALKTHROUGH

Mission 10 installs a single-node K3s Kubernetes cluster on LUNA-1.

The existing Docker Compose deployment will be backed up before migration.

---

# PART 1 — RESOURCE CHECK

Kubernetes adds control-plane overhead.

Before beginning:

```bash
free -h
df -h
nproc
```

For the **complete Project LUNA stack**, a practical lab target is approximately:

```text
4 vCPU
8 GB RAM
60+ GB virtual disk
```

This is a Project LUNA recommendation for the combined stack, not Kubernetes's minimum requirement.

If your VM is smaller and your host has resources available:

1. shut down LUNA-1,
2. increase the VM allocation,
3. boot it again.

The local AI model is the heaviest optional workload.

You may temporarily scale Ollama down while learning Kubernetes if necessary.

---

# PART 2 — CREATE THE FINAL PRE-MIGRATION SNAPSHOT

Create a VirtualBox snapshot:

```text
M10 - PRE KUBERNETES MIGRATION
```

Do not skip this.

---

# PART 3 — BACK UP POSTGRESQL

On LUNA-1:

```bash
mkdir -p ~/luna-backups
cd ~/luna-operations
```

Load `.env`:

```bash
set -a
source .env
set +a
```

Create a backup from the current Compose PostgreSQL container:

```bash
docker compose exec -T db \
  pg_dump \
  -U "$LUNA_DB_USER" \
  -d "$LUNA_DB_NAME" \
  > ~/luna-backups/luna_operations_pre_k8s.sql
```

Check:

```bash
ls -lh ~/luna-backups/luna_operations_pre_k8s.sql
```

The file should not be empty.

---

# PART 4 — RECORD CURRENT STATE

Before migration:

```bash
docker compose ps
```

Test:

```bash
curl http://127.0.0.1/health
```

Record that the old platform works before replacing it.

---

# PART 5 — STOP THE COMPOSE STACK

K3s includes Traefik, which will use host ports 80 and 443.

Your Compose Nginx currently uses port 80.

Stop Compose:

```bash
cd ~/luna-operations
docker compose down
```

Do **not** use:

```bash
docker compose down -v
```

You still want the old Docker volumes available for rollback.

---

# PART 6 — UPDATE UFW FOR K3S

Mission 07 enabled UFW.

K3s uses internal Pod and Service networks.

Keep UFW enabled for this lab, but add the required K3s paths.

Allow the Kubernetes API:

```bash
sudo ufw allow 6443/tcp
```

Trust the default Pod CIDR:

```bash
sudo ufw allow from 10.42.0.0/16 to any
```

Trust the default Service CIDR:

```bash
sudo ufw allow from 10.43.0.0/16 to any
```

Allow HTTPS for Traefik:

```bash
sudo ufw allow 443/tcp
```

Port 80 should already be allowed from Mission 07.

Inspect:

```bash
sudo ufw status verbose
```

---

# PART 7 — INSTALL K3S

Install the current stable K3s release:

```bash
curl -sfL https://get.k3s.io \
  | sh -s - server --secrets-encryption
```

This installs K3s as a system service.

It also enables Kubernetes Secret encryption at rest.

---

# PART 8 — CHECK K3S

```bash
sudo systemctl status k3s
```

Press:

```text
q
```

when finished.

Cluster nodes:

```bash
sudo kubectl get nodes
```

You should see LUNA-1 in:

```text
Ready
```

state.

---

# PART 9 — WHAT K3S INSTALLED

K3s provides a complete Kubernetes environment including:

```text
Kubernetes API server
scheduler
controller manager
containerd
kubelet
CoreDNS
Traefik
ServiceLB
local-path storage
metrics-server
network-policy controller
```

You do not need to install a separate Kubernetes control plane for this course.

---

# PART 10 — CREATE YOUR USER KUBECONFIG

K3s stores its administrative kubeconfig at:

```text
/etc/rancher/k3s/k3s.yaml
```

Create:

```bash
mkdir -p ~/.kube
```

Copy:

```bash
sudo cp \
  /etc/rancher/k3s/k3s.yaml \
  ~/.kube/config
```

Take ownership:

```bash
sudo chown \
  "$(id -u):$(id -g)" \
  ~/.kube/config
```

Protect it:

```bash
chmod 600 ~/.kube/config
```

Now:

```bash
kubectl get nodes
```

should work without `sudo`.

## Important

Your kubeconfig is an administrative credential.

Do not commit it.

Do not casually share it.

---

# PART 11 — VERIFY SECRET ENCRYPTION

Run:

```bash
sudo k3s secrets-encrypt status
```

You should see encryption enabled.

Kubernetes Secret objects are not automatically safe merely because their YAML displays base64 data.

K3s was installed with encryption at rest so Secret data in the cluster datastore receives additional protection.

---

# PART 12 — LOOK AT THE CLUSTER

```bash
kubectl get pods -A
```

`-A` means all namespaces.

You should see Kubernetes system workloads.

Also:

```bash
kubectl get services -A
```

And:

```bash
kubectl get storageclass
```

K3s normally includes:

```text
local-path
```

as a storage class.

---

# PART 13 — NAMESPACE

A namespace logically groups Kubernetes resources.

Create a training namespace:

```bash
kubectl create namespace luna-training
```

List:

```bash
kubectl get namespaces
```

Mission 10's final application will use:

```text
luna
```

but training uses a disposable namespace.

---

# PART 14 — KUBERNETES YAML

A Kubernetes resource normally begins with:

```yaml
apiVersion:
kind:
metadata:
spec:
```

Example:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: training-web
  namespace: luna-training
spec:
  ...
```

Think of YAML as the desired state declaration.

---

# PART 15 — CREATE A TRAINING DEPLOYMENT

Create:

```text
~/k8s-training/
```

Then create:

```text
deployment.yaml
```

Paste:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: training-web
  namespace: luna-training
spec:
  replicas: 1

  selector:
    matchLabels:
      app: training-web

  template:
    metadata:
      labels:
        app: training-web

    spec:
      containers:
        - name: nginx
          image: nginx:alpine

          ports:
            - containerPort: 80
```

Apply:

```bash
kubectl apply -f deployment.yaml
```

---

# PART 16 — DEPLOYMENT VS POD

Check:

```bash
kubectl get deployments \
  -n luna-training
```

Then:

```bash
kubectl get pods \
  -n luna-training
```

The Deployment manages the Pod.

Mental model:

```text
Deployment
    ↓
ReplicaSet
    ↓
Pod
    ↓
Container
```

You normally manage the Deployment rather than manually managing its Pods.

---

# PART 17 — DESCRIBE A RESOURCE

Get the Pod name:

```bash
kubectl get pods \
  -n luna-training
```

Describe it:

```bash
kubectl describe pod \
  POD_NAME \
  -n luna-training
```

`describe` shows:

- state,
- image,
- events,
- conditions,
- volumes,
- probe failures,
- scheduling information.

---

# PART 18 — POD LOGS

```bash
kubectl logs \
  POD_NAME \
  -n luna-training
```

Follow:

```bash
kubectl logs -f \
  POD_NAME \
  -n luna-training
```

---

# PART 19 — CREATE A SERVICE

Pods can be replaced.

Their individual IP addresses are not stable identities.

A Kubernetes Service provides a stable network endpoint.

Create:

```text
service.yaml
```

Paste:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: training-web
  namespace: luna-training
spec:
  selector:
    app: training-web

  ports:
    - port: 80
      targetPort: 80
```

Apply:

```bash
kubectl apply -f service.yaml
```

Inspect:

```bash
kubectl get svc \
  -n luna-training
```

---

# PART 20 — SERVICE SELECTORS

The Service contains:

```yaml
selector:
  app: training-web
```

The Pod contains:

```yaml
labels:
  app: training-web
```

That match connects the Service to its backend Pods.

Inspect:

```bash
kubectl get endpoints \
  -n luna-training
```

A Service with no endpoints often means:

```text
selector does not match healthy Pods
```

This becomes important in the final emergency.

---

# PART 21 — CLUSTER DNS

Kubernetes DNS lets workloads use Service names.

Run a temporary curl Pod:

```bash
kubectl run curl-test \
  --rm \
  -it \
  --restart=Never \
  --image=curlimages/curl \
  -n luna-training \
  -- \
  curl http://training-web
```

The hostname:

```text
training-web
```

resolves through cluster DNS.

This is conceptually similar to Docker Compose service-name networking.

---

# PART 22 — SCALE A DEPLOYMENT

Scale:

```bash
kubectl scale deployment \
  training-web \
  --replicas=3 \
  -n luna-training
```

Check:

```bash
kubectl get pods \
  -n luna-training
```

You should see three Pods.

---

# PART 23 — SELF-HEALING

Delete one Pod:

```bash
kubectl delete pod \
  POD_NAME \
  -n luna-training
```

Immediately inspect:

```bash
kubectl get pods \
  -n luna-training
```

The Deployment controller creates a replacement.

You declared:

```text
replicas = 3
```

Kubernetes works to restore that desired state.

---

# PART 24 — READINESS PROBE

A Pod can be running before it is ready to receive traffic.

Add inside the Nginx container:

```yaml
readinessProbe:
  httpGet:
    path: /
    port: 80

  initialDelaySeconds: 2
  periodSeconds: 5
```

Apply.

A failed readiness probe keeps the Pod out of Service endpoints.

---

# PART 25 — LIVENESS PROBE

Add:

```yaml
livenessProbe:
  httpGet:
    path: /
    port: 80

  initialDelaySeconds: 5
  periodSeconds: 10
```

A repeatedly failed liveness probe can cause Kubernetes to restart the container.

Readiness answers:

> Should this Pod receive traffic?

Liveness answers:

> Should Kubernetes restart this container?

They are not the same thing.

---

# PART 26 — RESOURCE REQUESTS AND LIMITS

Add:

```yaml
resources:
  requests:
    cpu: "50m"
    memory: "32Mi"

  limits:
    cpu: "250m"
    memory: "128Mi"
```

Concept:

```text
request
amount Kubernetes plans around

limit
maximum allowed usage boundary
```

Inspect:

```bash
kubectl top pods \
  -n luna-training
```

K3s includes metrics-server.

---

# PART 27 — CONFIGMAP

Create:

```bash
kubectl create configmap \
  training-config \
  --from-literal=STATION=LUNA-1 \
  --from-literal=ENVIRONMENT=TRAINING \
  -n luna-training
```

Inspect:

```bash
kubectl get configmap \
  training-config \
  -n luna-training \
  -o yaml
```

ConfigMaps hold non-secret configuration.

---

# PART 28 — SECRET

Create a fake training Secret:

```bash
kubectl create secret generic \
  training-secret \
  --from-literal=DEMO_PASSWORD=not-a-real-password \
  -n luna-training
```

Inspect:

```bash
kubectl get secret \
  training-secret \
  -n luna-training \
  -o yaml
```

The data is encoded.

Base64 encoding is **not encryption**.

Do not commit real Secret manifests containing credentials.

---

# PART 29 — ENVIRONMENT FROM CONFIGURATION

A container can consume configuration:

```yaml
envFrom:
  - configMapRef:
      name: training-config

  - secretRef:
      name: training-secret
```

This separates configuration from the image.

The same image can run with different settings.

---

# PART 30 — PERSISTENT VOLUME CLAIM

Create:

```text
pvc.yaml
```

Paste:

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: training-data
  namespace: luna-training
spec:
  accessModes:
    - ReadWriteOnce

  storageClassName: local-path

  resources:
    requests:
      storage: 256Mi
```

Apply:

```bash
kubectl apply -f pvc.yaml
```

Check:

```bash
kubectl get pvc \
  -n luna-training
```

It should become:

```text
Bound
```

---

# PART 31 — PV VS PVC

Mental model:

```text
PVC
Pod asks for storage
       │
       ▼
StorageClass / provisioner
       │
       ▼
PV
actual persistent storage resource
```

K3s's local-path provisioner stores persistent data on the node.

That survives Pod replacement.

It does **not** magically make a single-node cluster highly available if the entire VM or disk is lost.

Backups still matter.

---

# PART 32 — STATEFULSET

Deployments are ideal for interchangeable stateless Pods.

StatefulSet is designed for workloads that need stable identity and persistent storage relationships.

PostgreSQL is the main Project LUNA example.

A single-replica PostgreSQL StatefulSet can use:

```yaml
volumeClaimTemplates:
```

to create persistent storage associated with the StatefulSet Pod.

Mission 10's final project will use a StatefulSet for PostgreSQL.

---

# PART 33 — DAEMONSET

A DaemonSet runs a Pod on every matching node.

Project LUNA uses this pattern for:

```text
Node Exporter
```

Today you have one node, so you get one exporter Pod.

If you add a worker later, the DaemonSet can place an exporter there too.

---

# PART 34 — INGRESS

K3s includes Traefik.

An Ingress provides HTTP routing from outside the cluster to a Service.

Create:

```text
ingress.yaml
```

Paste:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: training-web
  namespace: luna-training
spec:
  rules:
    - http:
        paths:
          - path: /
            pathType: Prefix

            backend:
              service:
                name: training-web
                port:
                  number: 80
```

Apply:

```bash
kubectl apply -f ingress.yaml
```

Test from LUNA-1:

```bash
curl http://127.0.0.1/
```

Test from Earth:

```text
http://YOUR-LUNA-IP/
```

Traefik receives port 80 traffic and forwards it to the Service.

---

# PART 35 — INGRESS REPLACES THE OLD NGINX ROLE

Mission 05 used:

```text
host Nginx
```

Mission 06 used:

```text
Nginx container
```

K3s already provides:

```text
Traefik Ingress Controller
```

The final Kubernetes architecture does not need a separate LUNA Nginx container just to reverse proxy FastAPI.

The FastAPI application can continue serving its static dashboard.

---

# PART 36 — ROLLOUT

Change the training Deployment image:

```bash
kubectl set image \
  deployment/training-web \
  nginx=nginx:stable-alpine \
  -n luna-training
```

Watch:

```bash
kubectl rollout status \
  deployment/training-web \
  -n luna-training
```

History:

```bash
kubectl rollout history \
  deployment/training-web \
  -n luna-training
```

---

# PART 37 — ROLLBACK

Undo the last rollout:

```bash
kubectl rollout undo \
  deployment/training-web \
  -n luna-training
```

Then:

```bash
kubectl rollout status \
  deployment/training-web \
  -n luna-training
```

Rollbacks are one reason declarative controllers are powerful.

---

# PART 38 — EVENTS

When Kubernetes behaves unexpectedly:

```bash
kubectl get events \
  -n luna-training \
  --sort-by=.lastTimestamp
```

Events often explain:

```text
failed image pull
probe failure
scheduling issue
volume mount issue
```

---

# PART 39 — COMMON POD STATES

Learn these:

```text
Pending

ContainerCreating

Running

CrashLoopBackOff

ImagePullBackOff

Completed
```

Do not fix them by guessing.

Use:

```text
get
describe
logs
events
```

---

# PART 40 — EXEC INTO A POD

List:

```bash
kubectl get pods \
  -n luna-training
```

Enter one:

```bash
kubectl exec -it \
  POD_NAME \
  -n luna-training \
  -- sh
```

Exit:

```text
exit
```

---

# PART 41 — PORT FORWARD

Kubernetes can temporarily forward a local port to a Pod or Service.

Example:

```bash
kubectl port-forward \
  svc/training-web \
  8088:80 \
  -n luna-training
```

From LUNA-1:

```text
127.0.0.1:8088
```

now reaches that Service.

This will be useful for private Prometheus and Grafana access.

---

# PART 42 — NETWORK POLICY

K3s includes network-policy support.

A policy can restrict which Pods may reach another Pod.

Example concept for PostgreSQL:

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: postgres-ingress
  namespace: luna
spec:
  podSelector:
    matchLabels:
      app: postgres

  policyTypes:
    - Ingress

  ingress:
    - from:
        - podSelector:
            matchLabels:
              app: luna-api

      ports:
        - protocol: TCP
          port: 5432
```

This means:

```text
PostgreSQL ingress
allowed from API Pods
on TCP 5432
```

Mission 10's final project requires a database ingress policy.

---

# PART 43 — CLEAN UP TRAINING

Delete the namespace:

```bash
kubectl delete namespace luna-training
```

Deleting the namespace removes the training resources in it.

Confirm:

```bash
kubectl get namespace luna-training
```

---

# PART 44 — BUILD THE FINAL API IMAGE

Your custom FastAPI image currently exists in Docker's image store.

K3s uses containerd.

They are separate image stores.

Build a final image:

```bash
cd ~/luna-operations
docker build \
  -t luna-api:10.0 \
  ./app
```

Save:

```bash
docker save \
  luna-api:10.0 \
  -o /tmp/luna-api-10.0.tar
```

Import into K3s containerd:

```bash
sudo k3s ctr \
  -n k8s.io \
  images import \
  /tmp/luna-api-10.0.tar
```

Verify:

```bash
sudo k3s ctr \
  -n k8s.io \
  images list \
  | grep luna-api
```

The:

```text
k8s.io
```

containerd namespace is required for images that Kubernetes should see.

---

# PART 45 — LOCAL IMAGE POLICY

Your API Deployment will use:

```yaml
image: luna-api:10.0
imagePullPolicy: IfNotPresent
```

Because the image was imported locally, K3s can use it without a public container registry.

A real multi-node production environment would normally use a registry or another image-distribution strategy.

---

# PART 46 — CREATE THE FINAL NAMESPACE

Your final manifests will create:

```text
luna
```

as a namespace.

Do not deploy Project LUNA into:

```text
default
```

without organization.

---

# PART 47 — FINAL CONFIGMAP DESIGN

Non-secret values belong in a ConfigMap.

Examples:

```text
LUNA_DB_NAME=luna_operations
LUNA_DB_USER=luna_api
LUNA_DB_HOST=postgres
OLLAMA_URL=http://ollama:11434
OLLAMA_MODEL=qwen3:0.6b
```

Notice Kubernetes DNS names:

```text
postgres
ollama
```

replace Docker Compose service names with Kubernetes Service names.

The mental model remains similar.

---

# PART 48 — FINAL SECRET DESIGN

Create a local ignored file:

```text
k8s/secrets.env
```

It may contain:

```text
LUNA_DB_PASSWORD=...
LUNA_AUTOMATION_WEBHOOK_URL=...
LUNA_AUTOMATION_TOKEN=...
GRAFANA_ADMIN_USER=...
GRAFANA_ADMIN_PASSWORD=...
```

Add:

```text
k8s/secrets.env
```

to `.gitignore`.

Commit only:

```text
k8s/secrets.env.example
```

with placeholders.

---

# PART 49 — CREATE THE SECRET SAFELY

After the `luna` namespace exists:

```bash
kubectl create secret generic \
  luna-secrets \
  --from-env-file=k8s/secrets.env \
  -n luna \
  --dry-run=client \
  -o yaml \
  | kubectl apply -f -
```

This creates/updates the cluster Secret without storing real values in Git.

---

# PART 50 — POSTGRESQL FINAL DESIGN

The final PostgreSQL resources require:

```text
StatefulSet
Service
persistent storage
Secret password
ConfigMap database/user
```

Use:

```text
postgres:18
```

Mount persistent storage at:

```text
/var/lib/postgresql
```

Use one replica for this lab.

This is not a highly available database.

---

# PART 51 — RESTORE THE DATABASE

After PostgreSQL is Ready, get its Pod:

```bash
kubectl get pods \
  -n luna \
  -l app=postgres
```

Copy the backup:

```bash
kubectl cp \
  ~/luna-backups/luna_operations_pre_k8s.sql \
  luna/POSTGRES_POD:/tmp/luna.sql
```

Restore:

```bash
kubectl exec -it \
  POSTGRES_POD \
  -n luna \
  -- \
  sh
```

Inside the Pod:

```bash
psql \
  -U "$POSTGRES_USER" \
  -d "$POSTGRES_DB" \
  -f /tmp/luna.sql
```

Exit.

Verify important tables and records.

---

# PART 52 — FRESH REBUILD ALTERNATIVE

Your version-controlled:

```text
database/schema.sql
database/seed.sql
```

still matter.

Document how a completely fresh environment could load:

```text
schema.sql
seed.sql
```

instead of restoring a historical backup.

Backups preserve current state.

Schema/seed files preserve reproducibility.

You need both concepts.

---

# PART 53 — API FINAL DESIGN

Use:

```text
Deployment
Service
```

for FastAPI.

Suggested replicas:

```text
2
```

Requirements:

```text
readiness probe
liveness probe
resource requests
resource limits
ConfigMap environment
Secret environment
```

The Service should be:

```text
ClusterIP
```

The API does not need a NodePort.

---

# PART 54 — OLLAMA FINAL DESIGN

Use:

```text
Deployment
Service
PVC
```

Ollama's service port:

```text
11434
```

Do not create an Ingress for Ollama.

After the Pod is running:

```bash
kubectl exec \
  deployment/ollama \
  -n luna \
  -- \
  ollama pull qwen3:0.6b
```

The PVC preserves model data.

---

# PART 55 — MONITORING FINAL DESIGN

Migrate:

```text
Prometheus
Grafana
Node Exporter
```

Use:

```text
Prometheus = Deployment + Service + PVC + ConfigMap

Grafana = Deployment + Service + PVC

Node Exporter = DaemonSet
```

Do not expose Grafana or Prometheus through the public LUNA Ingress.

Use `kubectl port-forward` when administration is needed.

---

# PART 56 — PRIVATE GRAFANA ACCESS

On LUNA-1:

```bash
kubectl port-forward \
  svc/grafana \
  3000:3000 \
  -n luna
```

Keep that terminal open.

From Earth, create the SSH tunnel:

```text
ssh -L 3000:127.0.0.1:3000 lunaadmin@YOUR-LUNA-IP
```

Then Earth browses:

```text
http://127.0.0.1:3000
```

---

# PART 57 — FINAL INGRESS

Create an Ingress that sends:

```text
/
```

to:

```text
luna-api Service
```

Traefik handles external HTTP routing.

Earth should still use:

```text
http://YOUR-LUNA-IP/
```

The user-facing address does not need to change just because the internal platform changed.

---

# PART 58 — DRY RUN AND DIFF

Before changing the cluster:

```bash
kubectl apply \
  --dry-run=server \
  -f k8s/
```

Inspect differences:

```bash
kubectl diff \
  -f k8s/
```

Then apply:

```bash
kubectl apply \
  -f k8s/
```

The actual Secret is created separately from the ignored `secrets.env`.

---

# PART 59 — ROLLOUT STATUS

After deployment:

```bash
kubectl rollout status \
  deployment/luna-api \
  -n luna
```

Also check:

```bash
kubectl get pods \
  -n luna
```

Do not assume:

```text
kubectl apply succeeded
```

means:

```text
application is healthy
```

Validate runtime state.

---

# PART 60 — FINAL TROUBLESHOOTING ORDER

When the public site fails:

```text
1. Node Ready?
2. Ingress exists?
3. Service exists?
4. Service has Endpoints?
5. Pods Ready?
6. Pod logs?
7. ConfigMap/Secret correct?
8. Dependency Service reachable?
9. Persistent volume bound?
10. Events?
```

Useful commands:

```bash
kubectl get nodes

kubectl get ingress -n luna

kubectl get svc -n luna

kubectl get endpoints -n luna

kubectl get pods -n luna

kubectl describe pod POD -n luna

kubectl logs POD -n luna

kubectl get pvc -n luna

kubectl get events \
  -n luna \
  --sort-by=.lastTimestamp
```

---

# PART 61 — COMPLETE THE LABS

Complete:

```text
labs/01-kubectl-workloads.md
labs/02-services-storage.md
labs/03-configuration-rollouts.md
labs/04-troubleshooting.md
```

Then continue to:

```text
project/README.md
```

After the final migration passes validation, proceed to:

```text
capstone/emergency-simulation/BRIEFING.md
```
