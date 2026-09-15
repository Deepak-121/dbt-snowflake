select
    appointment_id,
    patient_id,
    clinician_name,
    appointment_date,
    appointment_status
from {{ ref('stg_appointment') }}