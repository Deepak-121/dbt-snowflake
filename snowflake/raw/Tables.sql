-- =====================================================================
-- FILE: 02_01_create_raw_tables.sql
-- MODULE 2: SAMPLE DATA AND ETL
-- Layer: RAW
-- Purpose: Create source-aligned raw tables.
-- =====================================================================


USE DATABASE HEALTHCARE_AI_DB;
USE WAREHOUSE COMPUTE_WH;
USE SCHEMA RAW;

-- ---------------------------------------------------------------------
-- RAW LOCATION
-- ---------------------------------------------------------------------
CREATE OR REPLACE TABLE RAW_LOCATION (
    location_id STRING,
    location_name STRING,
    address_line_1 STRING,
    address_line_2 STRING,
    city STRING,
    state STRING,
    postal_code STRING,
    country STRING,
    location_type STRING,
    active_flag BOOLEAN,
    source_system STRING,
    load_batch_id STRING,
    load_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------
-- RAW CLINIC SITE
-- ---------------------------------------------------------------------
CREATE OR REPLACE TABLE RAW_CLINIC_SITE (
    clinic_site_id STRING,
    clinic_site_name STRING,
    location_id STRING,
    site_type STRING,
    phone STRING,
    email STRING,
    operating_hours STRING,
    active_flag BOOLEAN,
    source_system STRING,
    load_batch_id STRING,
    load_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------
-- RAW CLINICIAN
-- ---------------------------------------------------------------------
CREATE OR REPLACE TABLE RAW_CLINICIAN (
    clinician_id STRING,
    clinician_name STRING,
    specialty STRING,
    clinic_site_id STRING,
    active_flag BOOLEAN,
    source_system STRING,
    load_batch_id STRING,
    load_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------
-- RAW PATIENT
-- ---------------------------------------------------------------------
CREATE OR REPLACE TABLE RAW_PATIENT (
    patient_id STRING,
    mrn STRING,
    first_name STRING,
    last_name STRING,
    date_of_birth DATE,
    gender STRING,
    city STRING,
    state STRING,
    phone STRING,
    email STRING,
    primary_clinician_id STRING,
    preferred_clinic_site_id STRING,
    active_flag BOOLEAN,
    source_system STRING,
    load_batch_id STRING,
    load_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------
-- RAW ENCOUNTER
-- ---------------------------------------------------------------------
CREATE OR REPLACE TABLE RAW_ENCOUNTER (
    encounter_id STRING,
    patient_id STRING,
    encounter_date DATE,
    encounter_type STRING,
    clinician_id STRING,
    clinic_site_id STRING,
    reason_for_visit STRING,
    discharge_disposition STRING,
    source_system STRING,
    load_batch_id STRING,
    load_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------
-- RAW DIAGNOSIS
-- ---------------------------------------------------------------------
CREATE OR REPLACE TABLE RAW_DIAGNOSIS (
    diagnosis_id STRING,
    patient_id STRING,
    encounter_id STRING,
    diagnosis_code STRING,
    diagnosis_description STRING,
    diagnosis_date DATE,
    diagnosis_type STRING,
    source_system STRING,
    load_batch_id STRING,
    load_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------
-- RAW LAB RESULT
-- ---------------------------------------------------------------------
CREATE OR REPLACE TABLE RAW_LAB_RESULT (
    lab_result_id STRING,
    patient_id STRING,
    encounter_id STRING,
    lab_name STRING,
    lab_value FLOAT,
    lab_unit STRING,
    normal_low FLOAT,
    normal_high FLOAT,
    lab_date DATE,
    source_system STRING,
    load_batch_id STRING,
    load_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------
-- RAW MEDICATION
-- ---------------------------------------------------------------------
CREATE OR REPLACE TABLE RAW_MEDICATION (
    medication_id STRING,
    patient_id STRING,
    encounter_id STRING,
    medication_name STRING,
    dosage STRING,
    frequency STRING,
    start_date DATE,
    end_date DATE,
    active_flag BOOLEAN,
    source_system STRING,
    load_batch_id STRING,
    load_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------
-- RAW ALLERGY
-- ---------------------------------------------------------------------
CREATE OR REPLACE TABLE RAW_ALLERGY (
    allergy_id STRING,
    patient_id STRING,
    allergy_name STRING,
    reaction STRING,
    severity STRING,
    recorded_date DATE,
    active_flag BOOLEAN,
    source_system STRING,
    load_batch_id STRING,
    load_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------
-- RAW CLINICAL NOTE
-- ---------------------------------------------------------------------
CREATE OR REPLACE TABLE RAW_CLINICAL_NOTE (
    note_id STRING,
    patient_id STRING,
    encounter_id STRING,
    note_date DATE,
    note_type STRING,
    author_clinician_id STRING,
    note_text STRING,
    source_system STRING,
    load_batch_id STRING,
    load_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------
-- RAW APPOINTMENT
-- ---------------------------------------------------------------------
CREATE OR REPLACE TABLE RAW_APPOINTMENT (
    appointment_id STRING,
    patient_id STRING,
    clinician_id STRING,
    clinic_site_id STRING,
    appointment_date DATE,
    appointment_type STRING,
    appointment_status STRING,
    source_system STRING,
    load_batch_id STRING,
    load_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------
-- RAW BILLING ITEM
-- ---------------------------------------------------------------------
CREATE OR REPLACE TABLE RAW_BILLING_ITEM (
    billing_item_id STRING,
    item_code STRING,
    item_description STRING,
    item_category STRING,
    standard_charge NUMBER(12,2),
    tax_rate NUMBER(5,2),
    active_flag BOOLEAN,
    source_system STRING,
    load_batch_id STRING,
    load_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------
-- RAW INVOICE
-- ---------------------------------------------------------------------
CREATE OR REPLACE TABLE RAW_INVOICE (
    invoice_id STRING,
    patient_id STRING,
    encounter_id STRING,
    clinic_site_id STRING,
    invoice_date DATE,
    due_date DATE,
    invoice_status STRING,
    payer_type STRING,
    insurer_name STRING,
    gross_amount NUMBER(12,2),
    discount_amount NUMBER(12,2),
    tax_amount NUMBER(12,2),
    net_amount NUMBER(12,2),
    paid_amount NUMBER(12,2),
    balance_amount NUMBER(12,2),
    source_system STRING,
    load_batch_id STRING,
    load_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------
-- RAW INVOICE LINE
-- ---------------------------------------------------------------------
CREATE OR REPLACE TABLE RAW_INVOICE_LINE (
    invoice_line_id STRING,
    invoice_id STRING,
    billing_item_id STRING,
    quantity NUMBER(10,2),
    unit_price NUMBER(12,2),
    discount_amount NUMBER(12,2),
    tax_amount NUMBER(12,2),
    line_total NUMBER(12,2),
    source_system STRING,
    load_batch_id STRING,
    load_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------
-- RAW PAYMENT
-- ---------------------------------------------------------------------
CREATE OR REPLACE TABLE RAW_PAYMENT (
    payment_id STRING,
    invoice_id STRING,
    patient_id STRING,
    payment_date DATE,
    payment_method STRING,
    payment_amount NUMBER(12,2),
    payment_status STRING,
    transaction_reference STRING,
    source_system STRING,
    load_batch_id STRING,
    load_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------------------
-- RAW DOCUMENT METADATA
-- ---------------------------------------------------------------------
CREATE OR REPLACE TABLE RAW_DOCUMENT_METADATA (
    document_id STRING,
    patient_id STRING,
    encounter_id STRING,
    document_type STRING,
    document_title STRING,
    document_stage_path STRING,
    document_text STRING,
    document_date DATE,
    source_system STRING,
    load_batch_id STRING,
    load_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP
);



-- =====================================================================
-- 1. RAW APPOINTMENT TABLE
-- =====================================================================


CREATE OR REPLACE TABLE RAW_APPOINTMENT (
    appointment_id STRING,
    patient_id STRING,
    clinician_id STRING,
    clinic_site_id STRING,
    appointment_date DATE,
    appointment_type STRING,
    appointment_status STRING,
    source_system STRING,
    load_batch_id STRING,
    load_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP
)
COMMENT = 'Raw appointment data from source systems';


