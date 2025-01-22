select * from pizza_sales_

SELECT FORMAT(SUM(total_price), 'N0') AS Total_Revenue FROM pizza_sales_;

SELECT FORMAT(SUM(total_price)/COUNT(DISTINCT(order_id)), 'N0') AS Average_Order_Value FROM pizza_sales_;

SELECT FORMAT(SUM(quantity), 'N0') AS Total_Pizza_Sold FROM pizza_sales_;

SELECT FORMAT(COUNT(DISTINCT(order_id)), 'N0') AS Total_Orders FROM pizza_sales_;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS AVG_Pizzas_Per_Order FROM pizza_sales_


