-- Databricks notebook source
-- MAGIC %md
-- MAGIC
-- MAGIC While creating storage credential new Access connector for Azure databricks needs to be setup and granted Storage Blob data contributor role on Storage Account. Then creating External Location with that Storage credential works fine.

-- COMMAND ----------

Show STORAGE CREDENTIALS

-- COMMAND ----------

DESCRIBE STORAGE CREDENTIAL datastore_credentials

-- COMMAND ----------

ALTER STORAGE CREDENTIAL datastore_credentials RENAME TO datastore_cred;

-- COMMAND ----------

SHOW STORAGE CREDENTIALS

-- COMMAND ----------

SHOW GRANTS `abhijit.ingale@gmail.com` ON STORAGE CREDENTIAL data_credential
