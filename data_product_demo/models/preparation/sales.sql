{{ config(database="sales", schema="preparation") }}

with x_channel_sales as (
         select           ss_item_sk as item_sk,
                          ss_sold_date_sk as sold_date_sk,
                          'store' as channel,
                          ss_quantity as quantity,
                          ss_sales_price as unit_price,
                          ss_customer_sk as customer_sk
         from             Samples."samples.dremio.com"."tpcds_sf1000"."store_sales"
         union ALL select ws_item_sk as item_sk,
                          ws_sold_date_sk as sold_date_sk,
                          'web' as channel,
                          ws_quantity as quantity,
                          ws_sales_price as unit_price,
                          ws_bill_customer_sk as customer_sk
         from             Samples."samples.dremio.com"."tpcds_sf1000"."web_sales"
         union all select cs_item_sk as item_sk,
                          cs_sold_date_sk as sold_date_sk,
                          'catalog' as channel,
                          cs_quantity as quantity,
                          cs_sales_price as unit_price,
                          cs_bill_customer_sk as customer_sk
         from             Samples."samples.dremio.com"."tpcds_sf1000"."catalog_sales")
select *
from   x_channel_sales
