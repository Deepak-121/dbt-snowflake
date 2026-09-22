{% set relation = ref('dim_patient') %}

select *
from {{ relation }}
where not (
    {{ no_empty_string(relation) }}
)