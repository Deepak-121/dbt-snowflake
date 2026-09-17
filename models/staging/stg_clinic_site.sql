select
    trim(clinic_site_id) as clinic_site_id,
    trim(clinic_site_name) as clinic_site_name,
    trim(location_id) as location_id,
    trim(site_type) as site_type,
    trim(phone) as phone,
    trim(email) as email,
    trim(operating_hours) as operating_hours,
    active_flag,
    source_system,
    load_batch_id,
    load_ts,
    current_timestamp() as stg_ts
from {{ source('raw', 'RAW_CLINIC_SITE') }}
