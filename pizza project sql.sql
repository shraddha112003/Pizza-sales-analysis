SELECT * FROM pizza_sales;
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;
SELECT SUM(total_price)/COUNT(DISTINCT order_id) as Avg_Order_Value FROM pizza_sales;
SELECT SUM(quantity) AS total_Pizza_Sold FROM pizza_sales;
SELECT COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales;
SELECT CAST(SUM(quantity) AS DECIMAL(10,2))/
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS Avg_Pizza_Per_Order FROM pizza_sales;
SELECT DAYNAME(DW, oredr_date) as order_day, COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales
GROUP BY DAYNAME(DW, order_date);
SELECT 
    DAYNAME(order_date) AS order_day, 
    COUNT(DISTINCT order_id) AS Total_orders 
FROM 
    pizza_sales 
GROUP BY 
    DAYNAME(order_date) 
LIMIT 0, 1000;
SELECT 
    DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS order_day, 
    COUNT(DISTINCT order_id) AS Total_orders 
FROM 
    pizza_sales 
GROUP BY 
    DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d'));

SELECT DAYNAME(MONTH ,order_date) AS Month_Name, COUNT ( DISTINCT order_id) AS Total_Orders 
GROUP BY DAYNAME(MONTH, oredr_date)
ORDER BY Total_Orders DESC;

    
    SELECT 
    DATE_FORMAT(order_date, '%M') AS Month_Name, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM 
    pizza_sales
WHERE 
    order_date IS NOT NULL
GROUP BY 
    DATE_FORMAT(order_date, '%M')
ORDER BY 
    Total_Orders DESC;

SELECT 
    order_date, 
    DAYNAME(order_date) AS Day_Name, 
    MONTHNAME(order_date) AS Month_Name
FROM 
    pizza_sales
LIMIT 10;

SELECT 
    MONTHNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS Month_Name, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM 
    pizza_sales
WHERE 
    order_date IS NOT NULL
GROUP BY 
    MONTHNAME(STR_TO_DATE(order_date, '%Y-%m-%d'))
ORDER BY 
    Total_Orders DESC;


SELECT pizza_category, SUM(total_price) AS Total_sales, SUM(total_price)*100/
(SELECT SUM(total_price) FROM pizza_sales) AS PCT
FROM pizza_sales 

GROUP BY pizza_category;


SELECT 
    pizza_size, 
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_sales, 
    CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC;

SELECT 
    pizza_size, 
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_sales, 
    CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE QUARTER(order_date) = 1) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
WHERE QUARTER(order_date) = 1
GROUP BY pizza_size
ORDER BY PCT DESC
LIMIT 0, 1000;


SELECT  pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name 
ORDER BY Total_Revenue DESC
LIMIT 5;
    
SELECT  pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name 
ORDER BY Total_Revenue ASC
LIMIT 5;
    
SELECT pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC
LIMIT 5;


SELECT pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC
LIMIT 5;
    











