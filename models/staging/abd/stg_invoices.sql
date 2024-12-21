with

    source as (select * from {{ source("iowa_liquor_sales", "iowa_liquor_sales") }}),

    renamed as (

        select
            -- IDs
            safe_cast(
                replace(invoice_and_item_number, 'INV-', '') as int64
            ) as invoice_id,
            safe_cast(store_number as int64) as store_id,
            safe_cast(regexp_replace(vendor_number, '\\..*', '') as int64) as vendor_id,
            safe_cast(regexp_replace(category, '\\..*', '') as int64) as category_id,
            safe_cast(county_number as int64) as county_id,
            safe_cast(item_number as int64) as item_id,

            -- Timestamps
            date(date) as date_day,

            -- Properties | Store
            safe_cast(
                regexp_replace(initcap(store_name), '/.*', '') as string
            ) as store_name,
            safe_cast(initcap(address) as string) as store_address,
            safe_cast(initcap(city) as string) as store_city,
            safe_cast(initcap(county) as string) as store_county,

            -- Properties | Invoice
            safe_cast(initcap(category_name) as string) as category_name,
            safe_cast(initcap(vendor_name) as string) as vendor_name,
            safe_cast(initcap(item_description) as string) as item_description,

            -- Measures | Invoice
            safe_cast(pack as numeric) as bottles_per_pack,
            safe_cast(state_bottle_retail as numeric) as retail_price_bottle,
            safe_cast(bottles_sold as numeric) as bottles_sold,
            safe_cast(sale_dollars as numeric) as retail_value_items_sold,
            round(
                safe_cast(bottle_volume_ml as numeric) / 1000, 3
            ) as volume_per_bottle_liters,
            safe_cast(volume_sold_liters as numeric) as volume_sold_liters,

        from source

    )

select
    * except (store_city),

    -- Removing empty fields
    case when store_city is null then 'Unknown City' else store_city end as store_city,
from renamed


where
    1 = 1 
    and date_day >= '2013-1-1'
    and item_id is not null -- A handfull of invoices don't have an item_id
    
    -- development    
    -- and item_id = 65259
    
