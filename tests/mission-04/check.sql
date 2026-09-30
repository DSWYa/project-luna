\echo 'PROJECT LUNA - MISSION 04 VALIDATION'
SELECT table_name FROM information_schema.tables WHERE table_schema='public' AND table_name IN ('modules','crew','equipment','maintenance_tickets','telemetry') ORDER BY table_name;
SELECT COUNT(*) AS module_count FROM modules;
SELECT COUNT(*) AS crew_count FROM crew;
SELECT COUNT(*) AS equipment_count FROM equipment;
SELECT COUNT(*) AS maintenance_ticket_count FROM maintenance_tickets;
SELECT COUNT(*) AS telemetry_count FROM telemetry;
SELECT e.equipment_name,m.module_name FROM equipment e LEFT JOIN modules m ON e.module_id=m.module_id ORDER BY e.equipment_name LIMIT 10;
SELECT m.module_name,COUNT(t.telemetry_id) AS readings,ROUND(AVG(t.oxygen),2) AS avg_oxygen FROM modules m LEFT JOIN telemetry t ON m.module_id=t.module_id GROUP BY m.module_name ORDER BY m.module_name;
