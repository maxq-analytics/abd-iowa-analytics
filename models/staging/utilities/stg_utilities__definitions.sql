with 

source as (

    select * from {{ source("utilities", "definitions") }}

),

renamed as (

    select
        safe_cast(column_1 as int64) as definition_id,
        safe_cast(column_2 as string) as definition_name,
        safe_cast(column_3 as string) as definition_type,
        safe_cast(column_4 as string) as definition_description,
        safe_cast(column_5 as string) as definition_source,
        safe_cast(column_6 as string) as definition_domain,
        safe_cast(column_7 as string) as definition_url,
    from source

)

select * from renamed