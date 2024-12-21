with
    clean_item_list as (
        select invoices.item_id, max(item_description) as item_description
        from {{ ref("stg_invoices") }} as invoices
        group by 1
    )

select
    clean_item_list.item_id,
    custom_items.brand_id,
    clean_item_list.item_description,
    case when custom_items.brand_name is null then 'Unknown Brand' else brand_name end as brand_name,

from clean_item_list

left join
    {{ ref("stg_abd_iowa_custom__items") }} as custom_items
    on custom_items.item_id = clean_item_list.item_id

-- development
where 1 = 1
-- AND clean_item_list.item_id = 11773
order by item_id desc
