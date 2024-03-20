{{
    config (
      engine='MergeTree()',
      order_by='review_id'
    )
}}

with source as (
      select * from {{ source('steam_data', 'ext_steam_data') }}
),
renamed as (
    select
        
        app_id,
        app_name,
        review_id,
        `language`,
        review,
        timestamp_created,
        timestamp_updated,
        recommended,
        votes_helpful,
        votes_funny,
        weighted_vote_score,
        comment_count,
        steam_purchase,
        received_for_free,
        written_during_early_access,
        `author.steamid` as author_steamid ,
        toInt32(`author.num_games_owned`) as author_num_games_owned,
        toInt32(`author.num_reviews`) as author_num_reviews,
        toInt32(`author.playtime_forever`) as author_playtime_forever,
        toInt32(`author.playtime_last_two_weeks`) as author_playtime_last_two_weeks,
        toInt32(`author.playtime_at_review`) as author_playtime_at_review,
        toDateTime(toInt64(`author.last_played`)) as author_last_played

    from source
)
select * from renamed
  