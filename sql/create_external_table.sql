-- 1️⃣ Create External Table (Data Lake → BigQuery)

CREATE OR REPLACE EXTERNAL TABLE `thelook_gcda.product_returns`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://sureskills-lab-dev/DAC2M2L4/returns/returns_*.parquet']
);