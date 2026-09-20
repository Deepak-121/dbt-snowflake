{{
    config(
        tags = ["test"]
    )
}}

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
from {{ source('raw', 'RAW_APPOINTMENT') }} 
qualify row_number() over (partition by appointment_id order by load_ts desc) = 1