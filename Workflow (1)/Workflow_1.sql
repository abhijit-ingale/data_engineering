-- Databricks notebook source
Create or Replace Table wf_sample.bronze_wf_sales
Comment "This is bronze layer table for Sales"
As Select * from parquet.`/mnt/dbacademy-datasets/data-engineer-learning-path/v01/ecommerce/raw/sales-30m`

-- COMMAND ----------


