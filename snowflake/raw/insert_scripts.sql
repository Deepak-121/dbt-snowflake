-- =====================================================================
-- FILE: 02_02_insert_synthetic_data.sql
-- MODULE 2: SAMPLE DATA AND ETL
-- Layer: RAW
-- Purpose: Insert synthetic enterprise healthcare data.
-- =====================================================================

USE DATABASE HEALTHCARE_AI_DB;
USE WAREHOUSE COMPUTE_WH;
USE SCHEMA RAW;

SET LOAD_BATCH_ID = 'BATCH_20260808_001';

-- =====================================================================
-- 2. LOAD SYNTHETIC APPOINTMENT DATA
-- =====================================================================

SET LOAD_BATCH_ID = 'BATCH_20260808_001';


INSERT INTO RAW_APPOINTMENT (
    appointment_id,
    patient_id,
    clinician_id,
    clinic_site_id,
    appointment_date,
    appointment_type,
    appointment_status,
    source_system,
    load_batch_id,
    load_ts
)
VALUES
('AP9001', 'P1001', 'CL003', 'SITE002', '2026-06-25', 'Diabetes follow-up', 'Missed',    'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('AP9002', 'P1001', 'CL003', 'SITE002', '2026-08-20', 'Diabetes follow-up', 'Scheduled', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('AP9003', 'P1002', 'CL002', 'SITE003', '2026-06-20', 'Cardiology follow-up', 'Completed', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('AP9004', 'P1005', 'CL002', 'SITE003', '2026-02-20', 'Cardiology follow-up', 'Completed', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('AP9005', 'P1006', 'CL004', 'SITE001', '2026-06-30', 'Asthma review', 'Cancelled', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('AP9006', 'P1008', 'CL001', 'SITE001', '2026-07-09', 'Renal function review', 'Missed', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('AP9007', 'P1005', 'CL002', 'SITE003', '2026-09-16', 'Cardiology follow-up', 'Completed', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

INSERT INTO RAW_APPOINTMENT values
('AP9007', 'P1005', 'CL002', 'SITE003', '2026-09-16', 'Cardiology follow-up', 'Completed', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

-- ---------------------------------------------------------------------
-- LOCATION
-- ---------------------------------------------------------------------
INSERT INTO RAW_LOCATION VALUES
('LOC001', 'Noida Sector 62 Medical Campus', 'A-12 Sector 62', NULL, 'Noida', 'Uttar Pradesh', '201309', 'India', 'Medical Campus', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('LOC002', 'Delhi South Health Centre', 'B-8 Saket', NULL, 'Delhi', 'Delhi', '110017', 'India', 'Clinic Location', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('LOC003', 'Gurugram Cardiac Centre', 'Golf Course Road', NULL, 'Gurugram', 'Haryana', '122002', 'India', 'Specialty Centre', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('LOC004', 'Noida Diagnostic Hub', 'Sector 18', NULL, 'Noida', 'Uttar Pradesh', '201301', 'India', 'Diagnostic Location', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

-- ---------------------------------------------------------------------
-- CLINIC SITE
-- ---------------------------------------------------------------------
INSERT INTO RAW_CLINIC_SITE VALUES
('SITE001', 'North Care Hospital OPD', 'LOC001', 'Hospital OPD', '0120-4000001', 'opd.northcare@example.com', 'Mon-Sat 08:00-20:00', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('SITE002', 'City Diabetes Clinic', 'LOC002', 'Diabetes Clinic', '011-4000002', 'diabetes.city@example.com', 'Mon-Sat 09:00-18:00', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('SITE003', 'Heart Wellness Centre', 'LOC003', 'Cardiology Clinic', '0124-4000003', 'heart.wellness@example.com', 'Mon-Fri 09:00-17:00', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('SITE004', 'Metro Diagnostic Lab', 'LOC004', 'Diagnostic Lab', '0120-4000004', 'lab.metro@example.com', 'Mon-Sun 07:00-22:00', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

-- ---------------------------------------------------------------------
-- CLINICIAN
-- ---------------------------------------------------------------------
INSERT INTO RAW_CLINICIAN VALUES
('CL001', 'Dr. Ananya Sharma', 'Internal Medicine', 'SITE001', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('CL002', 'Dr. Rahul Mehta', 'Cardiology', 'SITE003', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('CL003', 'Dr. Priya Nair', 'Endocrinology', 'SITE002', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('CL004', 'Dr. Sameer Khan', 'Pulmonology', 'SITE001', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('CL005', 'Dr. Neha Gupta', 'General Practice', 'SITE001', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

-- ---------------------------------------------------------------------
-- PATIENT
-- ---------------------------------------------------------------------
INSERT INTO RAW_PATIENT VALUES
('P1001', 'MRN1001', 'Amit', 'Verma', '1972-04-12', 'Male', 'Noida', 'Uttar Pradesh', '9999000001', 'amit.verma@example.com', 'CL003', 'SITE002', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('P1002', 'MRN1002', 'Sunita', 'Rao', '1965-09-20', 'Female', 'Delhi', 'Delhi', '9999000002', 'sunita.rao@example.com', 'CL002', 'SITE003', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('P1003', 'MRN1003', 'Rohit', 'Malhotra', '1984-01-15', 'Male', 'Gurugram', 'Haryana', '9999000003', 'rohit.malhotra@example.com', 'CL001', 'SITE001', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('P1004', 'MRN1004', 'Meera', 'Iyer', '1990-07-30', 'Female', 'Noida', 'Uttar Pradesh', '9999000004', 'meera.iyer@example.com', 'CL005', 'SITE001', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('P1005', 'MRN1005', 'Karan', 'Singh', '1958-11-05', 'Male', 'Delhi', 'Delhi', '9999000005', 'karan.singh@example.com', 'CL002', 'SITE003', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('P1006', 'MRN1006', 'Nisha', 'Kapoor', '1978-03-22', 'Female', 'Noida', 'Uttar Pradesh', '9999000006', 'nisha.kapoor@example.com', 'CL004', 'SITE001', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('P1007', 'MRN1007', 'Arjun', 'Bose', '2001-12-02', 'Male', 'Delhi', 'Delhi', '9999000007', 'arjun.bose@example.com', 'CL005', 'SITE001', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('P1008', 'MRN1008', 'Lakshmi', 'Menon', '1949-06-18', 'Female', 'Gurugram', 'Haryana', '9999000008', 'lakshmi.menon@example.com', 'CL001', 'SITE001', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

INSERT INTO RAW_PATIENT VALUES
('P1006', 'MRN1006', 'Nisha', 'Kapoor', '1978-03-22', 'Female', 'Noida', 'Uttar Pradesh', '13164164968', 'nisha.kapoor@example.com', 'CL004', 'SITE001', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);



-- ---------------------------------------------------------------------
-- ENCOUNTER
-- ---------------------------------------------------------------------
INSERT INTO RAW_ENCOUNTER VALUES
('E2001', 'P1001', '2026-01-10', 'Outpatient', 'CL003', 'SITE002', 'Diabetes follow-up', 'Discharged home', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('E2002', 'P1001', '2026-05-18', 'Emergency', 'CL001', 'SITE001', 'Dizziness and fatigue', 'Discharged home', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('E2003', 'P1002', '2026-02-12', 'Outpatient', 'CL002', 'SITE003', 'Chest discomfort', 'Follow-up advised', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('E2004', 'P1002', '2026-06-05', 'Inpatient', 'CL002', 'SITE001', 'Shortness of breath', 'Discharged with medication', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('E2005', 'P1003', '2026-03-21', 'Outpatient', 'CL001', 'SITE001', 'Annual health check', 'Discharged home', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('E2006', 'P1004', '2026-04-04', 'Outpatient', 'CL005', 'SITE001', 'Migraine consultation', 'Discharged home', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('E2007', 'P1005', '2026-01-29', 'Emergency', 'CL002', 'SITE001', 'Chest pain', 'Admitted', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('E2008', 'P1005', '2026-02-03', 'Inpatient', 'CL002', 'SITE001', 'Post cardiac evaluation', 'Discharged with follow-up', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('E2009', 'P1006', '2026-05-12', 'Outpatient', 'CL004', 'SITE001', 'Asthma review', 'Discharged home', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('E2010', 'P1007', '2026-06-16', 'Outpatient', 'CL005', 'SITE001', 'Fever and cough', 'Discharged home', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('E2011', 'P1008', '2026-07-01', 'Emergency', 'CL001', 'SITE001', 'Fall and weakness', 'Observation advised', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

-- ---------------------------------------------------------------------
-- DIAGNOSIS
-- ---------------------------------------------------------------------
INSERT INTO RAW_DIAGNOSIS VALUES
('D3001', 'P1001', 'E2001', 'E11.9', 'Type 2 diabetes mellitus without complications', '2026-01-10', 'Chronic', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('D3002', 'P1001', 'E2002', 'I10', 'Essential hypertension', '2026-05-18', 'Chronic', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('D3003', 'P1002', 'E2003', 'I20.9', 'Angina pectoris unspecified', '2026-02-12', 'Active', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('D3004', 'P1002', 'E2004', 'I50.9', 'Heart failure unspecified', '2026-06-05', 'Active', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('D3005', 'P1003', 'E2005', 'Z00.0', 'General adult medical examination', '2026-03-21', 'Screening', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('D3006', 'P1004', 'E2006', 'G43.9', 'Migraine unspecified', '2026-04-04', 'Active', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('D3007', 'P1005', 'E2007', 'I21.9', 'Acute myocardial infarction unspecified', '2026-01-29', 'Acute', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('D3008', 'P1005', 'E2008', 'I25.10', 'Atherosclerotic heart disease', '2026-02-03', 'Chronic', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('D3009', 'P1006', 'E2009', 'J45.909', 'Asthma unspecified uncomplicated', '2026-05-12', 'Chronic', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('D3010', 'P1007', 'E2010', 'J06.9', 'Acute upper respiratory infection', '2026-06-16', 'Acute', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('D3011', 'P1008', 'E2011', 'R53.1', 'Weakness', '2026-07-01', 'Active', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('D3012', 'P1008', 'E2011', 'E86.0', 'Dehydration', '2026-07-01', 'Acute', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

-- ---------------------------------------------------------------------
-- LAB RESULT
-- ---------------------------------------------------------------------
INSERT INTO RAW_LAB_RESULT VALUES
('L4001', 'P1001', 'E2001', 'HbA1c', 8.6, '%', 4.0, 5.6, '2026-01-10', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('L4002', 'P1001', 'E2002', 'HbA1c', 8.9, '%', 4.0, 5.6, '2026-05-18', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('L4003', 'P1001', 'E2002', 'LDL Cholesterol', 142, 'mg/dL', 0, 100, '2026-05-18', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('L4004', 'P1002', 'E2003', 'Troponin', 0.03, 'ng/mL', 0, 0.04, '2026-02-12', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('L4005', 'P1002', 'E2004', 'BNP', 520, 'pg/mL', 0, 100, '2026-06-05', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('L4006', 'P1003', 'E2005', 'HbA1c', 5.4, '%', 4.0, 5.6, '2026-03-21', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('L4007', 'P1004', 'E2006', 'Hemoglobin', 12.8, 'g/dL', 12.0, 16.0, '2026-04-04', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('L4008', 'P1005', 'E2007', 'Troponin', 0.21, 'ng/mL', 0, 0.04, '2026-01-29', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('L4009', 'P1005', 'E2008', 'LDL Cholesterol', 168, 'mg/dL', 0, 100, '2026-02-03', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('L4010', 'P1006', 'E2009', 'Peak Flow', 320, 'L/min', 400, 700, '2026-05-12', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('L4011', 'P1008', 'E2011', 'Creatinine', 1.7, 'mg/dL', 0.6, 1.2, '2026-07-01', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('L4012', 'P1008', 'E2011', 'Sodium', 130, 'mmol/L', 135, 145, '2026-07-01', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

-- ---------------------------------------------------------------------
-- MEDICATION
-- ---------------------------------------------------------------------
INSERT INTO RAW_MEDICATION VALUES
('M5001', 'P1001', 'E2001', 'Metformin', '1000 mg', 'Twice daily', '2026-01-10', NULL, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('M5002', 'P1001', 'E2002', 'Amlodipine', '5 mg', 'Once daily', '2026-05-18', NULL, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('M5003', 'P1002', 'E2004', 'Furosemide', '40 mg', 'Once daily', '2026-06-05', NULL, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('M5004', 'P1002', 'E2004', 'Bisoprolol', '2.5 mg', 'Once daily', '2026-06-05', NULL, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('M5005', 'P1004', 'E2006', 'Sumatriptan', '50 mg', 'As needed', '2026-04-04', NULL, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('M5006', 'P1005', 'E2008', 'Aspirin', '75 mg', 'Once daily', '2026-02-03', NULL, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('M5007', 'P1005', 'E2008', 'Atorvastatin', '40 mg', 'Once daily', '2026-02-03', NULL, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('M5008', 'P1006', 'E2009', 'Salbutamol Inhaler', '100 mcg', 'As needed', '2026-05-12', NULL, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('M5009', 'P1008', 'E2011', 'Oral Rehydration Solution', '200 ml', 'Three times daily', '2026-07-01', '2026-07-05', FALSE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

-- ---------------------------------------------------------------------
-- ALLERGY
-- ---------------------------------------------------------------------
INSERT INTO RAW_ALLERGY VALUES
('A6001', 'P1001', 'Penicillin', 'Rash', 'Moderate', '2025-10-10', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('A6002', 'P1002', 'Sulfa drugs', 'Swelling', 'Severe', '2025-08-14', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('A6003', 'P1005', 'Ibuprofen', 'Gastric irritation', 'Mild', '2024-12-22', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('A6004', 'P1008', 'No known allergy', 'None', 'None', '2026-07-01', TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

-- ---------------------------------------------------------------------
-- CLINICAL NOTE
-- ---------------------------------------------------------------------
INSERT INTO RAW_CLINICAL_NOTE VALUES
('N8001', 'P1001', 'E2001', '2026-01-10', 'Progress Note', 'CL003', 'Patient with known type 2 diabetes. HbA1c is elevated at 8.6. Patient reports inconsistent diet control and missed evening doses occasionally. Continue Metformin and reinforce diet and exercise. Follow-up in 3 months.', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('N8002', 'P1001', 'E2002', '2026-05-18', 'Emergency Note', 'CL001', 'Patient presented with dizziness and fatigue. Blood pressure elevated. HbA1c remains high at 8.9 and LDL is elevated. Started Amlodipine. Needs diabetes and hypertension follow-up within 4 weeks.', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('N8003', 'P1002', 'E2004', '2026-06-05', 'Discharge Summary', 'CL002', 'Patient admitted with shortness of breath and suspected heart failure exacerbation. BNP elevated. Started Furosemide and Bisoprolol. Advised low salt diet, daily weight monitoring, and cardiology follow-up in 2 weeks.', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('N8004', 'P1005', 'E2007', '2026-01-29', 'Emergency Note', 'CL002', 'Patient presented with acute chest pain. Troponin elevated. Managed as acute myocardial infarction and admitted for further cardiac evaluation.', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('N8005', 'P1005', 'E2008', '2026-02-03', 'Discharge Summary', 'CL002', 'Post cardiac event evaluation completed. LDL elevated. Started Aspirin and Atorvastatin. Cardiac rehabilitation and cardiology follow-up advised. Patient should report any recurrent chest pain immediately.', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('N8006', 'P1006', 'E2009', '2026-05-12', 'Progress Note', 'CL004', 'Asthma review visit. Patient reports increased inhaler use during dust exposure. Peak flow below expected range. Continue rescue inhaler and review inhaler technique. Follow-up if symptoms worsen.', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('N8007', 'P1008', 'E2011', '2026-07-01', 'Emergency Note', 'CL001', 'Elderly patient presented after fall with weakness and dehydration. Sodium low and creatinine elevated. Oral hydration advised and renal function repeat test recommended within 1 week.', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

-- ---------------------------------------------------------------------
-- APPOINTMENT
-- ---------------------------------------------------------------------
INSERT INTO RAW_APPOINTMENT VALUES
('AP9001', 'P1001', 'CL003', 'SITE002', '2026-06-25', 'Diabetes follow-up', 'Missed', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('AP9002', 'P1001', 'CL003', 'SITE002', '2026-08-20', 'Diabetes follow-up', 'Scheduled', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('AP9003', 'P1002', 'CL002', 'SITE003', '2026-06-20', 'Cardiology follow-up', 'Completed', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('AP9004', 'P1005', 'CL002', 'SITE003', '2026-02-20', 'Cardiology follow-up', 'Completed', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('AP9005', 'P1006', 'CL004', 'SITE001', '2026-06-30', 'Asthma review', 'Cancelled', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('AP9006', 'P1008', 'CL001', 'SITE001', '2026-07-09', 'Renal function review', 'Missed', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

-- ---------------------------------------------------------------------
-- BILLING ITEM
-- ---------------------------------------------------------------------
INSERT INTO RAW_BILLING_ITEM VALUES
('BI001', 'CONS-GP', 'General consultation', 'Consultation', 800, 0, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('BI002', 'CONS-SPEC', 'Specialist consultation', 'Consultation', 1500, 0, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('BI003', 'LAB-HBA1C', 'HbA1c test', 'Laboratory', 600, 0, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('BI004', 'LAB-LDL', 'LDL cholesterol test', 'Laboratory', 450, 0, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('BI005', 'LAB-TROP', 'Troponin test', 'Laboratory', 1800, 0, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('BI006', 'ER-BASIC', 'Emergency room basic charge', 'Emergency', 5000, 0, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('BI007', 'IPD-DAY', 'Inpatient room charge per day', 'Inpatient', 7000, 0, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('BI008', 'CARD-EVAL', 'Cardiac evaluation package', 'Procedure', 22000, 0, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('BI009', 'XRAY-CHEST', 'Chest X-ray', 'Radiology', 900, 0, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('BI010', 'NEBULIZATION', 'Nebulization session', 'Procedure', 700, 0, TRUE, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

-- ---------------------------------------------------------------------
-- INVOICE
-- ---------------------------------------------------------------------
INSERT INTO RAW_INVOICE VALUES
('INV1001', 'P1001', 'E2001', 'SITE002', '2026-01-10', '2026-01-20', 'Paid', 'Self Pay', NULL, 1400, 0, 0, 1400, 1400, 0, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('INV1002', 'P1001', 'E2002', 'SITE001', '2026-05-18', '2026-05-28', 'Partially Paid', 'Self Pay', NULL, 6050, 500, 0, 5550, 3000, 2550, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('INV1003', 'P1002', 'E2004', 'SITE001', '2026-06-05', '2026-06-20', 'Paid', 'Insurance', 'Acme Health Insurance', 32000, 2000, 0, 30000, 30000, 0, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('INV1004', 'P1005', 'E2007', 'SITE001', '2026-01-29', '2026-02-10', 'Paid', 'Insurance', 'Bharat Health Cover', 28800, 0, 0, 28800, 28800, 0, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('INV1005', 'P1005', 'E2008', 'SITE001', '2026-02-03', '2026-02-15', 'Submitted', 'Insurance', 'Bharat Health Cover', 43000, 3000, 0, 40000, 25000, 15000, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('INV1006', 'P1008', 'E2011', 'SITE001', '2026-07-01', '2026-07-10', 'Overdue', 'Self Pay', NULL, 7600, 600, 0, 7000, 2000, 5000, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

-- ---------------------------------------------------------------------
-- INVOICE LINE
-- ---------------------------------------------------------------------
INSERT INTO RAW_INVOICE_LINE VALUES
('IL1001', 'INV1001', 'BI002', 1, 1500, 100, 0, 1400, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('IL1002', 'INV1002', 'BI006', 1, 5000, 500, 0, 4500, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('IL1003', 'INV1002', 'BI003', 1, 600, 0, 0, 600, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('IL1004', 'INV1002', 'BI004', 1, 450, 0, 0, 450, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('IL1005', 'INV1003', 'BI007', 2, 7000, 1000, 0, 13000, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('IL1006', 'INV1003', 'BI002', 1, 1500, 0, 0, 1500, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('IL1007', 'INV1003', 'BI008', 1, 17500, 1000, 0, 16500, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('IL1008', 'INV1004', 'BI006', 1, 5000, 0, 0, 5000, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('IL1009', 'INV1004', 'BI005', 1, 1800, 0, 0, 1800, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('IL1010', 'INV1004', 'BI008', 1, 22000, 0, 0, 22000, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('IL1011', 'INV1005', 'BI007', 3, 7000, 1000, 0, 20000, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('IL1012', 'INV1005', 'BI008', 1, 23000, 2000, 0, 21000, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('IL1013', 'INV1006', 'BI006', 1, 5000, 500, 0, 4500, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('IL1014', 'INV1006', 'BI002', 1, 1500, 100, 0, 1400, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('IL1015', 'INV1006', 'BI009', 1, 1100, 0, 0, 1100, 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

-- ---------------------------------------------------------------------
-- PAYMENT
-- ---------------------------------------------------------------------
INSERT INTO RAW_PAYMENT VALUES
('PAY1001', 'INV1001', 'P1001', '2026-01-10', 'UPI', 1400, 'Completed', 'TXN1001', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('PAY1002', 'INV1002', 'P1001', '2026-05-18', 'Card', 3000, 'Completed', 'TXN1002', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('PAY1003', 'INV1003', 'P1002', '2026-06-15', 'Insurance', 30000, 'Completed', 'INS1003', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('PAY1004', 'INV1004', 'P1005', '2026-02-05', 'Insurance', 28800, 'Completed', 'INS1004', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('PAY1005', 'INV1005', 'P1005', '2026-02-12', 'Insurance', 25000, 'Completed', 'INS1005', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('PAY1006', 'INV1006', 'P1008', '2026-07-02', 'Cash', 2000, 'Completed', 'CASH1006', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

-- ---------------------------------------------------------------------
-- DOCUMENT METADATA
-- ---------------------------------------------------------------------
INSERT INTO RAW_DOCUMENT_METADATA VALUES
('DOC1001', 'P1001', 'E2001', 'Clinical Note', 'Diabetes follow-up note', '@patient_docs/p1001/e2001_note.txt', 'Diabetes follow-up note. HbA1c elevated. Diet and medication adherence discussed.', '2026-01-10', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('DOC1002', 'P1002', 'E2004', 'Discharge Summary', 'Heart failure discharge summary', '@patient_docs/p1002/e2004_discharge.txt', 'Heart failure exacerbation discharge summary. Low salt diet and cardiology follow-up advised.', '2026-06-05', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP),
('DOC1003', 'P1005', 'E2008', 'Discharge Summary', 'Cardiac event discharge summary', '@patient_docs/p1005/e2008_discharge.txt', 'Post cardiac event discharge summary. Aspirin, statin and cardiac rehabilitation advised.', '2026-02-03', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);
