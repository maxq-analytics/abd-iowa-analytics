select
   freshness_timestamp,
   dataset_name,
   tool,
   pipeline_step,
   pipeline_step_operator,
   pipeline_step_url,
   description,
   timezone,
   frequency
from {{ ref('util_data_freshness') }}