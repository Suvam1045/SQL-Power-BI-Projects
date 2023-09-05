USE pizza_db;


/* Daily Trend For Total Orders */

SELECT DATENAME(DW, order_date) AS Order_Days , COUNT(DISTINCT order_id) AS  Total_Sales
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY COUNT(DISTINCT order_id) DESC;


/* Monthly Trend For Total Orders */

SELECT DATENAME(MONTH, order_date) AS Months , COUNT(DISTINCT order_id) AS  Total_Sales
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date) 
ORDER BY COUNT(DISTINCT order_id) DESC;

/* Percentage Of Sales By Pizza Category */

SELECT pizza_category, CAST(SUM(quantity) AS  decimal(10,2)) AS total_sales, 
CAST(SUM(quantity) * 100 / (SELECT SUM(quantity) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category
ORDER BY CAST(SUM(quantity) AS  decimal(10,2)) DESC;

/* Percentage Of Revenue By Pizza Category */

SELECT pizza_category, CAST(SUM(total_price) AS  decimal(10,2)) AS total_revenue, 
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category
ORDER BY CAST(SUM(total_price) AS  decimal(10,2)) DESC;


/* Percentage Of Sales By Pizza Name */

SELECT pizza_name, CAST(SUM(quantity) AS  decimal(10,2)) AS total_sales, 
CAST(SUM(quantity) * 100 / (SELECT SUM(quantity) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_name
ORDER BY CAST(SUM(quantity) AS  decimal(10,2)) DESC;


/* Percentage Of Revenue By Pizza Name */

SELECT pizza_name, CAST(SUM(total_price) AS  decimal(10,2)) AS total_revenue, 
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_name
ORDER BY CAST(SUM(total_price) AS  decimal(10,2)) DESC;

/* Percentage Of Sales By Pizza Size */

SELECT pizza_size, CAST(SUM(quantity) AS  decimal(10,2)) AS total_sales, 
CAST(SUM(quantity) * 100 / (SELECT SUM(quantity) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY CAST(SUM(quantity) AS  decimal(10,2)) DESC;


/* Percentage Of Revenue By Pizza Size */

SELECT pizza_size, CAST(SUM(total_price) AS  decimal(10,2)) AS total_revenue, 
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY CAST(SUM(total_price) AS  decimal(10,2)) DESC;
















