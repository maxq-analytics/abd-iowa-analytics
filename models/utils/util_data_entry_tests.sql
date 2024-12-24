select
    'Custom Data Input' as system,
    'Bottle Item' as object,
    cast(item_id as string) as object_id,
    cast(item_description as string) as object_name,
    'Brand Name' as quality_check_field_name,
    cast(brand_name as string) as quality_check_field_value,
    'Does each item have a linked brand?' as data_quality_check_description,
    'Without a complete mapping of the brands on all items, we cannot uncover trends in smaller volume liquor providers'
    as test_fail_negative_impact,
    case when brand_id is null then 'Failed' else 'Pass' end as quality_check_status,
    cast('Philip Boontje' as string) as object_owner,
    'Philip Boontje' as data_quality_owner,
    concat(
        'https://docs.google.com/spreadsheets/d/1PNoHGXEx7iJYMIjlg-egCr-P34DMjkj44TnCyZin-_E/edit?gid=1410384299#gid=1410384299'
    ) as data_quality_resolution_url,
    'DET_001' as test_id

from {{ ref("stg_abd_iowa_custom__items") }}


UNION ALL

-- Missing Invoice ID
select
    'ABD Iowa' as system,
    'Invoice' as object,
    cast(invoice_id as string) as object_id,
    cast(NULL as string) as object_name,
    'Invoice ID' as quality_check_field_name,
    cast(invoice_id as string) as quality_check_field_value,
    'Does each invoice have an invoice ID?' as data_quality_check_description,
    'Without the presence of an invoice ID we cannot be sure that the invoice is not a duplication from another invoice record'
    as test_fail_negative_impact,
    case when invoice_id is null then 'Failed' else 'Pass' end as quality_check_status,
    cast('Philip Boontje' as string) as object_owner,
    'Philip Boontje' as data_quality_owner,
    concat(
        null
    ) as data_quality_resolution_url,
    'DET_002' as test_id
from {{ ref('stg_invoices') }}

UNION ALL

-- Missing Category Name
select
    'ABD Iowa' as system,
    'Invoice' as object,
    cast(invoice_id as string) as object_id,
    cast(NULL as string) as object_name,
    'Category Name' as quality_check_field_name,
    cast(category_name as string) as quality_check_field_value,
    'Does each invoice have a Category Name?' as data_quality_check_description,
    'Without the presence of a Category Name analysis run on the dataset using the category name as filter, will be inaccurate'
    as test_fail_negative_impact,
    case when category_name is null then 'Failed' else 'Pass' end as quality_check_status,
    cast('Philip Boontje' as string) as object_owner,
    'Philip Boontje' as data_quality_owner,
    concat(
        null
    ) as data_quality_resolution_url,
    'DET_003' as test_id

from {{ ref('stg_invoices') }}


-- development
-- ORDER BY item_id  asc