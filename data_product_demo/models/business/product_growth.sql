{{ config(database="sales",  schema="business") }}
select
d_date, d_day_name, d_dom, d_moy, d_year, month_name, channel, item_sk, i_brand as brand, i_class as class, i_category as category, quantity, unit_price, (quantity*unit_price) as total_cost
from {{ ref('sales') }}
join {{ ref('product') }} on item_sk = i_item_sk
join {{ ref('calendar') }} on d_date_sk = sold_date_sk
where quantity is not null and d_year != '2003' and category != '' and class != ''