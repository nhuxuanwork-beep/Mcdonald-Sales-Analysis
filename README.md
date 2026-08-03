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

---

## 📊 Project Summary
This project uses a dataset of 12,234 McDonald orders from 3 months in 2023 to analyze the overall business, including total revenue, menu sales performance, and customer behaviours, and to propose a variety of operational ideas to improve business growth.

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
- **Data Querying & Aggregation:** SQL (`MySQL`)
- **Data Visualization:** Power BI 

---

## 💡 Key Insights & Findings
<p align="center">
<img width="576" height="326" alt="image" src="https://github.com/user-attachments/assets/581c4f91-097a-49e0-b31c-d0b3d2c3ac3d" />
<img width="575" height="327" alt="image" src="https://github.com/user-attachments/assets/95795fbb-2537-468d-ae15-b7dd08cdb7da" />
<img width="578" height="329" alt="image" src="https://github.com/user-attachments/assets/15f3b482-b3c0-4879-aeaa-3d77729aa434" />
<img width="575" height="323" alt="image" src="https://github.com/user-attachments/assets/b3ba91bd-4245-4c66-bbf8-75da99852dc5" />
<img width="580" height="326" alt="image" src="https://github.com/user-attachments/assets/46ff2eef-f184-47fb-b300-3ac3ae8901d7" />
</p>

| Dimension | Analysis | Strategic Planning |
| :--- | :--- | :--- |
| **Overall Sales** | - Total Revenue is $61,003.78.<br>- Total orders are 12,234.<br>- Total Failed Orders are 137, taking up 1.12% of the overall orders.<br>- The cumulative revenue by year and day is, by and large, very steady over the first three months. | - The business has grown steadily over the first three months, which means that any operational modifications are less risky to make.<br>- Orders fail due to many possible reasons: machine errors, shipping complications, payment failures, etc. The number of failed orders is fairly low but still needs more investigation to prevent future loss. |
| **Menu Performance** | - **Top 5 orders by quantity:** Big Mac, Side Salad, Bulgogi Burger, Quarter Pounder with cheese, French Fries(large).<br>- **Top 5 orders by revenue:** Meatball Marinara, Quarter Pounder with Cheese, Angus Third Pounder, Bulgogi Burger, Big Mac. | - Quarter Pounder with Cheese, Bulgogi Burger, and Big Mac are the top items by both order volume and revenue.<br>- Ensure plenty of ingredients and available staff for these orders to prevent product shortage and maximize profits and customer satisfaction every day.<br>- Feature them prominently on menu and social media, position them as "must-try"/"best-sellers" dishes to encourage repeat orders<br>- Offer premium upgrades like artisanal cheeses or other exotic toppings to justify higher prices, etc.|
| **Menu Performance** | Burgers, Chicken, Pasta, and Sandwiches are the top four dishes taking up the largest share of revenue, while Breakfast, Shakes, Salad, and Wraps produce the lowest. Meanwhile, Fries and Sides stand in the middle of the list. | - Top-selling items are all entrees, and the remaining are complimentary food. The business can design a variety of food combos to boost sales (e.g., burgers with salads and fries; chicken with shakes and wraps). <br>- Monitor sales, margins, and customer feedback for each top item to improve the menu. |
| **Menu Performance** | Identify a variety of combos along with each item's sales data. For example, (131) Chicken Parm Sandwich and (132) Veggie Deluxe go well with each other since 100% of people who ordered 132 also ordered 131 (while the reverse is not true), which means that this combo is highly likely to be sold at a profit. | To identify potential food combos that represent the top food trending among the customers, as well as the market demand for them.
| **Customer Behaviours** | Average order value is $5.04 per order. The peak day and hour are Monday and 12, respectively. Each person orders 2 items at once on average. 4% of the total orders, including the entrée, also contain the sides and shakes | - Increase AOV through combo meals, upselling fries/drinks, or limited-time bundles.<br>- Schedule more staff, ensure inventory is stocked on Monday, especially at lunch, to maximize revenue. Create meal deals that bundle an entrée, fries, and a shake at a slight discount, or promote shakes with combo meals.

---

## 📂 Project Structure

├── source/                            # Source for the project
│   └── Source/                         # Original CSV files
├── sql/
│   ├── 01_Overall_Sales.sql            # Overall sales analysis
│   ├── 02_Menu_Performance.sql         # Menu performance analysis
│   └── 03_Customer_Behaviours.sql      # Customer behavior analysis
├── dashboards/
│   └── mcdonalds_sales_dashboard.pbix  # Power BI dashboard
└── README.md                           # Project documentation
