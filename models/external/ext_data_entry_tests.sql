SELECT 

entry_tests.system,
entry_tests.object,
entry_tests.object_id,
entry_tests.object_name,
entry_tests.quality_check_field_name,
entry_tests.quality_check_field_value,
entry_tests.data_quality_check_description,
entry_tests.test_fail_negative_impact,
entry_tests.quality_check_status,
entry_tests.object_owner,
entry_tests.data_quality_owner,
entry_tests.data_quality_resolution_url,
entry_tests.test_id

FROM {{ ref('util_data_entry_tests') }} as entry_tests