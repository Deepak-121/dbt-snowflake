select
    trim(location_id) as location_id,
    trim(location_name) as location_name,
    trim(address_line_1) as address_line_1,
    trim(address_line_2) as address_line_2,
    trim(city) as city,
    trim(state) as state,
    trim(postal_code) as postal_code,
    trim(country) as country,
    trim(location_type) as location_type,
    active_flag,
    source_system,
    load_batch_id,
    load_ts,
    current_timestamp() as stg_ts
from {{ source('raw', 'RAW_LOCATION') }}
