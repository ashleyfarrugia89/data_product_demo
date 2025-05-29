# Delivering AI-Ready Data Products using Dremio and dbt

This dbt code will provide an example of how Dremio and dbt can be used to deliver AI-ready data products that are **discoverable**, **addressable**, **trustworthy & truthful**, **self-describing**, **interoperable**, and **secure & governed**.

The project will create a series of artefacts (Spaces and Views) in Dremio that will create an example data product that can be used by business teams to unlock the value of the derived insights from the TPC-DS dataset considering **web_sales**, **store_sales**, **catalog_sales**, **item** and **date_dim** across different data sources.

Before you run this project you will need to have [dbt-dremio](https://docs.getdbt.com/docs/core/connect-data-platform/dremio-setup) installed.

Then you will need to configure dbt for dremio using ```dbt init```. In this prompt you will be requested to fill out the details of your Dremio cluster including credentials such as username and PAT or password.

Then you will need to change the datasource locations to align to where your data source locations in the respective .sql files in the preparation folder of the project.

Finally, to run the project you will need to execute ```dbt run```. This will create the Dremio spaces, folders and VDSs with the relevant wiki and tags for the data product. 
