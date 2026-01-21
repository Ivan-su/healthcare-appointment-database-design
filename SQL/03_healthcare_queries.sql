/* ============================================================
   Healthcare Appointment Management System
   Platform: PostgreSQL
   Author: Ivan Su

   Overview:
   Production-style relational database for managing healthcare
   providers, patients, appointments, prescriptions, and medications.

   Key Features:
   - 3NF normalized schema
   - Surrogate keys via sequences
   - Enforced referential integrity
   - Transaction-safe DML operations
   - Analytical SQL with joins and subqueries
============================================================ */

--set search path
SET search_path TO Healthcare_appointment;

--Select all columns and all rows from one table 
select * from doctor;

--Select five columns and all rows from one table 

select doctor_id, speciality, licence_number, first_name, phone
from doctor;

--Select all columns from all rows from one view 

--creating the view
drop view if exists appointment_view;
create view appointment_view as 
select * from appointment;

--displaying the view
select * from appointment_view;

--Using a join on 2 tables, select all columns and all rows from the tables without the use of a Cartesian product 

select * from patient p
join appointment a
on p.patient_id = a.patient_id;

--Select and order data retrieved from one table 

select * from medication
order by medication_name asc;

--Using a join on 3 tables, select 5 columns from the 3 tables. Use syntax that would limit the output to 3 rows 

select d.doctor_id as doc_id, d.first_name as doc_first_name, 
p.patient_id as patient_id, p.first_name as patient_first_name, a.date_time as appointment_time
from doctor d
join appointment a
on d.doctor_id = a.doctor_id
join patient p
on a.patient_id = p.patient_id
limit 3; 

--Select distinct rows using joins on 3 tables 

select distinct a.date_time, pres.instructions from patient p
join appointment a
on p.patient_id = a.patient_id
join prescription pres
on pres.appointment_id = a.appointment_id;


--Use GROUP BY and HAVING in a select statement using one or more tables 
SELECT 
    status,
    COUNT(*) AS total_appointments
FROM 
    appointment
GROUP BY 
    status
HAVING 
    COUNT(*) > 5;


--Use IN clause to select data from one or more tables 
select * from appointment
where status in ('Scheduled');


--Select length of one column from one table (use LENGTH function) 

select patient_id, length(purpose) length_of_purpose
from appointment;

--Delete one record from one table. Use select statements to demonstrate the table contents before and after the DELETE statement. 
--Make sure you use ROLLBACK afterwards so that the data will not be physically removed 

-- Step 1: See the doctor before deletion
SELECT * FROM doctor
WHERE doctor_id = 1020;

-- Step 2: Start a transaction
BEGIN;

-- Step 3: Delete the doctor (who is not referenced in any appointment)
DELETE FROM doctor
WHERE doctor_id = 1020;

-- Step 4: Verify deletion (record should not appear)
SELECT * FROM doctor
WHERE doctor_id = 1020;

-- Step 5: Rollback the delete so it's undone
ROLLBACK;

-- Step 6: Confirm the doctor is still there
SELECT * FROM doctor
WHERE doctor_id = 1020;


--Query 12: Update one record from one table. Use select statements to demonstrate the table contents before and after the UPDATE statement. 
--Make sure you use ROLLBACK afterwards so that the data will not be physically removed 
-- Query 12: Update one record and rollback

-- Step 1: View appointment before update
SELECT appointment_id, status
FROM appointment
WHERE appointment_id = 301;

BEGIN;

-- Step 2: Update appointment status
UPDATE appointment
SET status = 'Completed'
WHERE appointment_id = 301;

-- Step 3: View after update
SELECT appointment_id, status
FROM appointment
WHERE appointment_id = 301;

-- Step 4: Rollback change
ROLLBACK;

-- Step 5: Confirm original value restored
SELECT appointment_id, status
FROM appointment
WHERE appointment_id = 301;


-- =========================================================
-- ADVANCED ANALYTICAL QUERIES
-- =========================================================

SELECT d.doctor_id, d.first_name, d.last_name, COUNT(a.appointment_id) AS total_appointments
FROM doctor d
JOIN appointment a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
HAVING COUNT(a.appointment_id) >
    (SELECT AVG(cnt)
     FROM (
         SELECT COUNT(*) AS cnt
         FROM appointment
         GROUP BY doctor_id
     ) sub);



SELECT p.patient_id, p.first_name, p.last_name, COUNT(pr.prescription_id) AS prescription_count
FROM patient p
JOIN appointment a ON p.patient_id = a.patient_id
JOIN prescription pr ON a.appointment_id = pr.appointment_id
GROUP BY p.patient_id, p.first_name, p.last_name
HAVING COUNT(pr.prescription_id) > 1;