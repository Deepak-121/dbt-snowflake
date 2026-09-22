{% test minimum_row_count(model, minimum_row_count) %}
{{ config( severity='Warn') }}

  select 
        count(*) as row_count
  from 
        {{ model }}
  having 
        count(*) <= {{ minimum_row_count }}

{% endtest %}