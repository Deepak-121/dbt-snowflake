{{
    config(
        materialized = 'view',
        tags = ["test"]
    )
}}

select
    patient_id,
    count(*) as appointment_count,
    sum(case when appointment_status = 'Missed' then 1 else 0 end) as missed_appointment_count,
    sum(case when appointment_status = 'Completed' then 1 else 0 end) as completed_appointment_count,
    sum(case when appointment_status = 'Cancelled' then 1 else 0 end) as cancelled_appointment_count,
    sum(case when appointment_status = 'Scheduled' then 1 else 0 end) as scheduled_appointment_count,
    min(case when appointment_status = 'Scheduled' then appointment_date end) as next_appointment_date,
    max(appointment_date) as last_appointment_date,
    current_timestamp() as curated_ts
from {{ ref('fact_appointment') }}
group by patient_id