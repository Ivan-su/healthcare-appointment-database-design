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

-- ===============================================
-- DML INSERTS: DOCTOR TABLE
-- ===============================================
INSERT INTO doctor (speciality, licence_number, first_name, last_name, phone) VALUES
('Cardiology', 'LIC1001', 'Alice', 'Smith', '555-1234'),
('Dermatology', 'LIC1002', 'Brian', 'Lee', '555-5678'),
('Pediatrics', 'LIC1003', 'Cathy', 'Wong', '555-4321'),
('Neurology', 'LIC1004', 'David', 'Kim', '555-8765'),
('Orthopedics', 'LIC1005', 'Eva', 'Brown', '555-0987'),
('Oncology', 'LIC1006', 'Frank', 'Taylor', '555-2222'),
('Endocrinology', 'LIC1007', 'Grace', 'Lopez', '555-3333'),
('Psychiatry', 'LIC1008', 'Henry', 'Martinez', '555-4444'),
('Gastroenterology', 'LIC1009', 'Isla', 'Wilson', '555-5555'),
('Radiology', 'LIC1010', 'Jack', 'Clark', '555-6666'),
('Urology', 'LIC1011', 'Karen', 'Hall', '555-7777'),
('Ophthalmology', 'LIC1012', 'Liam', 'King', '555-8888'),
('Rheumatology', 'LIC1013', 'Mia', 'Evans', '555-9999'),
('Allergy', 'LIC1014', 'Noah', 'Scott', '555-1010'),
('Immunology', 'LIC1015', 'Olivia', 'Green', '555-2020'),
('Nephrology', 'LIC1019', 'Sam', 'Mitchell', '555-6060'),
('Pulmonology', 'LIC1020', 'Tina', 'Murphy', '555-7070'),
('Anesthesiology', 'LIC1021', 'Umar', 'Parker', '555-8080'),
('General Medicine', 'LIC1022', 'Vera', 'Ward', '555-9090'),
('Infectious Disease', 'LIC1025', 'Yara', 'Barnes', '555-1414');



-- ===============================================
-- DML INSERTS: PATIENT TABLE
-- ===============================================
INSERT INTO patient (first_name, last_name, phone, dob, address) VALUES
('Emma', 'Johnson', '555-1010', '1990-01-15', '123 Maple St'),
('Liam', 'Smith', '555-2020', '1988-07-23', '456 Oak Rd'),
('Olivia', 'Brown', '555-3030', '1995-03-10', '789 Pine Ave'),
('Noah', 'Jones', '555-4040', '1992-12-05', '101 Cedar Blvd'),
('Ava', 'Garcia', '555-5050', '1987-09-18', '202 Birch Dr'),
('William', 'Martinez', '555-6060', '1991-11-22', '303 Walnut Ct'),
('Sophia', 'Davis', '555-7070', '1994-04-02', '404 Spruce Ln'),
('James', 'Lopez', '555-8080', '1993-06-13', '505 Cherry Way'),
('Isabella', 'Wilson', '555-9090', '1996-08-29', '606 Willow Rd'),
('Benjamin', 'Lee', '555-1111', '1990-10-14', '707 Ash Cir'),
('Mia', 'Clark', '555-1212', '1989-02-28', '808 Palm Dr'),
('Lucas', 'Harris', '555-1313', '1997-05-07', '909 Poplar Blvd'),
('Amelia', 'Young', '555-1414', '1992-01-09', '1010 Redwood St'),
('Henry', 'Hall', '555-1515', '1995-12-17', '111 Maple Loop'),
('Harper', 'Allen', '555-1616', '1993-07-06', '121 Oak Knoll'),
('Alexander', 'King', '555-1717', '1990-09-30', '131 Pine Trace'),
('Evelyn', 'Wright', '555-1818', '1986-03-21', '141 Birch Meadow'),
('Michael', 'Scott', '555-1919', '1988-06-25', '151 Cedar Ridge'),
('Ella', 'Green', '555-2022', '1991-11-01', '161 Walnut Hollow'),
('Daniel', 'Adams',	'555-2121',	'1994-02-11', '171 Spruce Field');


