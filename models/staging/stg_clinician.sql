select
    trim(clinician_id) as clinician_id,
    initcap(trim(clinician_name)) as clinician_name,
    trim(specialty) as specialty,
    trim(clinic_site_id) as clinic_site_id,
    active_flag,
    source_system,
    load_batch_id,
    load_ts,
    current_timestamp() as stg_ts
from {{ source('raw', 'RAW_CLINICIAN') }}
