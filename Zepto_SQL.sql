

DROP TABLE IF EXISTS Zepto; 
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


SELECT * FROM Zepto;
---DATA EXPLORATION

--COUNT OF ROWS
SELECT COUNT(*) FROM Zepto;

--NULL VALUES
SELECT * FROM Zepto
WHERE category IS NULL
OR name IS NULL OR mrp IS NULL OR discountpercent IS NULL
OR availablequantity IS NULL OR discountedsellingprice IS NULL
OR weightingms IS NULL OR outofstock IS NULL 
OR quantity IS NULL;

--DIFFERENT PRODUCT CATEGORY
SELECT DISTINCT(category) FROM zepto
ORDER BY  category;

--PRODUCT IN STOCK VS OUT OF STOCK
SELECT outofstock, COUNT(Sku_id) AS Count_sku_id
FROM Zepto
GROUP BY  outofstock;

--product names present multiple times
SELECT name,COUNT(sku_id) AS No_of_Skus FROM zepto
GROUP BY name
HAVING COUNT(sku_id)>1
ORDER BY COUNT(sku_id) DESC;
--or   
SELECT name, count(name) AS multipletimes
FROM Zepto
GROUP BY name
HAVING COUNT(NAME)>1
ORDER BY COUNT(NAME) DESC;


--data cleaning

--products with price = 0
SELECT * from zepto
WHERE mrp = 0 OR discountedsellingprice = 0;

DELETE FROM zepto
WHERE mrp = 0;

--convert paise to rupees
UPDATE zepto
SET mrp = mrp/100.0, discountedsellingprice = discountedsellingprice/100.0;

SELECT mrp,discountedsellingprice FROM zepto;

--DATA ANALYSIS
-- Q1. Find the top 10 best-value products based on the discount percentage./which product with highest dicount price
SELECT name,mrp,discountpercent FROM zepto --- NO use of DISTINCT
ORDER BY discountpercent DESC
LIMIT 10;

--Q2.What are the Products with High MRP but Out of Stock
SELECT name,mrp,outofstock FROM zepto
WHERE outofstock = 'True'
ORDER BY mrp DESC
LIMIT 3;

--Q3.Calculate Estimated Revenue for each category
SELECT category,SUM(discountedsellingprice*availablequantity) AS Total_Revenue
FROM zepto
GROUP BY category
ORDER BY Total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT  category,name,mrp,discountpercent FROM zepto
WHERE mrp>500 AND discountpercent<10
ORDER BY mrp DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,AVG(discountpercent) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT name,mrp,discountedsellingprice,ROUND(discountedsellingprice/weightingms,2) AS price_per_gram
FROM zepto
WHERE weightInGms>100 
ORDER BY price_per_gram DESC;

--Q7.Group the products into categories like Low, Medium, Bulk.  //BETTER FOR PACKAGING //DELVERY PLANNING
SELECT name,weightingms,
CASE WHEN weightingms<1000 THEN 'Low'
WHEN weightingms<5000 THEN 'Medium'
ELSE 'Bulk' END AS weightin_category
FROM zepto;

--Q8.What is the Total Inventory Weight Per Category 
SELECT category, SUM(weightingms* availablequantity) AS Total_weight_category
FROM zepto
GROUP BY category
ORDER BY Total_weight_category;
















