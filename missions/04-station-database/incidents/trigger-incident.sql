\connect postgres
DROP DATABASE IF EXISTS luna_incident_04 WITH (FORCE);
CREATE DATABASE luna_incident_04;
\connect luna_incident_04
CREATE TABLE modules(module_id INTEGER PRIMARY KEY,module_name VARCHAR(50) NOT NULL,module_type VARCHAR(50) NOT NULL,status VARCHAR(20) NOT NULL);
CREATE TABLE equipment(equipment_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,equipment_name VARCHAR(100) NOT NULL,equipment_type VARCHAR(50) NOT NULL,module_id INTEGER,status VARCHAR(20) NOT NULL,FOREIGN KEY(module_id) REFERENCES modules(module_id));
INSERT INTO modules VALUES (1,'HAB-1','Habitat','OPERATIONAL'),(2,'HAB-2','Habitat','OPERATIONAL'),(3,'LAB-1','Laboratory','OPERATIONAL'),(4,'POWER','Power','OPERATIONAL');
INSERT INTO equipment(equipment_name,equipment_type,module_id,status) VALUES ('Primary Oxygen Scrubber','Life Support',1,'OPERATIONAL'),('Backup Oxygen Scrubber','Life Support',2,'OPERATIONAL'),('Spectrometer','Science',3,'OPERATIONAL'),('Solar Controller','Power',4,'OPERATIONAL'),('Portable Sensor Kit','Sensor',NULL,'AVAILABLE');
UPDATE equipment SET module_id=NULL WHERE equipment_name='Primary Oxygen Scrubber';
\echo 'INCIDENT GENERATED: luna_incident_04'
