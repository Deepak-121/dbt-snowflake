{{ 
    config(
        materialized = 'table',
        tags = ['test']
    )
}}

select
    patient_id,
    mrn,

    first_name,
    last_name,
    patient_name,

    date_of_birth,
    datediff(year, date_of_birth, current_date) as age,

    gender,
    city,
    state,
    phone,
    email,

    primary_clinician_id,
    preferred_clinic_site_id,

    active_flag,
    source_system,

    -- SCD Type 2 columns
    dbt_valid_from as effective_from,
    dbt_valid_to as effective_to,

    case
        when dbt_valid_to is null then true
        else false
    end as is_current,

    -- Useful audit columns
    load_batch_id,
    load_ts,
    stg_ts,
    dbt_updated_at,

    current_timestamp() as core_ts

from {{ ref('patient_snapshot') }}