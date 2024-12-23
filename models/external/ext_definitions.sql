select

        -- IDs
        definition_id,

        -- properties
        definition_name,
        definition_type,
        definition_domain,
        definition_source,
        definition_url,
        definition_description,

FROM {{ ref('stg_utilities__definitions') }}

ORDER BY definition_id ASC