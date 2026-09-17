select
    i.invoice_id,
    i.invoice_date,
    i.due_date,
    i.invoice_status,
    i.payer_type,
    i.insurer_name,
    i.gross_amount,
    i.discount_amount,
    i.tax_amount,
    i.net_amount,
    i.paid_amount,
    i.balance_amount,
    i.overdue_flag,
    p.patient_name,
    p.mrn,
    cs.clinic_site_name,
    e.encounter_type,
    e.encounter_date,
    count(il.invoice_line_id) as line_item_count
from {{ ref('fact_invoice') }} i
left join {{ ref('dim_patient') }} p on i.patient_id = p.patient_id
left join {{ ref('dim_clinic_site') }} cs on i.clinic_site_id = cs.clinic_site_id
left join {{ ref('fact_encounter') }} e on i.encounter_id = e.encounter_id
left join {{ ref('fact_invoice_line') }} il on i.invoice_id = il.invoice_id
group by
    i.invoice_id, i.invoice_date, i.due_date, i.invoice_status,
    i.payer_type, i.insurer_name, i.gross_amount, i.discount_amount,
    i.tax_amount, i.net_amount, i.paid_amount, i.balance_amount,
    i.overdue_flag, p.patient_name, p.mrn, cs.clinic_site_name,
    e.encounter_type, e.encounter_date
