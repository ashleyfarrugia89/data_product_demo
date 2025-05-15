{{ config(database="sales", schema="application") }}
WITH YearlySalesByChannelCategory AS (
    SELECT
        EXTRACT(YEAR FROM d_date) AS sales_year,
        channel,
        brand,
        category,
        class,
        SUM(quantity) AS yearly_sales
    FROM
        {{ ref('product_growth') }}
    GROUP BY
        1,2,3,4,5
),
YoYGrowthByChannelCategory AS (
    SELECT
        sales_year,
        channel,
        brand,
        category,
        class,
        yearly_sales,
        LAG(yearly_sales, 1) OVER (PARTITION BY channel, brand, category, class ORDER BY sales_year) AS previous_year_sales
    FROM
        YearlySalesByChannelCategory
)
SELECT *
FROM YoYGrowthByChannelCategory
ORDER BY channel, brand, category, class, sales_year;