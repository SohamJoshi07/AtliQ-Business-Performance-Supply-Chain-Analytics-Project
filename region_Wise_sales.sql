with cte1 as (
select
c.customer,
c.region,
	round(sum(net_Sales)/1000000,2) as Net_Sales_In_Mil
from gdb0041.net_sales n
join dim_customer c
on n.customer_code = c.customer_code
where fiscal_year=2021 
group by c.customer, c.region
)

select *,
	Net_Sales_In_Mil*100/sum(Net_Sales_In_Mil) over(partition by region) as region_wise_pct_share
from cte1
order by net_Sales_in_mil desc;
