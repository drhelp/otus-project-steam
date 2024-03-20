{{
    config (
      engine='ReplacingMergeTree()',
      order_by='app_id'
    )
}}
with source as (
      select * from {{ ref('stg_steam_review') }}
),
renamed as (
    select
        distinct
            app_id ,
            app_name 
    from source
)
select * from renamed
