select
    encounter_id,
    patient_id,
    encounter_date,
    encounter_type,
    clinician_id,
    clinic_site_id,
    reason_for_visit,
    discharge_disposition,
    source_system,
    load_batch_id,
    load_ts,
    stg_ts,
    current_timestamp() as core_ts
from {{ ref('stg_encounter') }}
