with patient_panel as (
    select
        primary_clinician_id as clinician_id,
        count(distinct patient_id) as assigned_patient_count
    from {{ ref('dim_patient') }}
    group by primary_clinician_id
),

encounters as (
    select
        clinician_id,
        count(distinct encounter_id) as encounter_count,
        count(distinct patient_id) as encountered_patient_count
    from {{ ref('fact_encounter') }}
    group by clinician_id
),

appointments as (
    select
        clinician_id,
        count(distinct appointment_id) as appointment_count,
        sum(case when appointment_status = 'Missed' then 1 else 0 end) as missed_appointment_count,
        sum(case when appointment_status = 'Completed' then 1 else 0 end) as completed_appointment_count
    from {{ ref('fact_appointment') }}
    group by clinician_id
)

select
    cl.clinician_id,
    cl.clinician_name,
    cl.specialty,
    cl.clinic_site_id,
    cs.clinic_site_name,

    coalesce(pp.assigned_patient_count, 0) as assigned_patient_count,
    coalesce(e.encounter_count, 0) as encounter_count,
    coalesce(e.encountered_patient_count, 0) as encountered_patient_count,

    coalesce(a.appointment_count, 0) as appointment_count,
    coalesce(a.missed_appointment_count, 0) as missed_appointment_count,
    coalesce(a.completed_appointment_count, 0) as completed_appointment_count,

    current_timestamp() as curated_ts

from {{ ref('dim_clinician') }} cl

left join {{ ref('dim_clinic_site') }} cs
    on cl.clinic_site_id = cs.clinic_site_id

left join patient_panel pp
    on cl.clinician_id = pp.clinician_id

left join encounters e
    on cl.clinician_id = e.clinician_id

left join appointments a
    on cl.clinician_id = a.clinician_id