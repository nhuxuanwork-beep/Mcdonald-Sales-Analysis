# Mcdonald-Sales-Analysis
# 🍔 McDonald's Sales & Revenue Performance Analysis

![SQL](https://img.shields.io/badge/SQL-MySQL%2FPostgreSQL-orange?style=for-the-badge&logo=postgresql&logoColor=white)
![PowerBI](https://img.shields.io/badge/Power_BI-Dashboard-yellow?style=for-the-badge&logo=powerbi&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

An end-to-end data analysis project exploring store-level sales, item popularity, order volumes, and peak operating revenue for McDonald's locations.

---

## 📌 Table of Contents
- [Project Summary](#-project-summary)
- [Business Questions Addressed](#-business-questions-addressed)
- [Dataset Overview](#-dataset-overview)
- [Tech Stack & Tools](#-tech-stack--tools)
- [Key Insights & Findings](#-key-insights-findings)
- [Project Structure](#-project-structure)
- [How to Run / Reproduce](#-how-to-run-reproduce)
- [Future Enhancements](#-future-enhancements)
- [Contact & Author](#-contact--author)

---

## 📊 Project Summary
This project utilizes the dataset of 12,234 McDonald orders for 3 months of 2023 to analyze the overall business, including total revenue, menu sales performance, and customer behaviours, and propose a variety of operational ideas to improve business growth.

---

## ❓ Business Questions Addressed
1. **Overall Sales:**
   - What are the total revenue, total orders, and total failed orders?
2. **Menu Performance:**
   - What are the top 10 orders by quantity and revenue?
   - Which food category contributes the largest share of revenue?
   - What will be the most potential food combos in the future?  
3. **Customer behaviors:**
   - What is the average order value (AOV) across all transactions in 3 months?
   - How many orders does each customer have on average?
   - What are the peak days and hours?
   - What is the percentage of orders containing entree(s) that also contain a 'side' and a 'drink'?

---

## 📁 Dataset Overview
- **Source:** [Kaggle— McDonald's Sales Dataset (12,097 Orders)](https://www.kaggle.com/datasets/hisolanki/mcdonalds-sales-dataset-12097-orders)
- **Timeframe:** January 2023 – March 2023
- **Size:** `12,097` orders across 32 menu items.
- **Key Tables / Columns:**
  - `order_details`: Order details ID, Order ID, Order date, Order time, Item ID.
  - `mcdonald_menu_items`: Menu Item ID, Item Name, Category, Price.

---

## 🛠️ Tech Stack & Tools
- **Data Querying & Aggregation:** SQL (`MySQL` / `PostgreSQL` / `SQLite`)
- **Data Cleaning & Wrangling:** Python (`Pandas`, `NumPy`)
- **Data Visualization:** Power BI / Tableau / Matplotlib & Seaborn
- **Environment:** Jupyter Notebook / VS Code

---

## 💡 Key Insights & Findings

> 💡 *Tip: Insert 1-2 screenshots of your dashboard or visual charts here.*

| Metric / Dimension | Observation | Strategic Takeaway |
| :--- | :--- | :--- |
| **Top Category** | Breakfast items contributed **XX%** of morning sales revenue. | Expand morning drive-thru staffing during 7:00 AM – 9:30 AM peak hours. |
| **Peak Sales Hours** | **12:00 PM – 2:00 PM** experienced the highest transaction velocity. | Pre-stage high-volume value meal ingredients to lower order wait times. |
| **Average Basket Size** | Transactions with drinks had a **XX%** higher profit margin. | Implement automated upselling prompts at digital kiosks for beverage pairings. |

---

## 📂 Project Structure

```text
├── data/
│   ├── raw/                 # Original CSV files
│   └── processed/           # Cleaned datasets ready for analysis
├── notebooks/
│   └── eda_sales_analysis.ipynb   # Exploratory Data Analysis in Python
├── sql/
│   ├── 01_data_cleaning.sql       # Cleaning & transformation scripts
│   └── 02_sales_queries.sql       # Analytical SQL queries
├── dashboards/
│   └── mcdonalds_sales_dashboard.pbix # Power BI / Tableau workbook
├── assets/
│   └── dashboard_preview.png      # Screenshot for README
├── README.md                # Project documentation
└── requirements.txt         # Python dependencies
