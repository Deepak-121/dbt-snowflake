{% macro log_message() %}
  {{ log("My DBT Start..", info=True) }}

  {% set user_name =  "macro_user" %}
  {{ log("Hello, " ~ user_name ~ "! Welcome to DBT.", info=True) }}

  {{ log("Hello, dbt user " ~ var("user_name", "default_user") ~ "! Welcome to DBT.", info=True) }}


{% endmacro %}