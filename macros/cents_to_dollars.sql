
-- https://docs.getdbt.com/docs/building-a-dbt-project/jinja-macros
{% macro cents_to_dollars(column_name, precision=2) %}
    ({{ column_name }} / 100)::numeric(16, {{ precision }})
{% endmacro %}





/*
Using the marcro:

select
  id as payment_id,
  {{ cents_to_dollars('amount') }} as amount_usd,
  ...
from app_data.payments

*/ 