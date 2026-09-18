{{
    config(
        materialized = 'view',
        tags = ["test"]
    )
}}


select
    patient_id,
    first_name || ' ' || last_name as patient_name,
    date_of_birth,
    gender,
    DATEDIFF(year, date_of_birth, CURRENT_DATE()) as age
from {{ ref('dim_patient') }}
where is_current = true