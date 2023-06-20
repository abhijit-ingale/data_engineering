-- Databricks notebook source
Create or Replace Table wf_sample.gold_wf_sales
Comment "This is gold layer table for Sales"
As Select Year, Quarter, Sum(item_revenue_in_usd) as Revenue,sum(quantity) as Quantity, Avg(price_in_usd) as Price
From wf_sample.silver_wf_sales
Group By Year, Quarter
