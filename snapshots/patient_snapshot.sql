{% snapshot patient_snapshot %}

{{
    config(
        target_schema='CORE',
        unique_key='patient_id',
        strategy='timestamp',
        updated_at='load_ts',
        invalidate_hard_deletes=True
    )
}}

select
    patient_id,
    mrn,
    first_name,
    last_name,
    patient_name,
    date_of_birth,
    age,
    gender,
    city,
    state,
    phone,
    email,
    primary_clinician_id,
    preferred_clinic_site_id,
    active_flag,
    source_system,
    load_batch_id,
    load_ts,
    stg_ts

from {{ ref('stg_patient') }}

{% endsnapshot %}