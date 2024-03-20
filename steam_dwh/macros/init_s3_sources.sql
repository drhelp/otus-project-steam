{% macro init_s3_sources() -%}

    {% set sql %}

       CREATE TABLE ext_steam_data (
        app_id UInt64,
        app_name String,
        review_id UInt64,
        language String,
        review String,
        timestamp_created DateTime,
        timestamp_updated DateTime,
        recommended Bool,
        votes_helpful UInt8,
        votes_funny UInt8,
        weighted_vote_score Float64,
        comment_count UInt8,
        steam_purchase Bool,
        received_for_free Bool,
        written_during_early_access Bool,
        "author.steamid" UInt64,
        "author.num_games_owned" UInt8,
        "author.num_reviews" UInt8,
        "author.playtime_forever" Float,
        "author.playtime_last_two_weeks" Float,
        "author.playtime_at_review" Float,
        "author.last_played" Float
        )
      ENGINE = S3('https://storage.yandexcloud.net/steam-review-2021/steam_reviews.csv','YCAJE19ndL6tfx8rvfWrAaMSe','YCN-YwbvF7aSp0q1FFMFvA1tTDbjYo8pZI94XsK_','CSVWithNames');

    {% endset %}
    
    {% set table = run_query(sql) %}

{%- endmacro %}

{% endmacro %}