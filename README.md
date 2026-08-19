# Superstore SQL Analysis

## Project Overview

This project demonstrates SQL-based data analysis using the Superstore transactional dataset.

The project focuses on using MySQL to clean, explore, analyze, and derive insights from sales data using basic to intermediate SQL concepts.

## Objectives

* Import and validate Superstore data
* Perform basic data cleaning and quality checks
* Analyze sales, profit, quantity, and discount
* Use filtering and sorting to explore the dataset
* Perform aggregation using SQL functions
* Analyze data using `GROUP BY` and `HAVING`
* Use `CASE` expressions for data classification
* Use subqueries for comparative analysis
* Perform data analysis using `JOIN`
* Use window functions for ranking and comparative analysis

## Dataset

The project uses the Superstore transactional dataset.

### Columns Used

* Ship Mode
* Segment
* Country
* City
* State
* Postal Code
* Region
* Category
* Sub-Category
* Sales
* Quantity
* Discount
* Profit

## Technologies Used

* MySQL
* MySQL Workbench
* SQL
* GitHub

## SQL Concepts Demonstrated

### Data Cleaning & Validation

* Record count
* NULL value checks
* Duplicate record checks
* Data validation

### Basic SQL

* `SELECT`
* `WHERE`
* `DISTINCT`
* `ORDER BY`

### Aggregate Functions

* `COUNT()`
* `SUM()`
* `AVG()`
* `MIN()`
* `MAX()`

### Grouping & Filtering

* `GROUP BY`
* `HAVING`

### Conditional Logic

* `CASE`

### Subqueries

* Comparison with aggregate results
* Analysis of values above or below averages

### Joins

* `INNER JOIN`
* `LEFT JOIN`

### Window Functions

* `RANK()`
* `SUM() OVER()`
* `AVG() OVER()`

## Project Workflow

```text
Superstore Dataset
        ↓
Data Import
        ↓
Data Cleaning & Validation
        ↓
Basic SQL Analysis
        ↓
Aggregation & Grouping
        ↓
CASE & Subqueries
        ↓
JOIN Analysis
        ↓
Window Functions
        ↓
Business Insights
```

## Key Analysis Areas

The project analyzes questions such as:

* What are the total sales and total profit?
* What is the average sales value?
* Which regions generate the highest sales?
* Which categories generate the highest profit?
* Which categories exceed a specified sales threshold?
* Which transactions are profitable or loss-making?
* Which transactions have sales above the overall average?
* How do category and region-level results compare?
* How can categories be ranked based on profit?
* How can window functions be used for comparative analysis?

## Project File

### `superstore_sql_analysis.sql`

Contains the complete SQL implementation, including data validation, cleaning checks, analytical queries, aggregate functions, grouping, HAVING, CASE expressions, subqueries, joins, and window functions.

## Project Focus

This project focuses specifically on **SQL analysis and querying**.

A separate Superstore project is used to demonstrate **MySQL database administration and performance management**, including indexing, `EXPLAIN`, user privileges, transactions, and backup/restore.

## Author

**Vikas Sovilkar**
