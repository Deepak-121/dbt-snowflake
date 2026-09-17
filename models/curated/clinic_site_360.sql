with encounters as (
    select
        clinic_site_id,
        count(distinct encounter_id) as encounter_count,
        count(distinct patient_id) as unique_patient_count
    from {{ ref('fact_encounter') }}
    group by clinic_site_id
),

appointments as (
    select
        clinic_site_id,
        count(distinct appointment_id) as appointment_count,
        sum(case when appointment_status = 'Missed' then 1 else 0 end) as missed_appointment_count,
        sum(case when appointment_status = 'Completed' then 1 else 0 end) as completed_appointment_count
    from {{ ref('fact_appointment') }}
    group by clinic_site_id
),

billing as (
    select
        clinic_site_id,
        count(distinct invoice_id) as invoice_count,
        sum(net_amount) as total_invoice_amount,
        sum(paid_amount) as total_paid_amount,
        sum(balance_amount) as total_balance_amount
    from {{ ref('fact_invoice') }}
    group by clinic_site_id
)

select
    cs.clinic_site_id,
    cs.clinic_site_name,
    cs.site_type,
    loc.location_name,
    loc.city,
    loc.state,

    coalesce(e.encounter_count, 0) as encounter_count,
    coalesce(e.unique_patient_count, 0) as unique_patient_count,

    coalesce(a.appointment_count, 0) as appointment_count,
    coalesce(a.missed_appointment_count, 0) as missed_appointment_count,
    coalesce(a.completed_appointment_count, 0) as completed_appointment_count,

    coalesce(b.invoice_count, 0) as invoice_count,
    coalesce(b.total_invoice_amount, 0) as total_invoice_amount,
    coalesce(b.total_paid_amount, 0) as total_paid_amount,
    coalesce(b.total_balance_amount, 0) as total_balance_amount,

    current_timestamp() as curated_ts

from {{ ref('dim_clinic_site') }} cs

left join {{ ref('dim_location') }} loc
    on cs.location_id = loc.location_id

left join encounters e
    on cs.clinic_site_id = e.clinic_site_id

left join appointments a
    on cs.clinic_site_id = a.clinic_site_id

left join billing b
    on cs.clinic_site_id = b.clinic_site_id