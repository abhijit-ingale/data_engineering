-- Databricks notebook source
-- MAGIC %python
-- MAGIC
-- MAGIC
-- MAGIC spark.conf.set(
-- MAGIC     "fs.azure.account.key.stgnini20230619.dfs.core.windows.net","0jC4DYl6zp56F9+swwvvMrL2z0g8upQfrvJCpuyHuMza2HIhmezd/u9eKsV9wX+au5QOPxzVJURQ+AStVcQtPw==")
-- MAGIC

-- COMMAND ----------

-- MAGIC %python
-- MAGIC
-- MAGIC df=spark.read.format("csv").option("header","true").option("delimiter",",").option("inferSchema","true").load("abfss://data@stgnini20230619.dfs.core.windows.net/sample.csv")
-- MAGIC
-- MAGIC display(df)

-- COMMAND ----------

Set spark.hadoop.fs.azure.account.key.stgnini20230619.dfs.core.windows.net = "0jC4DYl6zp56F9+swwvvMrL2z0g8upQfrvJCpuyHuMza2HIhmezd/u9eKsV9wX+au5QOPxzVJURQ+AStVcQtPw=="

-- COMMAND ----------

Create Schema ext_sample Location "wasbs://test@stgnini20230619.dfs.core.windows.net/database"

-- COMMAND ----------

Use sample;

Create or Replace Table test_1 (id INT, name STRING);

Insert into test_1 values(1,"A");

-- COMMAND ----------

Describe extended test_1

-- COMMAND ----------

-- MAGIC %fs ls /user/hive/warehouse/sample.db/test_1

-- COMMAND ----------


