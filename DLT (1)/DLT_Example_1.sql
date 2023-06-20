-- Databricks notebook source
Create or Refresh Live Table bronze_sales
Comment "This is bronze layer table for Sales"
As Select * from parquet.`/mnt/dbacademy-datasets/data-engineer-learning-path/v01/ecommerce/raw/sales-30m`

-- COMMAND ----------

Create Live View vw_bronze_sales
As
Select 
    order_id,
    email,
    Date_format(Cast(transaction_timestamp / 1000000 as Timestamp),'yyyy-MM-dd HH:mm:ss') as transaction_timestamp,
    total_item_quantity,
    purchase_revenue_in_usd,
    unique_items,
    explode(items) as items
  From 
    Live.bronze_sales

-- COMMAND ----------

Create or Refresh Live Table silver_sales
(CONSTRAINT valid_email EXPECT(email IS NOT NULL) ON VIOLATION DROP ROW)
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
  Live.vw_bronze_sales

-- COMMAND ----------

Create or Refresh Live Table gold_sales
Comment "This is gold layer table for Sales"
As Select Year, Quarter, Sum(item_revenue_in_usd) as Revenue,sum(quantity) as Quantity, Avg(price_in_usd) as Price
From Live.silver_sales
Group By Year, Quarter
