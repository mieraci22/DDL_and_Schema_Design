-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialty VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100),
    DOB DATE,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Diseases (
    DiseaseID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT
);

CREATE TABLE Visits (
    VisitID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    VisitDate DATE,
    Diagnosis TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE VisitDiseases (
    VisitID INT,
    DiseaseID INT,
    PRIMARY KEY (VisitID, DiseaseID),
    FOREIGN KEY (VisitID) REFERENCES Visits(VisitID),
    FOREIGN KEY (DiseaseID) REFERENCES Diseases(DiseaseID)
);


INSERT INTO Doctors (DoctorID, Name, Specialty, PhoneNumber, Email) VALUES
(1, 'Dr. Smith', 'Cardiology', '123-456-7890', 'smith@medicalcenter.com'),
(2, 'Dr. Jones', 'Neurology', '234-567-8901', 'jones@medicalcenter.com');

INSERT INTO Patients (PatientID, Name, DOB, Address, PhoneNumber, Email) VALUES
(1, 'John Doe', '1980-01-01', '123 Elm St', '345-678-9012', 'johndoe@example.com'),
(2, 'Jane Roe', '1990-02-02', '456 Oak St', '456-789-0123', 'janeroe@example.com');

INSERT INTO Diseases (DiseaseID, Name, Description) VALUES
(1, 'Flu', 'Influenza, a viral infection'),
(2, 'Hypertension', 'High blood pressure');

INSERT INTO Visits (VisitID, PatientID, DoctorID, VisitDate, Diagnosis) VALUES
(1, 1, 1, '2024-06-01', 'Flu and Hypertension'),
(2, 2, 2, '2024-06-02', 'Hypertension');

INSERT INTO VisitDiseases (VisitID, DiseaseID) VALUES
(1, 1),
(1, 2),
(2, 2);