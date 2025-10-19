with cte1 as 
(	select
		customer,
		round(sum(net_Sales)/1000000,2) as Net_Sales_In_Mil
	from gdb0041.net_sales n
	join dim_customer c
	on n.customer_code = c.customer_code
	where fiscal_year=2021 
    group by customer)


select *,
net_sales_in_mil*100/sum(net_sales_in_mil) over() as net_sales_pct
from cte1
order by Net_Sales_In_Mil desc

