select
    location_id,
    location_name,
    address_line_1,
    address_line_2,
    city,
    state,
    postal_code,
    country,
    location_type,
    active_flag,
    source_system,
    load_batch_id,
    load_ts,
    stg_ts,
    current_timestamp() as core_ts
from {{ ref('stg_location') }}
