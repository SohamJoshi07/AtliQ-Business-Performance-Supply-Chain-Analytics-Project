# 🚀 AtliQ Business Performance & Supply Chain Analytics

![SQL](https://img.shields.io/badge/SQL-Advanced-blue)
![Excel](https://img.shields.io/badge/Excel-Analytics-green)
![Domain](https://img.shields.io/badge/Domain-Business%20Analytics-orange)
![Status](https://img.shields.io/badge/Project-Completed-success)

---

## 🏢 Overview

This project delivers a comprehensive analytics solution to evaluate **financial, sales, and supply chain performance** at AtliQ.

Leveraging **SQL and Excel**, the project transforms raw transactional data into actionable insights, enabling stakeholders to identify revenue drivers, optimize supply chain decisions, and improve business performance.

---

## 🎯 Problem Statement

AtliQ lacked a unified analytical view to:

* Identify **top-performing customers, products, and markets**
* Understand **regional sales distribution and contribution**
* Measure **true net sales after discounts and deductions**
* Support **data-driven decision-making** across business functions

---

## 🎯 Objectives

* Perform **multi-dimensional sales analysis** (customer, product, region)
* Evaluate **financial performance and profit drivers**
* Analyze **regional trends** for supply chain optimization
* Build **structured reports** for business stakeholders

---

## 🏗️ Data Architecture

```
                dim_customer        dim_product
                      │                  │
                      └──────┬───────────┘
                             │
                  fact_sales_monthly
                             │
         ┌───────────────────┴───────────────────┐
         │                                       │
fact_gross_price              fact_pre_invoice_deductions
```

---

## 🧠 Key Insights

* Identified **top customers, products, and markets** driving the majority of revenue
* Calculated **customer-wise and region-wise contribution %** using window functions
* Derived **net sales metrics** by incorporating pricing and deduction data
* Improved query efficiency using **CTEs, optimized joins, and aggregations**
* Highlighted key trends for **sales growth and supply chain optimization**

---

## 🧰 Tech Stack

* **SQL** → Data extraction, transformation, and analytics
* **Excel** → Reporting, KPI tracking, and business summaries
* **Database Tables**:

  * `fact_sales_monthly`
  * `dim_customer`
  * `dim_product`
  * `fact_gross_price`
  * `fact_pre_invoice_deductions`

---

## 📊 Key Analytics

### 🔹 Top Performers

* Ranked **customers, products, and markets** based on revenue contribution

### 🔹 Regional Sales Analysis

* Computed **region-wise sales share (%)** using window functions

### 🔹 Customer Contribution

* Analyzed **customer-level net sales %** to identify high-value segments

---

## ⚙️ Key SQL Concepts Used

* Joins (Inner, Left)
* Common Table Expressions (CTEs)
* Window Functions (`RANK()`, `SUM() OVER()`)
* Aggregations & Grouping
* Query Optimization Techniques

---

## 📈 Results & Business Impact

* Identified **high-revenue regions and key customers**
* Improved **financial transparency and reporting efficiency**
* Enabled **data-driven decision-making** for sales and supply chain teams
* Strengthened **business strategy through actionable insights**

---

## 💡 Key Highlights

✔ End-to-end analytics workflow (**raw data → insights**)
✔ Strong use of **advanced SQL techniques**
✔ Business-focused problem-solving approach
✔ Clear linkage between **data insights and business impact**

---

## 🚀 Future Enhancements

* Build **interactive Power BI dashboards**
* Develop **automated data pipelines (ETL workflows)**
* Integrate **machine learning models for demand forecasting**

---

## 📌 How to Use

1. Clone the repository
2. Load the dataset into your SQL environment
3. Run SQL scripts from the `/queries` folder
4. Explore insights via Excel reports

---

## ⭐ Project Value

This project demonstrates:

* Strong **SQL + Analytics fundamentals**
* Ability to solve **real-world business problems**
* Understanding of **data modeling and performance optimization**
* Readiness for **Data Analyst / Data Scientist roles**
