select
    invoice_line_id,
    invoice_id,
    billing_item_id,
    quantity,
    unit_price,
    discount_amount,
    tax_amount,
    line_total,
    source_system,
    load_batch_id,
    load_ts,
    stg_ts,
    current_timestamp() as core_ts
from {{ ref('stg_invoice_line') }}
