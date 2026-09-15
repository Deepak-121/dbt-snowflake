select
    patient_id,
    first_name,
    last_name,
    date_of_birth,
    gender
from {{ source('raw', 'patient') }}