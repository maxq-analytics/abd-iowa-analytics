with

    source as (select * from {{ source("abd_iowa_custom", "items") }}),

    renamed as (

        select
            safe_cast(column_1 as int64) as item_id,
            safe_cast(column_2 as string) as item_description,
            safe_cast(column_3 as int64) as brand_id,
            safe_cast(column_4 as string) as brand_name,
            safe_cast(column_5 as timestamp) as extracted_at,

        from source

    )

select
    * except (brand_name),
    case when brand_name is null then 'Unmapped Brand' else brand_name end as brand_name

from renamed
ORDER BY item_id asc