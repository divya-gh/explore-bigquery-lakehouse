# explore-bigquery-lakehouse
# 🏞️ Explore a Lakehouse Architecture with BigQuery

## 🚀 Project Overview

This project demonstrates how to build and explore a **Lakehouse architecture** using **Google BigQuery** by integrating data from a **data lake (Cloud Storage)** and a **data warehouse (BigQuery native tables)**.

Using a real-world eCommerce scenario, this project shows how analysts can combine raw external data with curated warehouse data to generate business insights efficiently.

---

## 🧠 Business Scenario

At *TheLook eCommerce*, the merchandising team needs answers to key business questions:

* Which products are being returned most frequently?
* Which distribution centers see the highest returns for specific product categories?
* Are product costs up to date based on supplier updates?

To solve this, we implement a **lakehouse approach** using BigQuery.

---

## 🏗️ Architecture (Lakehouse Pattern)

* **Data Lake:** Google Cloud Storage (Parquet & CSV files)
* **Warehouse:** BigQuery Native Tables
* **Lakehouse Engine:** BigQuery (External + Standard Tables)

```
Cloud Storage (Parquet, CSV)
        ↓
External Tables (BigQuery)
        ↓
Joins with Native Tables
        ↓
Analytics & Reporting
```

---

## 🔍 Key Concepts Demonstrated

* Data Lake vs Data Warehouse vs Lakehouse
* External tables in BigQuery
* Native (standard) BigQuery tables
* Querying Parquet files directly from Cloud Storage
* Joining external and native tables
* Importing CSV data into BigQuery
* Schema auto-detection

---

## 🧪 Queries & Implementation

### 1️⃣ Create External Table (Data Lake → BigQuery)

```sql
CREATE OR REPLACE EXTERNAL TABLE `thelook_gcda.product_returns`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://sureskills-lab-dev/DAC2M2L4/returns/returns_*.parquet']
);
<img src="./Snapshots/Importing_ExternalData_from_BigLake.png" height="300" width="400">
```

✔ Demonstrates querying Parquet files directly from Cloud Storage

---

### 2️⃣ Validate External Data

```sql
SELECT COUNT(*) AS row_count
FROM `thelook_gcda.product_returns`;
```

✔ Confirms external data availability

---

### 3️⃣ Join Data Lake with Data Warehouse

```sql
SELECT dc.name, pr.*
FROM `thelook_gcda.product_returns` pr
INNER JOIN `thelook_gcda.distribution_centers` dc
ON dc.id = pr.distribution_center_id;
```

✔ Combines external and native tables

---

### 4️⃣ Business Insight Query (Returns by Category)

```sql
SELECT
  dc.name AS distribution_center,
  p.category,
  COUNT(*) AS product_return_count
FROM `thelook_gcda.product_returns` pr
INNER JOIN `thelook_gcda.distribution_centers` dc
  ON dc.id = pr.distribution_center_id
INNER JOIN `thelook_gcda.products` p
  ON p.id = pr.product_id
WHERE p.category = 'Jeans'
GROUP BY dc.name, p.category;
```

✔ Identifies high-return categories by distribution center

---

### 5️⃣ Import CSV into Native Table

* Source: Cloud Storage (CSV)
* Destination: BigQuery Native Table
* Schema: Auto-detected

✔ Demonstrates managed, update-friendly storage

---

## 📊 Key Learnings

| Feature         | External Table     | Native Table            |
| --------------- | ------------------ | ----------------------- |
| Data Location   | Cloud Storage      | BigQuery Storage        |
| Formats         | CSV, Parquet, Avro | Capacitor (BQ internal) |
| Performance     | Depends on file    | Optimized               |
| Update Friendly | Limited            | High                    |

---

## 🛠️ Tools & Technologies

* Google BigQuery
* Google Cloud Storage
* SQL
* Parquet & CSV formats
* Cloud Data Analytics

---

## 🎯 Skills Demonstrated

* Lakehouse Architecture
* Cloud Data Modeling
* External & Native Table Management
* SQL Joins & Aggregations
* Business-Oriented Analytics
* Data Integration Pipelines

---

## 🏁 Conclusion

This project highlights how BigQuery can function as a **lakehouse**, enabling flexible analytics across raw and curated datasets. The approach supports scalable, cost-effective, and high-performance analytics for real-world business use cases.

---

📌 - *Completed as part of the Google Cloud Data Analytics learning program.*
   - *Chat-GPT for documentation.* 

