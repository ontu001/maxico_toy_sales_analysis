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

