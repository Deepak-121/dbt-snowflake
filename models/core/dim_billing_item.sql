select
    billing_item_id,
    item_code,
    item_description,
    item_category,
    standard_charge,
    tax_rate,
    active_flag,
    source_system,
    load_batch_id,
    load_ts,
    stg_ts,
    current_timestamp() as core_ts
from {{ ref('stg_billing_item') }}
