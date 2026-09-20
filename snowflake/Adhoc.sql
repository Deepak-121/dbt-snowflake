SET LOAD_BATCH_ID = 'BATCH_20260920_001';

select * from raw.RAW_APPOINTMENT;
select * from HEALTHCARE_AI_DB.STG.stg_appointment;
select * from HEALTHCARE_AI_DB.CORE.fact_appointment

select * from HEALTHCARE_AI_DB.CORE.PATIENT_SNAPSHOT;

select * from healthcare_ai_db.raw.raw_patient where patient_id='P1006';
select * from healthcare_ai_db.stg.stg_patient where patient_id='P1006';
select * from healthcare_ai_db.core.dim_patient where patient_id='P1006';


INSERT INTO RAW_APPOINTMENT values
('AP9007', 'P1009', 'CL002', 'SITE003', '2026-09-16', 'Cardiology follow-up', 'Completed', 'ENTERPRISE_SYNTH', $LOAD_BATCH_ID, CURRENT_TIMESTAMP);

update  HEALTHCARE_AI_DB.stg.stg_APPOINTMENT
set patient_id ='P1005', appointment_status='Scheduled',appointment_id= 'AP9008'
where appointment_id= 'AP9007'
select * from RAW_APPOINTMENT qualify row_number() over (partition by appointment_id order by load_ts desc, load_batch_id desc) = 1


  delete  from HEALTHCARE_AI_DB.CORE.fact_appointment where appointment_id='AP9008' and patient_id='P1009'
    group by appointment_status
    
 
select * from HEALTHCARE_AI_DB.CORE.fact_appointment
select * from HEALTHCARE_AI_DB.raw.RAW_APPOINTMENT where appointment_id='AP9008';

select
    trim(appointment_id) as appointment_id,
    trim(patient_id) as patient_id,
    trim(clinician_id) as clinician_id,
    trim(clinic_site_id) as clinic_site_id,
    appointment_date,
    trim(appointment_type) as appointment_type,
    trim(appointment_status) as appointment_status,
    source_system,
    load_batch_id,
    load_ts,
    current_timestamp() as stg_ts
from raw.RAW_APPOINTMENT
qualify row_number() over (partition by appointment_id order by load_ts desc) = 1;
