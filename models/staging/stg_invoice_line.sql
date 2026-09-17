select
    trim(invoice_line_id) as invoice_line_id,
    trim(invoice_id) as invoice_id,
    trim(billing_item_id) as billing_item_id,
    quantity,
    unit_price,
    discount_amount,
    tax_amount,
    line_total,
    source_system,
    load_batch_id,
    load_ts,
    current_timestamp() as stg_ts
from {{ source('raw', 'RAW_INVOICE_LINE') }}
