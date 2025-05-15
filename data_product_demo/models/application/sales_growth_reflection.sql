{{ config(
materialized='reflection',
reflection_type='aggregate',
dimensions=['sales_year', 'channel', 'brand', 'category', 'class'],
measures=['yearly_sales'],
computations=['COUNT,SUM']
)}}
-- depends_on: {{ ref('yoy_sales_growth') }}