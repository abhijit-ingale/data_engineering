-- Databricks notebook source
CREATE EXTERNAL LOCATION ext_loc_external
URL 'abfss://external@storageaccountnini2108.dfs.core.windows.net/'
WITH (STORAGE CREDENTIAL storage_credential_metastore);

-- COMMAND ----------

Create Catalog ext_catalog
Managed Location 'abfss://external@storageaccountnini2108.dfs.core.windows.net/';

-- COMMAND ----------

USE CATALOG ext_catalog;

CREATE SCHEMA external_schema;

-- COMMAND ----------

USE CATALOG ext_catalog;

USE SCHEMA external_schema;

-- COMMAND ----------

Select * from csv.`abfss://data@storageaccountnini2108.dfs.core.windows.net/sample.csv`

-- COMMAND ----------

CREATE TABLE ext_employee (id INT, name STRING, dept STRING, salary INT)
USING CSV
OPTIONS ("header"="true")
LOCATION 'abfss://data@storageaccountnini2108.dfs.core.windows.net/sample.csv'

-- COMMAND ----------

Select * from ext_catalog.external_schema.ext_employee;

-- COMMAND ----------

Describe Table Extended ext_employee;

-- COMMAND ----------


