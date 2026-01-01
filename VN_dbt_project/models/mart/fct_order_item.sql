
with 

order_item as (
    select
        oi.*, 
        cast(sum(oi.price) over (partition by oi.order_id) as numeric) as total_price_per_order,
        cast(sum(oi.freight_value) over (partition by oi.order_id) as numeric) as total_freight_per_order,
        cast(sum(oi.total_cost_per_item) over (partition by oi.order_id) as numeric) as total_order_cost

    from
        {{ ref('order_item_stg') }} oi
)

select * from order_item

