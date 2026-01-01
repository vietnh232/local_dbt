with 

order_stg as (

select  

order_id,
customer_id,
order_status,
order_purchase_timestamp::date,
order_approved_at::date,
order_delivered_carrier_date::date,
order_delivered_customer_date::date,
order_estimated_delivery_date::date,

extract(hour from (order_approved_at::timestamp - order_purchase_timestamp::timestamp)) as time_ordered_to_approved,

extract(hour from (order_delivered_customer_date::timestamp - order_purchase_timestamp::timestamp)) as time_purchased_to_delivered,

case 
    when order_estimated_delivery_date::timestamp >= order_delivered_customer_date::timestamp
        then True
    when order_estimated_delivery_date::timestamp < order_delivered_customer_date::timestamp
        then False

end as is_delivered_on_time,

case when order_status = 'delivered' and order_delivered_customer_date is null then True else False end as dq_delivered_missing_delivered_date

from {{source('raw_data', 'orders')}}

)

select * from order_stg