{{ config(database="product", schema="preparation") }}
select * from "sa-bq"."dremio-sa"."TPCDS_1000".item
where i_brand <> ''