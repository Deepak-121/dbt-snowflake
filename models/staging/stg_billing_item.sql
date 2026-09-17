select
    trim(billing_item_id) as billing_item_id,
    trim(item_code) as item_code,
    trim(item_description) as item_description,
    trim(item_category) as item_category,
    standard_charge,
    tax_rate,
    active_flag,
    source_system,
    load_batch_id,
    load_ts,
    current_timestamp() as stg_ts
from {{ source('raw', 'RAW_BILLING_ITEM') }}
