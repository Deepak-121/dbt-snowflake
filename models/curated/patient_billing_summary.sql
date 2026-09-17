select
    patient_id,
    count(distinct invoice_id) as invoice_count,

    sum(gross_amount) as total_gross_amount,
    sum(discount_amount) as total_discount_amount,
    sum(tax_amount) as total_tax_amount,
    sum(net_amount) as total_net_amount,
    sum(paid_amount) as total_paid_amount,
    sum(balance_amount) as total_balance_amount,

    sum(case when overdue_flag then balance_amount else 0 end) as overdue_amount,

    sum(case when payer_type = 'Insurance' then net_amount else 0 end) as insurance_invoice_amount,
    sum(case when payer_type = 'Self Pay' then net_amount else 0 end) as self_pay_invoice_amount,

    max(invoice_date) as last_invoice_date,

    current_timestamp() as curated_ts

from {{ ref('fact_invoice') }}
group by patient_id