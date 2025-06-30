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

