with cte1 as (
SELECT
	p.division, 
	p.product, 
	sum(s.sold_quantity) as Total_Quantity
FROM fact_sales_monthly s 
join dim_product p 
on s.product_code = p.product_code
where fiscal_year = 2021
group by p.product, p.division
),

cte2 as (
	select *,
		dense_rank() over(partition by division) as Products_Rank
	from cte1
	order by total_quantity desc
)

select * from cte2
where products_rank<=3