select
    -- IDs
    invoices.invoice_id,
    invoices.store_id,
    invoices.vendor_id,
    invoices.category_id,
    invoices.county_id,
    invoices.item_id,
    items.brand_id,

    -- Timestamps
    invoices.date_day,
    invoices.date_day_time,

    -- Properties | Store
    invoices.store_name,
    invoices.store_address,
    invoices.store_city,
    invoices.store_county,

    -- Properties | Invoice
    invoices.category_name,
    invoices.vendor_name,
    invoices.item_description,

    -- Properties | Items
    items.brand_name,

    --Properties | Owners
    owners.owner_id,
    owners.owner_name,

    -- Measures | Invoice
    invoices.bottles_per_pack,
    invoices.retail_price_bottle,
    invoices.bottles_sold,
    invoices.retail_value_items_sold,
    invoices.volume_per_bottle_liters,
    invoices.volume_sold_liters,

from {{ ref("stg_invoices") }} as invoices


left join {{ ref('dim_items') }} as items on items.item_id = invoices.item_id
left join {{ ref('dim_owners') }} as owners on owners.store_id = invoices.store_id

