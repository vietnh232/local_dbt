with 

order_item_stg as (

select distinct 

order_id, 
order_item_id,
product_id, 
count(order_item_id) over (partition by order_id, product_id) as quantity,
seller_id, 
shipping_limit_date::timestamp, 
cast(price as numeric) as price, 
cast(freight_value as numeric) as freight_value, 
cast(price + freight_value as numeric) as total_cost_per_item

from {{source('raw_data', 'order_items')}} 
)

select * from order_item_stg

