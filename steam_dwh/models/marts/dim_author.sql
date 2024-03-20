{{
    config (
      engine='ReplacingMergeTree()',
      order_by='author_steamid'
    )
}}
with source as (
      select * from {{ ref('stg_steam_review') }}
),
renamed as (
    select
        distinct
            author_steamid ,
            author_num_games_owned ,
            author_num_reviews ,
            author_playtime_forever ,
            author_playtime_last_two_weeks ,
            author_playtime_at_review ,
            author_last_played 
    from source
)
select * from renamed