-- ===============================================
-- DML INSERTS: APPOINTMENT TABLE
-- ===============================================
INSERT INTO appointment (patient_id, doctor_id, date_time, purpose, status) VALUES
(1, 1001, '2024-04-15 09:00:00', 'Cardio Checkup', 'Scheduled'),
(2, 1002, '2024-04-16 10:30:00', 'Primary Consultation', 'Completed'),
(3, 1003, '2024-04-17 11:00:00', 'Heart Monitoring', 'Scheduled'),
(4, 1004, '2024-04-18 14:00:00', 'Skin Screening', 'Canceled'),
(5, 1005, '2024-04-19 08:00:00', 'Pediatric Exam', 'Scheduled'),
(6, 1006, '2024-04-20 15:30:00', 'Brain MRI', 'Completed'),
(7, 1007, '2024-04-21 16:00:00', 'Orthopedic Assessment', 'Scheduled'),
(8, 1008, '2024-04-22 13:45:00', 'Oncology Follow-up', 'Scheduled'),
(9, 1009, '2024-04-23 09:30:00', 'Hormonal Panel', 'Scheduled'),
(10, 1010, '2024-04-24 10:00:00', 'Psychiatric Evaluation', 'Completed'),
(11, 1011, '2024-04-25 11:15:00', 'GI Consultation', 'Scheduled'),
(12, 1012, '2024-04-26 14:30:00', 'Radiology Scan', 'Completed'),
(13, 1013, '2024-04-27 16:45:00', 'Urology Exam', 'Scheduled'),
(14, 1014, '2024-04-28 08:15:00', 'Vision Test', 'Scheduled'),
(15, 1015, '2024-04-29 10:00:00', 'Joint Pain Consult', 'Completed'),
(16, 1016, '2024-04-30 12:30:00', 'Allergy Panel', 'Scheduled'),
(17, 1017, '2024-05-01 14:00:00', 'Immunization Review', 'Scheduled'),
(18, 1018, '2024-05-02 15:45:00', 'Kidney Function Test', 'Completed'),
(19, 1019, '2024-05-03 09:00:00', 'Pulmonary Assessment', 'Scheduled'),
(20, 1020, '2024-05-04 11:00:00', 'Surgery Clearance', 'Scheduled');


-- ===============================================
-- DML INSERTS: PRESCRIPTION TABLE
-- ===============================================
INSERT INTO prescription (appointment_id, start_date, observations, instructions, end_date) VALUES
(301, '2024-04-15', 'Elevated blood pressure', 'Take 1 tablet of Lisinopril daily', '2024-05-15'),
(302, '2024-04-16', 'Fatigue and dizziness', 'Multivitamins daily after breakfast', '2024-05-01'),
(303, '2024-04-17', 'Irregular heartbeat', 'Beta blockers twice a day', '2024-05-17'),
(304, '2024-04-18', 'Mild skin rash', 'Apply Hydrocortisone cream twice daily', '2024-04-25'),
(305, '2024-04-19', 'Normal pediatric check', 'Vitamin D drops once a day', '2024-05-10'),
(306, '2024-04-20', 'Post-MRI headaches', 'Take Tylenol as needed', '2024-04-25'),
(307, '2024-04-21', 'Knee discomfort', 'Use anti-inflammatory gel after activity', '2024-05-21'),
(308, '2024-04-22', 'Post-cancer fatigue', 'Vitamin supplement and hydration', '2024-06-01'),
(309, '2024-04-23', 'Thyroid irregularities', 'Levothyroxine each morning', '2024-06-23'),
(310, '2024-04-24', 'Mild anxiety symptoms', 'Alprazolam before bedtime', '2024-05-10'),
(311, '2024-04-25', 'Stomach discomfort', 'Take Omeprazole after meals', '2024-05-15'),
(312, '2024-04-26', 'Blurry vision', 'Use eye drops 2 times daily', '2024-05-06'),
(313, '2024-04-27', 'Minor skin dryness', 'Apply lotion after bathing', '2024-05-15'),
(314, '2024-04-28', 'Joint stiffness', 'Take Celecoxib daily', '2024-05-30'),
(315, '2024-04-29', 'Diabetes management', 'Inject insulin with dinner', '2024-06-01');


-- ===============================================
-- DML INSERTS: MEDICATION TABLE
-- ===============================================
INSERT INTO medication (prescription_id, medication_name, manufacture, dosageform, cost) VALUES
(1160, 'Lisinopril', 'Pfizer', 'Tablet', 10.99),
(1170, 'Centrum Adult Multivitamins', 'Pfizer', 'Tablet', 6.50),
(1180, 'Metoprolol', 'Teva', 'Tablet', 8.75),
(1190, 'Hydrocortisone 1%', 'GSK', 'Cream', 5.20),
(1200, 'Vitamin D3 Drops', 'Nature Made', 'Liquid', 4.90),
(1210, 'Tylenol Extra Strength', 'Johnson & Johnson', 'Caplet', 7.80),
(1220, 'Voltaren Gel', 'Novartis', 'Gel', 12.25),
(1230, 'Emergen-C Immune+', 'Alacer Corp', 'Powder', 9.99),
(1240, 'Levothyroxine', 'Mylan', 'Tablet', 6.10),
(1250, 'Alprazolam', 'Pfizer', 'Tablet', 13.30),
(1260, 'Omeprazole', 'Sandoz', 'Capsule', 11.00),
(1270, 'Lumify Eye Drops', 'Bausch + Lomb', 'Eye Drops', 14.50),
(1280, 'CeraVe Moisturizing Cream', 'L’Oréal', 'Cream', 6.75),
(1290, 'Celecoxib', 'Pfizer', 'Capsule', 10.25),
(1300, 'Novolog Insulin', 'Novo Nordisk', 'Injection', 42.90);