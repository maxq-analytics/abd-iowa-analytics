with 

source as (

    select * from {{ source('utilities', 'metric_catalog') }}

),

renamed as (

    select
        -- IDs
        safe_cast(column_1 as int64) as metric_id,
        
        -- Properties
        safe_cast(column_2 as string) as metric_name,
        safe_cast(column_3 as string) as metric_owner,
        safe_cast(column_4 as string) as metric_unit,
        safe_cast(column_5 as string) as status,
        safe_cast(column_6 as string) as metric_domain,	
        safe_cast(column_7 as string) as critical_value,
        safe_cast(column_8 as string) as target,	
        safe_cast(column_9 as string) as metric_page,
        safe_cast(column_10 as string) as standard_url,
        safe_cast(column_11 as string) as abbreviation,
        safe_cast(column_12 as string) as entities,
        safe_cast(column_13 as string) as comments,

    from source

)

select * from renamed
WHERE metric_name is NOT NULL