-- Databricks notebook source
-- DBTITLE 1,Dropping old catalog
Drop Catalog main cascade;

-- COMMAND ----------

Drop catalog nini_catalog cascade;

-- COMMAND ----------

DESCRIBE STORAGE CREDENTIAL storage_credential_metastore


-- COMMAND ----------

SHOW GRANTS `abhijit.ingale@gmail.com` ON STORAGE CREDENTIAL storage_credential_metastore;

-- COMMAND ----------

GRANT CREATE External Location on Storage Credential storage_credential_metastore To `abhijit.ingale@gmail.com`;

-- COMMAND ----------

Alter STORAGE CREDENTIAL storage_credential_data Rename To storage_credential_metastore;

-- COMMAND ----------

CREATE External Location ext_loc_data
URL 'abfss://data@storageaccountnini2108.dfs.core.windows.net/'
WITH (STORAGE CREDENTIAL storage_credential_metastore);

-- COMMAND ----------

GRANT All Privileges on External Location ext_loc_data To `abhijit.ingale@gmail.com`;

-- COMMAND ----------

Create Catalog employee;

-- COMMAND ----------

Use CATALOG employee;

Create Schema emp;

-- COMMAND ----------

Use catalog employee;

Use schema emp;

Create Table department (deptid INT, name STRING);

Insert into department values (1,"sales");
Insert into department values (2,"marketing");
Insert into department values (3,"IT");
Insert into department values (4,"admin");

Select * from department;

