use pizza;

select * from pizza_sales;

select sum(total_price) as Total_revenue from pizza_Sales;

select sum(total_price)/count(distinct order_id)
as Avg_order_value from pizza_sales;

select sum(quantity) as Total_pizza_sold from pizza_sales;

select COUNT(distinct order_id) as total_orders from pizza_sales;

select CAST(CAST(sum(quantity) as decimal(10,2)) /
CAST(count(distinct order_id) as decimal(10,2)) as decimal(10,2))
as Avg_pizzas_per_order from pizza_sales;

select * from pizza_sales;

select DATENAME(DW, order_Date) as order_day, count(distinct order_id)
as total_orders from pizza_sales
group by DATENAME(DW, order_Date);

select datename(month, order_date) as month_name, count(distinct order_id) as Total_orders
from pizza_sales group by datename(month, order_Date) order by Total_orders desc;

select pizza_category, sum(total_price) as Total_sales, sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales) as Pct_Total_sales from pizza_sales
group by pizza_category;

select pizza_size, sum(total_price) as Total_sales, CAST(sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales) as decimal(10,2)) as Pct_Total_sales from pizza_sales
group by pizza_size order by Pct_Total_sales desc;

select Top 5 pizza_name, sum(total_price) as Total_revenue ,
sum(quantity) as Total_quantity, count(distinct order_id) Total_orders
from pizza_sales
group by pizza_name 
order by Total_revenue desc;

select Top 5 pizza_name, sum(total_price) as Total_revenue ,
sum(quantity) as Total_quantity, count(distinct order_id) Total_orders
from pizza_sales
group by pizza_name 
order by Total_revenue asc;
