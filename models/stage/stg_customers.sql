with
    customers as (
        select
        *
        from {{ source("src","customers") }}
    )

select *
from customers
