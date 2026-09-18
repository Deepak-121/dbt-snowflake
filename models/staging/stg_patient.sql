{{
    config(
        tags = ["test"]
    )
}}

select
    trim(patient_id) as patient_id,
    trim(mrn) as mrn,
    initcap(trim(first_name)) as first_name,
    initcap(trim(last_name)) as last_name,
    initcap(trim(first_name)) || ' ' || initcap(trim(last_name)) as patient_name,
    date_of_birth,
    datediff(year, date_of_birth, current_date) as age,
    trim(gender) as gender,
    trim(city) as city,
    trim(state) as state,
    trim(phone) as phone,
    trim(email) as email,
    trim(primary_clinician_id) as primary_clinician_id,
    trim(preferred_clinic_site_id) as preferred_clinic_site_id,
    active_flag,
    source_system,
    load_batch_id,
    load_ts,
    current_timestamp() as stg_ts
from {{ source('raw', 'RAW_PATIENT') }}
qualify row_number() over (
        partition by patient_id
        order by load_ts desc, load_batch_id desc
    ) = 1

