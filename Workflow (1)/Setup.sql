-- Databricks notebook source
Create DATABASE wf_sample LOCATION "/mnt/abhijit"

-- COMMAND ----------

-- MAGIC %fs ls /mnt/abhijit

-- COMMAND ----------

drop table wf_sample.bronze_wf_sales;
drop table wf_sample.silver_wf_sales;


-- COMMAND ----------


