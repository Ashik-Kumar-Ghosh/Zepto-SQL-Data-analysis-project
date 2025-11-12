# 🏬Zepto E-commerce SQL Data Analyst Portfolio Project

This is a **real-world data analyst portfolio project** based on an **e-commerce inventory dataset** scraped from [Zepto](https://www.zeptonow.com/) — one of India’s fastest-growing quick-commerce startups.  
It simulates how actual analysts use **SQL** to clean, explore, and analyze e-commerce data to generate business insights.

---

## 📌 Project Overview

The goal of this project is to simulate the **end-to-end workflow** of a data analyst working with retail or e-commerce data.

### 🎯 Objectives:
✅ Set up a messy, real-world e-commerce inventory **database**  
✅ Perform **Exploratory Data Analysis (EDA)** to understand product categories and pricing trends  
✅ Apply **Data Cleaning** to handle nulls, duplicates, and inconsistent units  
✅ Write **business-driven SQL queries** to analyze pricing, inventory, stock availability, and revenue  

---

## 📁 Dataset Overview

The dataset is sourced from [Kaggle](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv) and originally scraped from Zepto’s official listings.  
It closely mimics real-world inventory systems where multiple SKUs of the same product exist (e.g., different pack sizes or variants).

### 🧾 Columns:

| Column | Description |
|---------|--------------|
| **sku_id** | Unique identifier for each product entry |
| **name** | Product name as displayed on Zepto |
| **category** | Product category (Fruits, Snacks, Beverages, etc.) |
| **mrp** | Maximum Retail Price (originally in paise, converted to ₹) |
| **discountPercent** | Discount percentage applied on MRP |
| **discountedSellingPrice** | Final selling price (converted to ₹) |
| **availableQuantity** | Units available in inventory |
| **weightInGms** | Product weight in grams |
| **outOfStock** | Boolean flag indicating stock availability |
| **quantity** | Number of units per package |

---

## 🔧 Project Workflow

### 🏗️ 1. Database & Table Creation

We begin by creating the database and defining the table schema:

```sql
CREATE TABLE Zepto(
Sku_ID SERIAL PRIMARY KEY,
Category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(10,2),
discountPercent NUMERIC(10,2),
availableQuantity  INT,
discountedSellingPrice NUMERIC(10,2),
weightInGms INT,
outOfStock BOOLEAN,
quantity INT
);
```
### 2. 🔍 Data Exploration
- Counted the total number of records in the dataset

- Viewed a sample of the dataset to understand structure and content

- Checked for null values across all columns

- Identified distinct product categories available in the dataset

- Compared in-stock vs out-of-stock product counts

- Detected products present multiple times, representing different SKUs

### 3. 🧹 Data Cleaning
- Identified and removed rows where MRP or discounted selling price was zero

- Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability
  
### 4. 📊 Business Insights
- Found top 10 best-value products based on discount percentage

- Identified high-MRP products that are currently out of stock

- Estimated potential revenue for each product category

- Filtered expensive products (MRP > ₹500) with minimal discount

- Ranked top 5 categories offering highest average discounts

- Calculated price per gram to identify value-for-money products

- Grouped products based on weight into Low, Medium, and Bulk categories

- Measured total inventory weight per product category
## 📜 License

MIT — feel free to fork, star, and use in your portfolio.

## 👨‍💻 About the Author
Hey, I’m Ashik Kumar Ghosh — a Data Analytics Enthusiast.


