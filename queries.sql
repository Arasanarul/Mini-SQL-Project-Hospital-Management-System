-- Create doctors table
CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    specialization VARCHAR(50) NOT NULL,
    experience_years INT NOT NULL
);

-- Create patients table
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    city VARCHAR(50)
);

-- Create appointments table
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    fees DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

INSERT INTO doctors (doctor_id, name, specialization, experience_years) VALUES
(1, 'Dr. Arjun', 'Cardiology', 10),
(2, 'Dr. Priya', 'Dermatology', 6),
(3, 'Dr. Kiran', 'ENT', 8),
(4, 'Dr. Sneha', 'Orthopedic', 5),
(5, 'Dr. Manoj', 'Neurology', 12);

INSERT INTO patients (patient_id, name, age, gender, city) VALUES
(1, 'Ramesh', 45, 'Male', 'Chennai'),
(2, 'Kavya', 32, 'Female', 'Madurai'),
(3, 'Hari', 27, 'Male', 'Coimbatore'),
(4, 'Deepa', 40, 'Female', 'Trichy'),
(5, 'Aravind', 55, 'Male', 'Chennai'),
(6, 'Meena', 29, 'Female', 'Salem');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, fees) VALUES
(1, 1, 1, '2025-11-01', 500.00),
(2, 2, 2, '2025-11-02', 400.00),
(3, 3, 1, '2025-11-03', 500.00),
(4, 4, 3, '2025-11-04', 300.00),
(5, 5, 4, '2025-11-04', 600.00),
(6, 6, 2, '2025-11-05', 400.00),
(7, 1, 5, '2025-11-06', 800.00),
(8, 2, 1, '2025-11-07', 500.00),
(9, 3, 4, '2025-11-08', 600.00),
(10, 4, 2, '2025-11-09', 400.00);

select * from doctors;

select * from patients;

select * from appointments;

select name from doctors;

select name from patients where city = 'chennai';

select * from appointments where appointment_date > '2025-11-04';

select * from doctors where experience_years >8;

select * from doctors;

select * from patients;

select * from appointments;

select appointments.appointment_id, patients.name 
from appointments 
	join doctors on appointments.doctor_id = doctors.doctor_id
  join patients on appointments.patient_id = patients.patient_id where appointments.doctor_id = 1;

select * from doctors;

select * from patients;

select * from appointments;

select doctor_id, count(doctor_id) as handled_each from appointments group by doctor_id;

select doctors.doctor_id, doctors.name, count(appointments.doctor_id) as handled_each
 from doctors 
 join appointments on appointments.doctor_id = doctors.doctor_id group by  doctors.doctor_id;
 select doctors.doctor_id, doctors.name, sum(appointments.fees) as consultation
 from doctors 
 join appointments on appointments.doctor_id = doctors.doctor_id group by  doctors.doctor_id;

select * from appointments where fees > 500;

select * from doctors;

select * from patients;

select * from appointments;

SELECT 
    patients.patient_id,
    patients.name AS patient_name,
    patients.age,
    doctors.name AS doctor_name,
    doctors.specialization,
    appointments.appointment_date
FROM appointments
JOIN patients ON appointments.patient_id = patients.patient_id
JOIN doctors ON appointments.doctor_id = doctors.doctor_id
WHERE patients.age > 40
  AND doctors.specialization IN ('Neurology', 'Orthopedic');
