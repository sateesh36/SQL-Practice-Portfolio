-- InsurancePlans
CREATE TABLE InsurancePlans (
    insurance_id INT PRIMARY KEY,
    plan_name VARCHAR(50),
    provider VARCHAR(50),
    coverage_type VARCHAR(20)
);

-- Patients
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender CHAR(1),
    insurance_id INT NULL,
    FOREIGN KEY (insurance_id) REFERENCES InsurancePlans(insurance_id)
);

-- Doctors
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialty VARCHAR(100),
    hospital VARCHAR(100)
);

-- Medications
CREATE TABLE Medications (
    medication_id INT PRIMARY KEY,
    medication_name VARCHAR(100),
    manufacturer VARCHAR(100),
    category VARCHAR(50)
);

-- Prescriptions
CREATE TABLE Prescriptions (
    prescription_id INT PRIMARY KEY,
    patient_id INT,
    medication_id INT,
    doctor_id INT,
    prescription_date DATE,
    quantity INT,
    refills_allowed INT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (medication_id) REFERENCES Medications(medication_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- PharmacyClaims
CREATE TABLE PharmacyClaims (
    claim_id INT PRIMARY KEY,
    prescription_id INT,
    claim_date DATE,
    filled_quantity INT,
    copay_amount DECIMAL(10,2),
    insurance_paid_amount DECIMAL(10,2),
    status VARCHAR(10), -- 'Paid', 'Denied', 'Pending'
    FOREIGN KEY (prescription_id) REFERENCES Prescriptions(prescription_id)
);

-- Insert data (same as before)
INSERT INTO InsurancePlans (insurance_id, plan_name, provider, coverage_type) VALUES
(1, 'Basic Care', 'BlueCross', 'HMO'),
(2, 'Standard Plus', 'BlueCross', 'PPO'),
(3, 'Premium Choice', 'Aetna', 'PPO'),
(4, 'MediGold', 'Medicare', 'Medicare Advantage'),
(5, NULL, 'Cigna', 'HMO');

INSERT INTO Patients (patient_id, first_name, last_name, date_of_birth, gender, insurance_id) VALUES
(1, 'John', 'Doe', '1985-03-15', 'M', 1),
(2, 'Jane', 'Smith', '1990-07-22', 'F', 2),
(3, 'Robert', 'Johnson', '1972-11-02', 'M', 3),
(4, 'Emily', 'Davis', '1965-05-30', 'F', 4),
(5, 'Michael', 'Brown', '2000-09-10', 'M', NULL),
(6, 'Linda', 'Wilson', '1955-12-18', 'F', 5),
(7, 'David', 'Martinez', '1988-04-25', 'M', 1),
(8, 'Sarah', 'Anderson', '1995-08-14', 'F', 2),
(9, 'James', 'Thomas', '1979-01-05', 'M', NULL),
(10, 'Patricia', 'Jackson', '1960-06-20', 'F', 3),
(11, 'Charles', 'White', '1948-09-12', 'M', 4),
(12, 'Jennifer', 'Harris', '1992-02-28', 'F', 5);

INSERT INTO Doctors (doctor_id, first_name, last_name, specialty, hospital) VALUES
(1, 'Gregory', 'House', 'Diagnostic Medicine', 'Princeton Plainsboro'),
(2, 'Lisa', 'Cuddy', 'Endocrinology', 'Princeton Plainsboro'),
(3, 'James', 'Wilson', 'Oncology', 'Princeton Plainsboro'),
(4, 'Eric', 'Foreman', 'Neurology', 'Princeton Plainsboro'),
(5, 'Allison', 'Cameron', 'Immunology', 'Princeton Plainsboro');

INSERT INTO Medications (medication_id, medication_name, manufacturer, category) VALUES
(1, 'Amoxicillin 500mg', 'Generic Pharma', 'Antibiotic'),
(2, 'Lisinopril 10mg', 'HeartHealth Inc', 'Cardiovascular'),
(3, 'Metformin 850mg', 'Diabeticare', 'Antidiabetic'),
(4, 'Atorvastatin 20mg', 'Lipitor Co', 'Cardiovascular'),
(5, 'Albuterol HFA', 'Respirex', 'Respiratory'),
(6, 'Levothyroxine 50mcg', 'ThyroMed', 'Hormone'),
(7, 'Ibuprofen 400mg', 'PainAway', 'Analgesic'),
(8, 'Omeprazole 20mg', 'AcidRedux', 'Gastrointestinal');

INSERT INTO Prescriptions (prescription_id, patient_id, medication_id, doctor_id, prescription_date, quantity, refills_allowed) VALUES
(1, 1, 1, 1, '2024-01-10', 30, 2),
(2, 2, 2, 2, '2024-01-15', 30, 3),
(3, 3, 3, 3, '2024-01-20', 60, 1),
(4, 4, 4, 4, '2024-01-25', 30, 0),
(5, 5, 5, 5, '2024-02-01', 1, 0),
(6, 6, 6, 1, '2024-02-10', 90, 2),
(7, 7, 7, 2, '2024-02-15', 60, 0),
(8, 8, 8, 3, '2024-02-20', 30, 1),
(9, 9, 1, 4, '2024-03-01', 30, 2),
(10, 10, 2, 5, '2024-03-05', 30, 3),
(11, 11, 3, 1, '2024-03-10', 60, 1),
(12, 12, 4, 2, '2024-03-15', 30, 0),
(13, 1, 5, 3, '2024-03-20', 1, 0),
(14, 2, 6, 4, '2024-04-01', 90, 2),
(15, 3, 7, 5, '2024-04-05', 60, 1),
(16, 4, 8, 1, '2024-04-10', 30, 0),
(17, 5, 1, 2, '2024-04-15', 30, 2),
(18, 6, 2, 3, '2024-04-20', 30, 3),
(19, 7, 3, 4, '2024-05-01', 60, 1),
(20, 8, 4, 5, '2024-05-05', 30, 0),
(21, 9, 5, 1, '2024-05-10', 1, 0),
(22, 10, 6, 2, '2024-05-15', 90, 2),
(23, 11, 7, 3, '2024-05-20', 60, 1),
(24, 12, 8, 4, '2024-05-25', 30, 0);

INSERT INTO PharmacyClaims (claim_id, prescription_id, claim_date, filled_quantity, copay_amount, insurance_paid_amount, status) VALUES
(1, 1, '2024-01-12', 30, 10.00, 50.00, 'Paid'),
(2, 2, '2024-01-17', 30, 15.00, 85.00, 'Paid'),
(3, 3, '2024-01-22', 60, 5.00, 120.00, 'Paid'),
(4, 4, '2024-01-27', 30, 20.00, 45.00, 'Denied'),
(5, 5, '2024-02-03', 1, 25.00, 75.00, 'Paid'),
(6, 6, '2024-02-12', 90, 10.00, 200.00, 'Paid'),
(7, 7, '2024-02-17', 60, 7.50, 30.00, 'Paid'),
(8, 8, '2024-02-22', 30, 12.00, 90.00, 'Paid'),
(9, 9, '2024-03-03', 30, 10.00, 50.00, 'Paid'),
(10, 10, '2024-03-07', 30, 15.00, 85.00, 'Paid'),
(11, 11, '2024-03-12', 60, 5.00, 120.00, 'Paid'),
(12, 12, '2024-03-17', 30, 20.00, 45.00, 'Pending'),
(13, 13, '2024-03-22', 1, 25.00, 75.00, 'Paid'),
(14, 14, '2024-04-03', 90, 10.00, 200.00, 'Paid'),
(15, 15, '2024-04-07', 60, 7.50, 30.00, 'Paid'),
(16, 16, '2024-04-12', 30, 12.00, 90.00, 'Denied'),
(17, 17, '2024-04-17', 30, 10.00, 50.00, 'Paid'),
(18, 18, '2024-04-22', 30, 15.00, 85.00, 'Paid'),
(19, 19, '2024-05-03', 60, 5.00, 120.00, 'Paid'),
(20, 20, '2024-05-07', 30, 20.00, 45.00, 'Paid'),
(21, 21, '2024-05-12', 1, 25.00, 75.00, 'Paid'),
(22, 22, '2024-05-17', 90, 10.00, 200.00, 'Paid'),
(23, 23, '2024-05-22', 60, 7.50, 30.00, 'Pending'),
(24, 24, '2024-05-27', 30, 12.00, 90.00, 'Paid');