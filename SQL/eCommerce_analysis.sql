create database eCommerce_analysis;

use eCommerce_analysis;

CREATE TABLE sales (
    order_id VARCHAR(50),
    order_date DATE,
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    age INT,
    gender VARCHAR(20),
    city VARCHAR(100),
    state VARCHAR(100),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    product VARCHAR(150),
    quantity INT,
    unit_price DECIMAL(12,2),
    discount_percent DECIMAL(5,2),
    sales DECIMAL(14,2),
    cost DECIMAL(14,2),
    shipping_cost DECIMAL(12,2),
    profit DECIMAL(14,2),
    payment_method VARCHAR(50),
    order_status VARCHAR(50),
    delivery_days INT,
    returned VARCHAR(10),
    profit_margin decimal(5,2),
    year int,
    month int
);

select count(*) from sales;

describe sales;

alter table sales
rename column sales TO selling_price,
rename column  cost to cost_price;

select * from sales limit 10;



-- KPI Analysis --
-- ------------------------

-- Total Sales Amount
select sum(selling_price) AS total_sales 
from sales;

-- Total_Profit
Select sum(profit) as Total_Profit 
from sales;

-- Total_Orders
Select count(distinct(order_id)) as Total_orders
from sales;

-- Unique Customers
select count(distinct(customer_id)) as Total_Customers
from sales; 

-- Average_order_value
select sum(selling_price) / count(distinct order_id) as average_order_value
from sales;

-- Quantities Sold
select sum(quantity) as total_quantity
from sales;

-- Profit_Margin
select sum(profit)/sum(selling_price) * 100 as Profit_margin
from sales;



-- Category Analysis --
-- --------------------

-- Sales by category
select category, sum(selling_price) as sales_by_category
from sales
group by category
order by sales_by_category desc;

-- Profit_by_category
select category, sum(profit) as profit_by_category
from sales
group by category
order by profit_by_category desc;

-- profit_margin category wise
select category, 
		sum(selling_price) as total_sales,
		sum(profit) as total_profit,
        sum(profit)/sum(selling_price) * 100 as profit_margin
from sales
group by category
order by profit_margin desc;

-- Different profit segments
select order_id, profit_margin,
	case
		when profit_margin < 0 then 'Loss'
        when profit_margin < 10 then 'Low Profit'
        when profit_margin < 20 then 'Medium Profit'
        else 'High Profit'
	end as profit_segments
from sales;

-- profit_segment wise number of orders, sales and profits
select
	case
		when profit_margin < 0 then 'Loss'
        when profit_margin < 10 then 'Low Profit'
        when profit_margin < 20 then 'Medium Profit'
        else 'High Profit'
	end as profit_segments,
    count(*) as orders,
    sum(selling_price) as total_sales,
    sum(profit) as total_profit
from sales
group by profit_segments
order by total_sales desc;


-- products having sales more than average sales
select product, sum(selling_price) as total_sales
from sales
group by product
having sum(selling_price) > 
( 	
	select avg(product_sales)
	from ( 
			select product, 
				   sum(selling_price) as product_sales
			from sales
            group by product
		) as product_summary
)
order by total_sales desc;
			
-- rank of products on basis of quanitites sold
select product, sum(quantity) as qunatities_sold,
	rank() OVER(
			ORDER BY sum(quantity) desc
            ) as product_rank
from sales
group by product;	

-- rank of products on basis of quanitites sold in their category
select category, product, sum(quantity) as qunatities_sold,
	rank() OVER(
			partition by category
			ORDER BY sum(quantity) desc
            ) as product_rank
from sales
group by category, product;	

-- top 3 products in each category
with ranked_products as(
select category, product, sum(quantity) as qunatities_sold,
	rank() OVER(
			partition by category
			ORDER BY sum(quantity) desc
            ) as category_rank
from sales
group by category, product
)
select * 
from ranked_products
where category_rank <= 3;



