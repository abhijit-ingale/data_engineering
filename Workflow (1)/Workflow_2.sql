-- Databricks notebook source
Use CATALOG department;

Use SCHEMA dept;

-- COMMAND ----------

Create or Replace Table silver_wf_sales
As 
Select 
  order_id,
  email,
  year(transaction_timestamp) as Year,
  Concat("Q",quarter(transaction_timestamp)) as Quarter,
  total_item_quantity,
  purchase_revenue_in_usd,
  unique_items,
  items.*
from
(
  Select 
    order_id,
    email,
    Date_format(Cast(transaction_timestamp / 1000000 as Timestamp),'yyyy-MM-dd HH:mm:ss') as transaction_timestamp,
    total_item_quantity,
    purchase_revenue_in_usd,
    unique_items,
    explode(items) as items
  From 
    bronze_wf_sales
)

-- COMMAND ----------


