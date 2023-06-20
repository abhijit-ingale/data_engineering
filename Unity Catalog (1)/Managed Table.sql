-- Databricks notebook source
CREATE TABLE sample_catalog.sample_schema.department
(
  deptcode  INT,
  deptname  STRING,
  location  STRING
);

INSERT INTO sample_catalog.sample_schema.department VALUES
  (10, 'FINANCE', 'EDINBURGH'),
  (20, 'SOFTWARE', 'PADDINGTON'),
  (30, 'SALES', 'MAIDSTONE'),
  (40, 'MARKETING', 'DARLINGTON'),
  (50, 'ADMIN', 'BIRMINGHAM');

-- COMMAND ----------

Select * from sample_catalog.sample_schema.department

-- COMMAND ----------

Use CATALOG sample_catalog;

Use SCHEMA sample_schema;

-- COMMAND ----------

Show TABLES

-- COMMAND ----------


