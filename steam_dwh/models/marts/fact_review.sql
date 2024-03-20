{{
    config (
      engine='MergeTree()',
      order_by='review_id'
    )
}}
with source as (
      select * from {{ ref('stg_steam_review') }}
),
renamed as (
    select
        review_id ,
        app_id ,
        language ,
        review ,
        timestamp_created ,
        timestamp_updated ,
        recommended ,
        votes_helpful ,
        votes_funny ,
        weighted_vote_score ,
        comment_count ,
        steam_purchase ,
        received_for_free ,
        written_during_early_access 
    from source
)
select * from renamed
