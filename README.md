# Healthcare Appointment Management System (PostgreSQL)

Production-style relational database design and SQL implementation for managing healthcare operations, including patients, doctors, appointments, prescriptions, and medications.

## Project Overview
This project demonstrates enterprise-grade database design principles using PostgreSQL, including normalized schemas (3NF), surrogate keys, referential integrity, and analytical SQL querying.

The solution models realistic healthcare workflows suitable for hospitals, outpatient clinics, and private healthcare providers.


## Entity Relationship Diagram (ERD)

![ERD](docs/healthcare-appointment-ERD.png)

## Key Features
- Fully normalized relational schema (3NF)
- Surrogate primary keys using sequences
- Strong referential integrity with foreign keys
- Transaction-safe DML operations
- Analytical and advanced SQL queries
- Clean separation of DDL, DML, and query logic

## Repository Structure

SQL/
├── 00_database_init.sql        # Database creation (run once)
├── 01_healthcare_schema_ddl.sql # Tables, sequences, constraints
├── 02_healthcare_data_dml.sql   # Sample data population
└── 03_healthcare_queries.sql    # Business & analytical queries

docs/
├── system-design.md             # Detailed system design documentation
└── healthcare-appointment-ERD.png



## Execution Order
Run scripts in the following order:

1. `00_database_init.sql`
2. `01_healthcare_schema_ddl.sql`
3. `02_healthcare_data_dml.sql`
4. `03_healthcare_queries.sql`

## Technologies
- PostgreSQL
- SQL (DDL, DML, Analytical Queries)
- pgAdmin 4

## Author
**Ivan Su**

