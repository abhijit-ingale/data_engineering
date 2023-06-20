-- Databricks notebook source
Create or Refresh Live Table bronze_sales
As Select * from abhijit_ingale_7mou_da_delp.sales;

-- COMMAND ----------

Create or Refresh Live Table silver_sales
As 
Select order_id,email,transaction_timestamp,total_item_quantity,purchase_revenue_in_usd,items.* from (
Select order_id,email,from_unixtime(Cast(transaction_timestamp/1000000 As BigInt),'yyyy-MM-dd HH:mm:ss') as transaction_timestamp,total_item_quantity,purchase_revenue_in_usd,explode(items) as items from Live.bronze_sales)

-- COMMAND ----------

Create or Refresh Live Table gold_sales
As
Select 
  year(transaction_timestamp) as Year,
  quarter(transaction_timestamp) as Quarter,
  sum(item_revenue_in_usd) as Revenue,
  sum(quantity) as Quantity,
  avg(price_in_usd) as Price
From
  Live.silver_sales
Group by
  year(transaction_timestamp),
  quarter(transaction_timestamp)
