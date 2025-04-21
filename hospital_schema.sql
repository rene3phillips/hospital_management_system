-- Drop tables if they already exist
DROP TABLE IF EXISTS billing, patient_doctor, appointments, doctors, patients;

-- Create the Doctor's Table
CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialty VARCHAR(50)
);

-- Create the Patient's Table
CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE
);

-- Create the Appointments Table
CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients(patient_id),
    doctor_id INTEGER REFERENCES doctors(doctor_id),
    appointment_date DATE,
    diagnosis TEXT
);

-- Create the Billing Table
CREATE TABLE billing (
    bill_id SERIAL PRIMARY KEY,
    appointment_id INTEGER REFERENCES appointments(appointment_id),
    total_amount DECIMAL(10, 2),
    payment_status VARCHAR(20)
);

-- Create the Patient Doctor JOIN Table
CREATE TABLE patient_doctor (
    patient_id INTEGER REFERENCES patients(patient_id),
    doctor_id INTEGER REFERENCES doctors(doctor_id),
    PRIMARY KEY (patient_id, doctor_id)
);

-- -- Insert Patients
INSERT INTO patients (first_name, last_name, date_of_birth) VALUES
('Liam', 'Anderson', '1985-03-12'),
('Olivia', 'Brown', '1992-07-28'),
('Mason', 'Clark', '2000-11-15'),
('Ava', 'Davis', '2010-02-09'),
('Noah', 'Evans', '1978-08-22');

-- -- Insert Doctors
INSERT INTO doctors (first_name, last_name, specialty) VALUES
('Dr. Emily', 'Watson', 'Cardiology'),
('Dr. James', 'Miller', 'Neurology'),
('Dr. Olivia', 'Taylor', 'Orthopedics');

-- -- Insert Appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date, diagnosis) VALUES
(
    (SELECT patient_id FROM patients WHERE first_name = 'Liam' AND last_name = 'Anderson' LIMIT 1),
    (SELECT doctor_id FROM doctors WHERE first_name = 'Dr. Olivia' AND last_name = 'Taylor' LIMIT 1),
    '2025-05-01',
    'Routine check-up'
);

INSERT INTO appointments (patient_id, doctor_id, appointment_date, diagnosis) VALUES
(
    (SELECT patient_id FROM patients WHERE first_name = 'Ava' AND last_name = 'Davis' LIMIT 1),
    (SELECT doctor_id FROM doctors WHERE first_name = 'Dr. Emily' AND last_name = 'Watson' LIMIT 1),
    '2025-05-02',
    'Follow-up consultation'
);

INSERT INTO appointments (patient_id, doctor_id, appointment_date, diagnosis) VALUES
(
    (SELECT patient_id FROM patients WHERE first_name = 'Olivia' AND last_name = 'Brown' LIMIT 1),
    (SELECT doctor_id FROM doctors WHERE first_name = 'Dr. James' AND last_name = 'Miller' LIMIT 1),
    '2025-05-03',
    'Emergency consultation'
);

-- -- Insert Billing
-- Drop tables if they already exist
DROP TABLE IF EXISTS billing, patient_doctor, appointments, doctors, patients;

-- Create the Doctor's Table
CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialty VARCHAR(50)
);

-- Create the Patient's Table
CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE
);

-- Create the Appointments Table
CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients(patient_id),
    doctor_id INTEGER REFERENCES doctors(doctor_id),
    appointment_date DATE,
    diagnosis TEXT
);

-- Create the Billing Table
CREATE TABLE billing (
    bill_id SERIAL PRIMARY KEY,
    appointment_id INTEGER REFERENCES appointments(appointment_id),
    total_amount DECIMAL(10, 2),
    payment_status VARCHAR(20)
);

-- Create the Patient Doctor JOIN Table
CREATE TABLE patient_doctor (
    patient_id INTEGER REFERENCES patients(patient_id),
    doctor_id INTEGER REFERENCES doctors(doctor_id),
    PRIMARY KEY (patient_id, doctor_id)
);

-- Insert Patients
INSERT INTO patients (first_name, last_name, date_of_birth) VALUES
('Liam', 'Anderson', '1985-03-12'),
('Olivia', 'Brown', '1992-07-28'),
('Mason', 'Clark', '2000-11-15'),
('Ava', 'Davis', '2010-02-09'),
('Noah', 'Evans', '1978-08-22');

-- Insert Doctors
INSERT INTO doctors (first_name, last_name, specialty) VALUES
('Dr. Emily', 'Watson', 'Cardiology'),
('Dr. James', 'Miller', 'Neurology'),
('Dr. Olivia', 'Taylor', 'Orthopedics');

-- Insert Appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date, diagnosis) VALUES
(
    (SELECT patient_id FROM patients WHERE first_name = 'Liam' AND last_name = 'Anderson' LIMIT 1),
    (SELECT doctor_id FROM doctors WHERE first_name = 'Dr. Olivia' AND last_name = 'Taylor' LIMIT 1),
    '2025-05-01',
    'Routine check-up'
);

INSERT INTO appointments (patient_id, doctor_id, appointment_date, diagnosis) VALUES
(
    (SELECT patient_id FROM patients WHERE first_name = 'Ava' AND last_name = 'Davis' LIMIT 1),
    (SELECT doctor_id FROM doctors WHERE first_name = 'Dr. Emily' AND last_name = 'Watson' LIMIT 1),
    '2025-05-02',
    'Follow-up consultation'
);

INSERT INTO appointments (patient_id, doctor_id, appointment_date, diagnosis) VALUES
(
    (SELECT patient_id FROM patients WHERE first_name = 'Olivia' AND last_name = 'Brown' LIMIT 1),
    (SELECT doctor_id FROM doctors WHERE first_name = 'Dr. James' AND last_name = 'Miller' LIMIT 1),
    '2025-05-03',
    'Emergency consultation'
);

-- Insert Billing
INSERT INTO billing (appointment_id, total_amount, payment_status) VALUES
(
    (SELECT appointment_id FROM appointments WHERE patient_id = (SELECT patient_id FROM patients WHERE first_name = 'Liam' AND last_name = 'Anderson' LIMIT 1) LIMIT 1),
    150.00,
    'Paid'
);

INSERT INTO billing (appointment_id, total_amount, payment_status) VALUES
(
    (SELECT appointment_id FROM appointments WHERE patient_id = (SELECT patient_id FROM patients WHERE first_name = 'Ava' AND last_name = 'Davis' LIMIT 1) LIMIT 1),
    200.00,
    'Pending'
);

INSERT INTO billing (appointment_id, total_amount, payment_status) VALUES
(
    (SELECT appointment_id FROM appointments WHERE patient_id = (SELECT patient_id FROM patients WHERE first_name = 'Olivia' AND last_name = 'Brown' LIMIT 1) LIMIT 1),
    180.00,
    'Paid'
);

-- -- Test Query: Retrieve patients
-- SELECT patient_id, first_name, last_name, date_of_birth
-- FROM patients;

-- -- Test Query: Retrieve appointments for a specific doctor
-- SELECT
--     a.appointment_id,
--     p.first_name AS patient_first_name,
--     p.last_name AS patient_last_name,
--     a.appointment_date,
--     a.diagnosis
-- FROM
--     appointments a
-- JOIN
--     patients p ON a.patient_id = p.patient_id
-- JOIN
--     doctors d ON a.doctor_id = d.doctor_id
-- WHERE
--     d.first_name = 'Dr. Olivia' AND d.last_name = 'Taylor';
