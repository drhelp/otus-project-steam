{{
    config (
      engine='MergeTree()'
    )
}}
with review as (
      select * from {{ ref('fact_review') }}
),
author as (
        select * from {{ref("dim_author")}}
),
app as (
    select * from {{ref("dim_app")}}
),
renamed as (
    select
        app.app_name,
        language as review_language,
        toDate(timestamp_created) as review_date,
        recommended,
        steam_purchase ,
        received_for_free ,
        written_during_early_access,
        count(1) as review_count,
        sum(votes_helpful) as votes_helpful,
        sum(votes_funny) as votes_funny,
        avg(weighted_vote_score) as weighted_vote_score ,
        sum(comment_count) as  comment_count,
        sum(recommended) as recommended_count,
        sum(steam_purchase) as purchase_count,
        sum(received_for_free) as free_count
    from review
    join app on (review.app_id = app.app_id)
    --join author on (review.author_steamid = author.author_steamid)
    group by 
        app.app_name,
        language as review_language,
        toDate(timestamp_created) as review_date,
        recommended,
        steam_purchase ,
        received_for_free ,
        written_during_early_access
)
select * from renamed