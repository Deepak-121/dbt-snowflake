select
    p.patient_id,
    p.mrn,
    p.patient_name,
    p.first_name,
    p.last_name,
    p.date_of_birth,
    p.age,
    p.gender,
    p.city,
    p.state,

    p.primary_clinician_id,
    cl.clinician_name as primary_clinician_name,
    cl.specialty as primary_clinician_specialty,

    p.preferred_clinic_site_id,
    cs.clinic_site_name as preferred_clinic_site_name,
    cs.site_type as preferred_site_type,

    loc.location_name,
    loc.city as clinic_city,
    loc.state as clinic_state,

    coalesce(a.appointment_count, 0) as appointment_count,
    coalesce(a.missed_appointment_count, 0) as missed_appointment_count,
    coalesce(a.completed_appointment_count, 0) as completed_appointment_count,
    coalesce(a.cancelled_appointment_count, 0) as cancelled_appointment_count,
    coalesce(a.scheduled_appointment_count, 0) as scheduled_appointment_count,
    a.next_appointment_date,
    a.last_appointment_date,

    coalesce(b.invoice_count, 0) as invoice_count,
    coalesce(b.total_net_amount, 0) as total_net_amount,
    coalesce(b.total_paid_amount, 0) as total_paid_amount,
    coalesce(b.total_balance_amount, 0) as total_balance_amount,
    coalesce(b.overdue_amount, 0) as overdue_amount,

    case
        when coalesce(a.missed_appointment_count, 0) > 0
          or coalesce(b.overdue_amount, 0) > 0
        then 'Medium'
        else 'Low'
    end as rule_based_risk_band,

    current_timestamp() as curated_ts

from {{ ref('dim_patient') }} p

left join {{ ref('dim_clinician') }} cl
    on p.primary_clinician_id = cl.clinician_id

left join {{ ref('dim_clinic_site') }} cs
    on p.preferred_clinic_site_id = cs.clinic_site_id

left join {{ ref('dim_location') }} loc
    on cs.location_id = loc.location_id

left join {{ ref('patient_appointment_summary') }} a
    on p.patient_id = a.patient_id

left join {{ ref('patient_billing_summary') }} b
    on p.patient_id = b.patient_id