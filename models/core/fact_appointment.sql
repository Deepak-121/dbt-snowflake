{{
    config(
        materialized = 'incremental',
        incremental_strategy='merge',
        unique_key = 'appointment_id',
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
    {% if var("start_date",false) and var("end_date",false) %}
        {{ log("Incremental load with start_date and end_date", info=True) }}
        and load_ts between '{{ var("start_date") }}' and '{{ var("end_date") }}'
    {% else %}
        {{ log("Incremental load with max(load_ts)", info=True) }}
        and load_ts > (select max(load_ts) from {{ this }})
    {% endif %}
{% endif %}


{# dbt run --select fact_appointment --vars "{start_date: '2026-09-17 00:00:00', end_date: '2026-09-17 05:56:26'}" #}