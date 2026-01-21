# Healthcare Appointment Management System

Relational Database System Design (PostgreSQL)

**Author:** Ivan Su
**Platform:** PostgreSQL
**Project Type:** Database System Design & SQL Implementation


## 1. System Overview

The Healthcare Appointment Management System is a production-style relational database designed to support end-to-end management of patient–doctor 
interactions within a healthcare environment.

The system models core operational workflows including:

- Patient registration

- Doctor management

- Appointment scheduling

- Prescription tracking

- Medication management

This project demonstrates enterprise-grade database design principles, including normalization, surrogate key usage, referential integrity enforcement,
and analytical SQL querying. The schema is suitable for hospitals, outpatient clinics, and private healthcare providers.


## 2. Design Objectives

The database was designed with the following objectives:

- Ensure data consistency and integrity across all clinical entities

- Support one-to-many relationships common in healthcare workflows

- Enable scalable querying for operational and analytical use cases

- Apply Third Normal Form (3NF) to eliminate redundancy

- Follow PostgreSQL best practices for schema design and constraints


## 3. Assumptions & Constraints
Assumptions

- Each appointment is associated with exactly one doctor and one patient

- Patients may exist in the system without appointments (pre-registration)

-Doctors may exist without scheduled appointments

- Prescriptions are optional and tied to appointments

- Medications may exist independently of prescriptions

- Appointments are scheduled in advance (no walk-ins)

- Each appointment has a fixed time slot

- Surrogate keys are automatically generated using database sequences

Constraints

- Referential integrity is enforced using foreign key constraints

- Cascading deletes are carefully controlled to prevent unintended data loss

- All tables are populated with realistic sample data for validation

- SQL scripts are fully executable and error-free in PostgreSQL

## 4. Entity Overview

## 4.1 Doctor

Represents healthcare providers within the system.

Key Attributes

- doctor_id (PK)

- speciality

- licence_number

- first_name

- last_name

- phone

Relationship

- A doctor may have multiple appointments with different patients.

## 4.2 Patient

Stores demographic and contact information for patients.

Key Attributes

- patient_id (PK)

- first_name

- last_name

- phone

- dob

- address

Relationship

A patient may exist without appointments and may schedule multiple appointments over time.

## 4.3 Appointment

Manages patient–doctor interactions.

Key Attributes

- appointment_id (PK)

- patient_id (FK)

- doctor_id (FK)

- date_time

- purpose

- status

Relationship

- Each appointment is linked to one patient and one doctor.

- An appointment may or may not generate prescriptions.

## 4.4 Prescription

Records medication orders prescribed during appointments.

Key Attributes

- prescription_id (PK)

- appointment_id (FK)

- start_date

- end_date

- observations

- instructions

Relationship

- Each prescription is associated with one appointment.

- An appointment may generate multiple prescriptions.

## 4.5 Medication

Represents medications associated with prescriptions.

Key Attributes

- medication_id (PK)

- prescription_id (FK)

- medication_name

- manufacturer

- dosage_form

- cost

Relationship

- A prescription may reference multiple medications.

- Medications may exist in the system independently.

## 5. Normalization Strategy

First Normal Form (1NF)

- Removed repeating medication columns by separating medications into a dedicated table.

- Ensured all attributes contain atomic values.

Second Normal Form (2NF)

- Eliminated partial dependencies by separating patient details from appointments.

Third Normal Form (3NF)

- Removed transitive dependencies by separating prescription and medication data into distinct entities.

The final schema fully complies with Third Normal Form (3NF).

## 6. Entity Relationship Diagram (ERD)

The ERD visually represents entity relationships, primary keys, and foreign keys.

📎 ERD File:
docs/healthcare-appointment-ERD.png

## 7. SQL Implementation

The project includes modular SQL scripts:

- 00_database_init.sql – Database creation (admin-only, run once)

- 01_healthcare_schema_ddl.sql – Schema, tables, sequences, constraints

- 02_healthcare_data_dml.sql – Sample data population

- 03_healthcare_queries.sql – Analytical and transactional queries

All scripts are executable in PostgreSQL using pgAdmin 4.

## 8. Skills Demonstrated

- Relational database design

- PostgreSQL schema management

- Data normalization (1NF–3NF)

- Foreign key and constraint enforcement

- Transaction control (BEGIN / ROLLBACK)

- Analytical SQL (JOIN, GROUP BY, HAVING, subqueries)