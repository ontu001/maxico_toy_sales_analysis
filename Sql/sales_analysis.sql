-- Which are the top-selling products by units?
select
  Product_Name,
  sum(Units) as total_uinit_sold
from `maxico_toy_sales.products` as p
inner join `maxico_toy_sales.sales` as s on p.Product_ID = s.Product_ID
group by 1
order by 2 desc;


-- Which are the top-selling products revenue?
select
  Product_Name,
  round(SUM(s.Units * p.Product_Price),2) AS Total_Revenue,
  sum(Units) as total_uinit_sold
from `maxico_toy_sales.products` as p
inner join `maxico_toy_sales.sales` as s on p.Product_ID = s.Product_ID
group by 1
order by 2 desc;


-- What is the monthly sales trend?

select
  extract(month from s.Date) as Month,
  sum(s.Units) as Total_Order,
  round(sum(s.Units * p.Product_Price),2) as Revenue
from `maxico_toy_sales.sales` as s
inner join `maxico_toy_sales.products` as p on s.Product_ID = p.Product_ID
group by 1;



-- What is the yearly sales trend?

select
  extract(year from s.Date) as Month,
  sum(s.Units) as Total_Order,
  round(sum(s.Units * p.Product_Price),2) as Revenue
from `maxico_toy_sales.sales` as s
inner join `maxico_toy_sales.products` as p on s.Product_ID = p.Product_ID
group by 1;






-- Which cities have the highest sales?
select
  store.Store_City,
  sum(sale.Units) as total_Sell
from `maxico_toy_sales.stores` as store
inner join `maxico_toy_sales.sales` as sale on store.Store_ID = sale.Store_ID
group by 1
order by 2 desc;


-- Which store locations have the highest sales?
select
  store.Store_Location,
  sum(sale.Units) as total_Sell
from `maxico_toy_sales.stores` as store
inner join `maxico_toy_sales.sales` as sale on store.Store_ID = sale.Store_ID
group by 1
order by 2 desc;





-- What is the average order value per store?
select
  s.Store_Name,
  round(sum(sale.Units * p.Product_Price) / count( distinct sale.Sale_ID)) as avg_order-Value
from `maxico_toy_sales.stores` as s
inner join `maxico_toy_sales.sales` as sale on s.Store_ID = sale.Store_ID
inner join `maxico_toy_sales.products` as p on p.Product_ID = sale.Product_ID
group by 1
order by 2 desc;


-- Which products have the highest profit margin?
select 
  Product_Name,
  round(Product_Price - Product_Cost, 2) as Porfit_Mergin
from `maxico_toy_sales.products`
order by 2 desc;




-- How do sales differ across product categories?
select
  p.Product_Category,
  sum(s.Units) as Unit_Sold,
  round(sum(s.Units * p.Product_Price),2) as Total_Revenue,
  round(avg(p.Product_Price),2) as Avg_Selling_Price,
  sum(s.Units * (p.Product_Price - p.Product_Cost)) as Total_Profit
from `maxico_toy_sales.products` as p
inner join `maxico_toy_sales.sales` as s on p.Product_ID = s.Product_ID
group by 1;


