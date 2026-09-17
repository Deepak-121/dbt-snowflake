select
    clinic_site_id,
    clinic_site_name,
    location_id,
    site_type,
    phone,
    email,
    operating_hours,
    active_flag,
    source_system,
    load_batch_id,
    load_ts,
    stg_ts,
    current_timestamp() as core_ts
from {{ ref('stg_clinic_site') }}
