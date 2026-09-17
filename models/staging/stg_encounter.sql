select
    trim(encounter_id) as encounter_id,
    trim(patient_id) as patient_id,
    encounter_date,
    trim(encounter_type) as encounter_type,
    trim(clinician_id) as clinician_id,
    trim(clinic_site_id) as clinic_site_id,
    trim(reason_for_visit) as reason_for_visit,
    trim(discharge_disposition) as discharge_disposition,
    source_system,
    load_batch_id,
    load_ts,
    current_timestamp() as stg_ts
from {{ source('raw', 'RAW_ENCOUNTER') }}
