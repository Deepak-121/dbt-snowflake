select * from raw.RAW_APPOINTMENT;
select * from HEALTHCARE_AI_DB.STG.stg_appointment;
select * from HEALTHCARE_AI_DB.CORE.fact_appointment

select * from HEALTHCARE_AI_DB.CORE.PATIENT_SNAPSHOT;

select * from healthcare_ai_db.raw.raw_patient where patient_id='P1006';
select * from healthcare_ai_db.stg.stg_patient where patient_id='P1006';
select * from healthcare_ai_db.core.dim_patient where patient_id='P1006';

update healthcare_ai_db.raw.raw_patient 
set phone= 16436111,
load_ts= current_timestamp()
where patient_id='P1006';

select * from HEALTHCARE_AI_DB.CURATED.PATIENT_PROFILE where patient_id='P1006';

show git repositories;
show stages;
show secrets;
show integrations;
desc api integration int_git;
DESC SECRET USER$DEEPAK.PUBLIC.GIT_TOKEN;
select current_role()