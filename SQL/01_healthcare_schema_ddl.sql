/* ============================================================
   Healthcare Appointment Management System
   Platform: PostgreSQL
   Author: Ivan Su

   Purpose:
   Production-style relational schema for managing doctors,
   patients, appointments, prescriptions, and medications.

============================================================ */
-- drop and create schema
drop schema if exists Healthcare_appointment CASCADE;
create schema Healthcare_appointment;

-- Set execution context
SET search_path TO healthcare_appointment;

-- ================================
-- DDL: DOCTOR TABLE SETUP
-- ================================

--cascade is for automatically remove all dependent constraints (like foreign keys)
--from other tables (e.g., appointment) when you drop doctor
drop table if exists doctor cascade;

--create sequence for doctor ID PK, so auto generate id
CREATE SEQUENCE doctor_id_seq START WITH 1001 INCREMENT BY 1 MINVALUE 1001;

CREATE TABLE doctor(
doctor_id INT PRIMARY KEY DEFAULT nextval('doctor_id_seq'),
speciality varchar (50),
licence_Number varchar (50) not null,
first_name varchar (50) not null,
last_Name varchar (50) not null,
phone varchar (50) not null
);


-- ================================
-- DDL:PATIENT TABLE SETUP
-- ================================
drop table if exists patient cascade;

create sequence patient_id_seq start 001 increment 1;

create table patient(
patient_id int primary key default nextval('patient_id_seq'),
first_name varchar (50),
last_Name varchar (50),
phone varchar (50),
DOB date,
address varchar(50)
);

-- ================================
-- DDL:APPOINTMENT TABLE SETUP
-- ================================
drop table if exists appointment cascade;

DROP SEQUENCE IF EXISTS apt_id_seq;
CREATE SEQUENCE apt_id_seq START 301 INCREMENT BY 1;

CREATE TABLE appointment (
    appointment_id INT PRIMARY KEY DEFAULT nextval('apt_id_seq'),
    patient_id INT REFERENCES patient(patient_id), -- FOREIGN KEY
    doctor_id INT REFERENCES doctor(doctor_id),   --FOREIGN KEY
    date_time TIMESTAMP,
    purpose VARCHAR(50),
    status VARCHAR(50)
);

-- ================================
-- DDL: PRESCRIPTION TABLE SETUP
-- ================================
DROP TABLE IF EXISTS prescription cascade;

create sequence prescription_id_seq start 1010 increment 10;

CREATE TABLE prescription (
    prescription_id INT PRIMARY KEY DEFAULT NEXTVAL('prescription_id_seq'),
    appointment_id INT NOT NULL,
    start_date DATE,
    observations VARCHAR(255),
    instructions VARCHAR(255),
    end_date DATE,
    CONSTRAINT fk_appointment
        FOREIGN KEY (appointment_id)
        REFERENCES appointment(appointment_id)
);

-- ================================
-- DDL:MEDICATION TABLE SETUP
-- ================================
drop table if exists medication cascade;

create sequence med_id_seq start 400 increment 10;

create table medication(
medication_id int primary key default nextval('med_id_seq'),
prescription_id INT, 
medication_name varchar(255) not null,
manufacture varchar (255),
dosageform varchar (50),
cost decimal,
	constraint fk_prescription
	foreign key (prescription_id)
	references prescription (prescription_id)
);