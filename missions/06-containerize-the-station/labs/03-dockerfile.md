# LAB 03 — BUILD AN IMAGE

Create a small Python/FastAPI application in a training folder.

Create:

```text
main.py
requirements.txt
Dockerfile
.dockerignore
```

Requirements:

- base image is a Python slim image,
- dependencies are installed from `requirements.txt`,
- application files are copied,
- FastAPI runs on port 8000,
- build the image,
- tag it meaningfully,
- run it,
- publish it on an unused host port,
- verify from Earth.

Then modify the application's returned message.

Rebuild.

Run the new image.

Observe which build steps Docker can reuse.
