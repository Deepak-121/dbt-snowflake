select
    patient_id,
    first_name,
    last_name,
    date_of_birth,
    gender
from {{ ref('stg_patient') }}