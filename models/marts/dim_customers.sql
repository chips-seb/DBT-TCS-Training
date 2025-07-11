with customer as (
select * from {{ ref('stg_customers') }}
),
 
nation as (
select * from {{ ref('stg_nations') }}
),
 
region as (
select * from {{ ref('stg_regions') }}
),
final as (
select
        customer.c_custkey as customer_id,
        customer.c_name as name,
        customer.c_address as address,
        nation.nation_id as nation_id,
        nation.name as nation,
        region.region_id as region_id,
        region.name as region,
        customer.c_phone as phone_number,
        customer.c_acctbal as account_balance,
        customer.c_mktsegment as market_segment
        from customer
        inner join nation
            on customer.c_nationkey = nation.nation_id
        inner join region
            on nation.region_id = region.region_id
 
)
select * from final