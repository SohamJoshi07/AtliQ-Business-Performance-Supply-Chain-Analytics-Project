select s.date, p.product_code, p.product, s.customer_code, p.variant, g.gross_price as Gross_price_per_item,
round(g.gross_price*s.sold_quantity,1) as Gross_Price_Total, pre.pre_invoice_discount_pct 
from fact_sales_monthly s
join dim_product p
on s.product_code = p.product_code
join fact_gross_price g
on g.fiscal_year = get_fiscal_year(s.date)
and g.product_code = p.product_code
join fact_pre_invoice_deductions pre
on pre.customer_code = s.customer_code and
pre.fiscal_year = get_fiscal_year(s.date)
where s.customer_code = 90002002
and get_fiscal_year(s.date)= 2021
limit 100000;

### Module: Performance Improvement # 1
select s.date, p.product_code, p.product, p.variant, g.gross_price as Gross_price_per_item,
round(g.gross_price*s.sold_quantity,1) as Gross_Price_Total, pre.pre_invoice_discount_pct 
from fact_sales_monthly s 
join dim_date d
on d.calendar_date = s.date
join dim_product p
on p.product_code = s.product_code
join fact_gross_price g
on g.fiscal_year = d.fiscal_year
and g.product_code = s.product_code
join fact_pre_invoice_deductions pre
on pre.customer_code = s.customer_code and
pre.fiscal_year = d.fiscal_year
where d.fiscal_year = 2021
limit 100000;

### Module: Performance Improvement # 2
select s.date, s.customer_code, p.product_code, p.product, p.variant, s.sold_quantity, g.gross_price as gross_Price_per_item, round(g.gross_price*s.sold_quantity,1) as Gross_Price_Total, pre.pre_invoice_discount_pct
from fact_sales_monthly s
join dim_product P
on s.product_code = p.product_code
join fact_gross_price g
on g.fiscal_year = s.fiscal_year
and g.product_code = p.product_code
join fact_pre_invoice_deductions pre
on pre.customer_code = s.customer_code
where s.fiscal_year = 2021;

with cte1 as 
(
	select s.date,pre.fiscal_year, s.customer_code, p.product_code, p.product, c.market, p.variant, s.sold_quantity, g.gross_price as gross_Price_per_item, round(g.gross_price*s.sold_quantity,1) as Gross_Price_Total, pre.pre_invoice_discount_pct
	from fact_sales_monthly s
	join dim_customer c
	on s.customer_code = c.customer_code
	join dim_product P
	on s.product_code = p.product_code
	join fact_gross_price g
	on g.fiscal_year = s.fiscal_year
	and g.product_code = p.product_code
	join fact_pre_invoice_deductions pre
	on pre.customer_code = s.customer_code
	and s.fiscal_year = pre.fiscal_year
)

select *,
(gross_price_total-pre_invoice_discount_pct)*gross_price_total as Net_Invoice_Sales
from cte1
limit 100000;
