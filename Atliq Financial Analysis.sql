-- MONTH
-- PRODUCT NAME
-- VARIENT NAME
-- SOLD QUANTITY
-- GROSS PRICE PER ITEM
-- GROSS PRICE TOTAL

select * from fact_sales_monthly
where customer_code =90002002 and 
get_fiscal_year(date)=2021
order by date 
limit 100000;

select s.date, s.product_code, p.product, p.variant, s.sold_quantity, g.gross_price, round(g.gross_price*s.sold_quantity,1) as gross_price_total
from dim_product p
join fact_sales_monthly s
on p.product_code = s.product_code
join fact_gross_price g 
on g.product_code = s.product_code and 
g.fiscal_year = get_fiscal_year(s.date)
order by date 
limit 100000;

-- Croma Gross Monthly Sales 

select s.date, 
sum(round(gross_price*s.sold_quantity,1)) as Gross_Monthly_Sales
from fact_sales_monthly s
join fact_gross_price g
on s.product_code = g.product_code and g.fiscal_year = get_fiscal_year(s.date)
where customer_code = 90002002
group by s.date;

-- Extracting Gold and silver market

select sum(s.sold_quantity) as Total_Quantity, c.market
from fact_sales_monthly s
join dim_customer c
on s.customer_code = c.customer_code
where get_fiscal_year(s.date)=2021 and market = "india"
group by c.market
