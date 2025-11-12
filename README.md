# 🏥 Mini SQL Project: Hospital Management System

## 🎯 Project Goal
To manage information about patients, doctors, and appointments in a hospital using SQL.  
This project helps you understand table relationships, `JOIN`s, `WHERE` filters, and creating `VIEW`s.

---

## 🧱 1️⃣ Tables to Create

You will create **three tables**:

### **1. doctors**
Stores information about hospital doctors.

| Column Name | Type | Description |
|--------------|------|-------------|
| doctor_id | INT | Unique doctor ID |
| name | VARCHAR(50) | Doctor’s name |
| specialization | VARCHAR(50) | Medical field (e.g., Cardiology, ENT) |
| experience_years | INT | Years of experience |

---

### **2. patients**
Stores information about hospital patients.

| Column Name | Type | Description |
|--------------|------|-------------|
| patient_id | INT | Unique patient ID |
| name | VARCHAR(50) | Patient’s name |
| age | INT | Age |
| gender | VARCHAR(10) | Male/Female |
| city | VARCHAR(50) | Patient’s city |

---

### **3. appointments**
Stores which patient visited which doctor, along with date and fee.

| Column Name | Type | Description |
|--------------|------|-------------|
| appointment_id | INT | Unique appointment ID |
| patient_id | INT | Refers to patient_id from patients table |
| doctor_id | INT | Refers to doctor_id from doctors table |
| appointment_date | DATE | Date of appointment |
| fees | DECIMAL(10,2) | Fee charged for the visit |

---

## 🪜 2️⃣ Steps to Do

### **Step 1 — Create the Tables**
Write `CREATE TABLE` statements for all three tables.

### **Step 2 — Insert Sample Data**
Insert at least:
- 5 doctors  
- 6 patients  
- 10 appointments  

#### Example (you can modify):

**Doctors**
| doctor_id | name | specialization | experience_years |
|------------|------|----------------|------------------|
| 1 | Dr. Arjun | Cardiology | 10 |
| 2 | Dr. Priya | Dermatology | 6 |
| 3 | Dr. Kiran | ENT | 8 |
| 4 | Dr. Sneha | Orthopedic | 5 |
| 5 | Dr. Manoj | Neurology | 12 |

**Patients**
| patient_id | name | age | gender | city |
|-------------|------|-----|--------|------|
| 1 | Ramesh | 45 | Male | Chennai |
| 2 | Kavya | 32 | Female | Madurai |
| 3 | Hari | 27 | Male | Coimbatore |
| 4 | Deepa | 40 | Female | Trichy |
| 5 | Aravind | 55 | Male | Chennai |
| 6 | Meena | 29 | Female | Salem |

**Appointments**
| appointment_id | patient_id | doctor_id | appointment_date | fees |
|----------------|-------------|------------|------------------|------|
| 1 | 1 | 1 | 2025-11-01 | 500 |
| 2 | 2 | 2 | 2025-11-02 | 400 |
| 3 | 3 | 1 | 2025-11-03 | 500 |
| 4 | 4 | 3 | 2025-11-04 | 300 |
| 5 | 5 | 4 | 2025-11-04 | 600 |
| 6 | 6 | 2 | 2025-11-05 | 400 |
| 7 | 1 | 5 | 2025-11-06 | 800 |
| 8 | 2 | 1 | 2025-11-07 | 500 |
| 9 | 3 | 4 | 2025-11-08 | 600 |
| 10 | 4 | 2 | 2025-11-09 | 400 |

---

## 🧩 3️⃣ Queries to Practice

### 🩺 **Basic Retrieval**
- Show all doctors working in the hospital.  
- Show all patients from the city “Chennai”.  
- Show all appointments after `2025-11-04`.  
- Find all doctors who have more than 8 years of experience.  

---

### 🔗 **JOIN Queries**
- Show each appointment with doctor and patient names.  
  *(Use INNER JOIN between appointments, patients, and doctors)*  
- List all patients who visited **Cardiology** doctors.  
- Find how many appointments each doctor handled (`GROUP BY doctor`).  
- Show total consultation fees collected by each doctor.  

---

### 🎯 **Filtering with WHERE**
- Show all appointments where fees are greater than 500.  
- Find patients older than 40 who visited **Neurology** or **Orthopedic** doctors.  

---

### 👁️ **Views**
Create a `VIEW` named **appointment_summary** that displays:
- Doctor name  
- Patient name  
- Appointment date  
- Fees  

```sql
CREATE VIEW appointment_summary AS
SELECT d.name AS doctor_name, p.name AS patient_name, a.appointment_date, a.fees
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN patients p ON a.patient_id = p.patient_id;
```

Use the view to:
- Show all appointments made by patient “Ramesh”.  
- Show total fees collected per doctor using the view.  

---

### 💰 **Bonus (Challenge Tasks)**
- Find the doctor with the highest total earnings.  
- Find the patient who visited the most doctors.  
- List all unique cities from which patients have come.  

---

**📄 Author:** _Arularasan S_  
**📚 Project Type:** Beginner SQL Practice  
**🗓️ Last Updated:** November 2025
