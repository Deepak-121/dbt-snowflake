{{ 
    config(
        materialized='view',
        tags=['test']
    )
}}

select
    clinic_site_id,
    clinic_site_name,
    city,
    state,
    facility_type,
    active_flag,
    current_timestamp() as core_ts

from {{ ref('clinic_sites') }}
