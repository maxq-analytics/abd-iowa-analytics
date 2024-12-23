SELECT 

        -- IDs
        metric_id,
        
        -- Properties
        metric_name,
        metric_owner,
        metric_unit,
        status,
        metric_domain,	
        critical_value,
        target,	
        metric_page,
        standard_url,
        abbreviation,
        entities,
        comments,
        


FROM {{ ref('stg_utilities__metric_catalog') }}

ORDER BY metric_id asc