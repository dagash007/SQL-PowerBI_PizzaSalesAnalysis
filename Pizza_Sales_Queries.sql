select * from pizza_sales_

SELECT FORMAT(SUM(total_price), 'N0') AS Total_Revenue FROM pizza_sales_;

SELECT FORMAT(SUM(total_price)/COUNT(DISTINCT(order_id)), 'N0') AS Average_Order_Value FROM pizza_sales_;

SELECT FORMAT(SUM(quantity), 'N0') AS Total_Pizza_Sold FROM pizza_sales_;

SELECT FORMAT(COUNT(DISTINCT(order_id)), 'N0') AS Total_Orders FROM pizza_sales_;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS AVG_Pizzas_Per_Order FROM pizza_sales_

SELECT DATENAME(DW, order_date) Day_Of_Week, FORMAT(COUNT(DISTINCT(order_id)), 'N0') Total_Orders FROM pizza_sales_
GROUP BY DATENAME(DW, order_date)
ORDER BY 2 DESC

SELECT DATENAME(MONTH, order_date) MonthOfYear, FORMAT(COUNT(DISTINCT(order_id)), 'N0')Total_Orders FROM pizza_sales_
GROUP by DATENAME(MONTH, order_date)
ORDER BY 2 DESC

SELECT pizza_category, FORMAT(CAST (SUM(total_price)AS decimal(10,2)), 'N0') TotalSales,
CAST (SUM(total_price)*100 / (SELECT SUM(total_price) FROM pizza_sales_) AS DECIMAL(10,2)) SalesPercentage FROM pizza_sales_
GROUP BY pizza_category
ORDER BY 3 DESC

SELECT pizza_category, FORMAT(CAST (SUM(total_price)AS decimal(10,2)), 'N0') TotalSales,
CAST (SUM(total_price)*100 / (SELECT SUM(total_price) FROM pizza_sales_ WHERE MONTH(order_date)=1) AS DECIMAL(10,2)) SalesPercentage FROM pizza_sales_
WHERE MONTH(order_date)=1
GROUP BY pizza_category
ORDER BY 3 DESC

SELECT pizza_size, FORMAT(CAST (SUM(total_price)AS decimal(10,2)), 'N0') TotalSales,
CAST (SUM(total_price)*100 / (SELECT SUM(total_price) FROM pizza_sales_ WHERE DATEPART(QUARTER, order_date)=1) 
AS DECIMAL(10,2)) SalesPercentage FROM pizza_sales_
WHERE DATEPART(QUARTER, order_date)=1
GROUP BY pizza_size
ORDER BY 3 DESC

SELECT TOP 5 pizza_name, FORMAT(CAST (SUM(total_price)AS decimal(10,2)), 'N0') TotalRevenue FROM pizza_sales_
GROUP BY pizza_name
ORDER BY 2 DESC

SELECT TOP 5 pizza_name, FORMAT(CAST (SUM(total_price)AS decimal(10,2)), 'N0') TotalRevenue FROM pizza_sales_
GROUP BY pizza_name
ORDER BY 2 ASC

SELECT TOP 5 pizza_name, SUM(quantity) AS TotalQuantity 
FROM pizza_sales_
GROUP BY pizza_name
ORDER BY 2 DESC;

SELECT TOP 5 pizza_name, SUM(quantity)  TotalQuantity FROM pizza_sales_
GROUP BY pizza_name
ORDER BY 2 ASC

SELECT TOP 5 pizza_name, COUNT(distinct order_id) AS TotalOrder
FROM pizza_sales_
GROUP BY pizza_name
ORDER BY 2 DESC;

SELECT TOP 5 pizza_name, COUNT(distinct order_id) AS TotalOrder
FROM pizza_sales_
GROUP BY pizza_name
ORDER BY 2 ASC;