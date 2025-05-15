{{ config(database="sales", schema="preparation") }}
select
d_date_sk, d_date, d_day_name, d_dom, d_moy, d_year,
CASE d_moy
        WHEN 1 THEN 'January'
        WHEN 2 THEN 'February'
        WHEN 3 THEN 'March'
        WHEN 4 THEN 'April'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'June'
        WHEN 7 THEN 'July'
        WHEN 8 THEN 'August'
        WHEN 9 THEN 'September'
        WHEN 10 THEN 'October'
        WHEN 11 THEN 'November'
        WHEN 12 THEN 'December'
        ELSE 'Invalid Month Number' -- Handle cases outside 1-12
    END AS month_name
from datasets."datasets.dremio.com"."tpcds_snowflake_poc"."date_dim"