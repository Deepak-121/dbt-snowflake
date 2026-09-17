select
    clinician_id,
    clinician_name,
    specialty,
    clinic_site_id,
    active_flag,
    source_system,
    load_batch_id,
    load_ts,
    stg_ts,
    current_timestamp() as core_ts
from {{ ref('stg_clinician') }}
