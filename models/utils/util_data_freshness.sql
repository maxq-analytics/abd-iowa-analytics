-- Summary of calculations
-- UNION ALL of individual data freshness tests
-- Master Data Set generation by MAXQ Analytics using dbt Cloud
select
    current_timestamp() as freshness_timestamp,
    'Master Data' as dataset_name,
    'dbt' as tool,
    'Transformation' as pipeline_step,
    'MAXQ / Philip Boontje' as pipeline_step_operator,
    'https://cloud.getdbt.com/deploy/13158/projects/22854/environments/340965'
    as pipeline_step_url,
    'Re-run masterdata' as description,
    'UTC' as timezone,
    'Every week' as frequency

union all

-- Custom Items | Google Sheets
select
    max(extracted_at) as freshness_timestamp,
    'Custom Input' as dataset_name,
    'BigQuery' as tool,
    'Extract' as pipeline_step,
    'MAXQ / Philip Boontje' as pipeline_step_operator,
    'https://console.cloud.google.com/bigquery?ws=!1m5!1m4!4m3!1seternal-ship-306122!2sabd_iowa_custom!3sitems' as pipeline_step_url,
    'Extraction step by BigQuery pulling data from linked Google Sheet' as description,
    'UTC' as timezone,
    'Instant' as frequency
from {{ ref('stg_abd_iowa_custom__items') }}

UNION ALL

-- ABD Iowa Invoices | BigQuery
select
    max(date_day_time) as freshness_timestamp,
    'ABD Iowa' as dataset_name,
    'BigQuery' as tool,
    'Extract' as pipeline_step,
    'MAXQ / Philip Boontje' as pipeline_step_operator,
    'https://console.cloud.google.com/bigquery?ws=!1m5!1m4!4m3!1seternal-ship-306122!2sabd_dbt!3sfct_invoices' as pipeline_step_url,
    'Extraction step by BigQuery pulling data from public source' as description,
    'UTC' as timezone,
    'Every month' as frequency
from {{ ref('stg_invoices') }}