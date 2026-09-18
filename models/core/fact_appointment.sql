{{
    config(
        materialized = 'incremental',
        incremental_strategy='merge',
        on_schema_change = 'fail',
        tags = ["test"]
    )
}}

select
    appointment_id,
    patient_id,
    clinician_id,
    clinic_site_id,
    appointment_date,
    appointment_type,
    appointment_status,
    source_system,
    load_batch_id,
    load_ts,
    stg_ts,
    current_timestamp() as core_ts
from {{ ref('stg_appointment') }}
where 1=1
{% if is_incremental() %}
and load_ts > (select max(load_ts) from {{ this }})
{% endif %}
