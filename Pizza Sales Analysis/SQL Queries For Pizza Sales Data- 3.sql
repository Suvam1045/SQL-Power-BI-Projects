USE pizza_db;

/* Top 5 Best Sellers Pizza By  Sales*/

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Sales
FROM dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Sales DESC;

/* Bottom 5 Best Sellers Pizza By  Sales*/

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Sales
FROM dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Sales ASC ;

 /* Top 5 Best Sellers Pizza By  Revenue */

SELECT TOP 5 pizza_name, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue
FROM dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;


/* Bottom 5 Best Sellers Pizza By  Revenue */

SELECT TOP 5 pizza_name, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue
FROM dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC;

/* Top 5 Best Sellers Pizza By  Orders */

SELECT TOP 5 pizza_name,  COUNT(DISTINCT order_id) AS Total_Orders
FROM dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;

/* Bottom 5 Best Sellers Pizza By  Orders */

SELECT TOP 5 pizza_name,  COUNT(DISTINCT order_id) AS Total_Orders
FROM dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC;

