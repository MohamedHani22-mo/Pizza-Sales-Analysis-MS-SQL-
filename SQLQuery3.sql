--Total Revenue
Select
SUM(total_price) AS 'TOTAL REVENUE'
FROM Pizza_Sales

--Average Order Value
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales

--Total Pizzas Sold
Select
SUM(quantity) AS 'TOTAL QUANTITY SOLD'
FROM pizza_sales

--Total Orders
Select
COUNT(DISTINCT order_id) AS 'TOTAL ORDER'
FROM pizza_sales

--Daily Trend for Total Orders
SELECT DATENAME(DW,order_date) as 'Order Day',
Count(distinct order_id) AS 'TOTAL ORDER'
from pizza_sales
group by DATENAME(DW,order_date)

--Hourly Trend for Orders
Select
DATEPART(HOUR,order_time) AS 'Order Hours',
Count(distinct order_id) AS 'TOTAL ORDER'
from pizza_sales
group by DATEPART(HOUR,order_time)
order by DATEPART(HOUR,order_time)

--% of Sales by Pizza Category
SELECT
pizza_category,
CAST(SUM(total_price) AS DECIMAL(10,2)) AS 'TOTAL REVENUE',
CAST(SUM(total_price)*100/(SELECT SUM(total_price) from pizza_sales)
AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
group by pizza_category

--% of Sales by Pizza Size
select pizza_size,
CAST(SUM(total_price) AS DECIMAL(10,2)) AS 'TOTAL REVENUE',
CAST(SUM(total_price)*100/(SELECT SUM(total_price) from pizza_sales)
AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
group by pizza_size
order by pizza_size


--Total Pizzas Sold by Pizza Category
SELECT
pizza_category,
SUM(quantity) as 'TOAL QUANTITY SOLD'
from pizza_sales
Group by pizza_category

--Top 10 Best Sellers by Total Pizzas Sold
Select 
TOP 10 pizza_name,
SUM(quantity) as 'TOATL Pizza SOLD'
from pizza_sales
group by pizza_name
order by [TOATL Pizza SOLD] DESC

--Bottom 10 Best Sellers by Total Pizzas Sold
Select 
TOP 10 pizza_name,
SUM(quantity) as 'TOATL Pizza SOLD'
from pizza_sales
group by pizza_name
order by [TOATL Pizza SOLD] ASC