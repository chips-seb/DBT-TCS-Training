with
    orders as (
        select
        o_totalprice{{money()}} as total_price,
        {{dol_eur('o_totalprice',3)}} as total_price_eur,
            o_orderstatus as status_code,
            o_orderpriority as priority_code,
            o_shippriority as ship_priority,
            o_orderdate as order_date,
            o_custkey as cust_key
        from {{ source("src","orders") }}
    )

select *
from orders
