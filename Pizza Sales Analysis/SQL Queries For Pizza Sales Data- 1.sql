USE pizza_db;

/* Total Sales */

SELECT SUM(quantity) AS Total_Sales FROM dbo.pizza_sales;

/* Total Revenue */

SELECT SUM(total_price) AS Total_Revenues FROM dbo.pizza_sales;

/* Average Order Value */

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value FROM dbo.pizza_sales;

/* Total Orders */

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM dbo.pizza_sales;

/* Average Pizzas Per Order */

SELECT CAST(SUM(quantity) AS DECIMAL (10,2))/CAST (COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS Avg_Pizzas_Per_Order FROM dbo.pizza_sales;

