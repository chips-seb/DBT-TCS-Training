select c.c_custkey, sum(o.total_price) total_price, max(o.order_date) as order_date
from {{ref("stg_customers")}} c
join {{ref("stg_orders")}} o
on c.c_custkey=o.cust_key
where c.c_custkey<=1000
group by all