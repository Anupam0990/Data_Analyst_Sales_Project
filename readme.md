# e_commerce_sales_snalysis

## Project Overview

This project is an end-to-end E-Commerce Sales Analysis project. The objective of this project is to analyze sales performance, profit, customers, products, and regional trends using multiple data analysis tools.

## Dataset

A synthetic sales dataset generated for educational and portfolio purpose

## Tools Used

- Microsoft Excel
- Python
- Pandas
- Matplotlib
- MySQL
- Power BI

## Project Workflow

Raw Data
→ Excel Data Cleaning and Pivot Table Analysis
→ Python Data Analysis and Feature Engineering
→ MySQL SQL Analysis
→ Power BI Dashboard

## Excel

The raw dataset was cleaned using Microsoft Excel.

Tasks performed:

- Handled missing values
- Removed/handled blank values
- Performed initial data analysis
- Created Pivot Tables

## Python Analysis

Python and Pandas were used for deeper exploratory data analysis.

Tasks performed:

- Loaded and analyzed the dataset using Pandas
- Performed data exploration
- Added new columns/features
- Performed deeper analysis
- Created visualizations using Matplotlib
- Exported the processed dataset as a CSV file

## SQL Analysis

The processed CSV dataset was analyzed using MySQL.

SQL concepts used:

- SELECT
- WHERE
- GROUP BY
- HAVING
- CASE WHEN
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions

## Power BI Dashboard

An interactive Power BI dashboard was created using the processed CSV dataset.

The dashboard includes:

- Total Sales
- Total Profit
- Total Orders
- Average Order Value
- Total Customers
- Profit Margin
- Return Rate
- Monthly Sales Trend
- Sales by Category
- Profit by Category
- Top 10 Products by Sales
- Total Sales by State

## Dashboard Preview

![e_commerce_sales_dashboard](images/e_commerce_sales_dashboard.png)

## Key Insights

- Analyzed overall sales and profit performance.
- Identified top-performing product categories.
- Identified the top 10 products based on sales.
- Analyzed sales trends over time.
- Compared sales and profit across categories.
- Analyzed sales performance across different states.
- Calculated important business KPIs such as Profit Margin and Return Rate.

## Project Structure

```text
e_commerce_sales_analysis/
│
├── Data/
│   ├── Raw/
│   │   └── e_commerce_sales_analysis_raw.csv
│   ├── Cleaned/
│   │   └── cleaned_data.csv
│   └── Processed/
│   │   └── e_commerce_sales_cleaned.csv
│
├── Excel/
│   └── e_commerce_excel_analysis.xlsx
│
├── Python/
│   └── e_commerce_analysis.ipynb
│
├── Sql/
│   └── e_commerce_analysis.sql
│
├── PowerBi/
│   └── e_commerce_sales_Dashboard.pbix
│
├── Images/
│   └── e_Commerce_sales_dashboard.png
│   ├── Matplotlib Charts/
├   ├   └── Profit_by_Category.png
├   ├   └── Discount_vs_profit.png
├   ├   └── Return_Rate_By_Category.png
├   ├   └── sales_by_category.png
├   ├   └── Sales_By_State.png
├   ├   └── Top_10_Products_by_Sales.png
├   ├   └── monthly_sales.png
│
└── readme.md