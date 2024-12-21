select item_id, brand_id, item_description, brand_name from {{ ref("dim_items") }}
