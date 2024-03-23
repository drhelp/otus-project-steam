-- Run under CH admin user
CREATE DATABASE IF NOT EXISTS steam_dwh;

CREATE USER dbt_user IDENTIFIED WITH sha256_password BY '{{CH_DBT_PASSWORD}}';

GRANT CREATE, ALTER,SELECT,INSERT, DROP, TRUNCATE, SHOW  ON steam_dwh.* TO dbt_user;
GRANT S3 ON *.* TO dbt_user;