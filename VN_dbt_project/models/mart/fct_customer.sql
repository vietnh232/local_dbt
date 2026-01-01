with
order_total_spent_temp as
(
    select 
    oi.order_id,
    sum(oi.payment_value) as total_spent_each_order
    from {{ ref('order_payment_stg') }} oi
    group by oi.order_id
),
order_with_unique_customer_id as
(
    select 
    o.order_id,
    o.customer_id,
    o.order_purchase_timestamp,
    c.customer_unique_id
    from {{ ref('order_stg') }} o
    left join {{ ref('customer_stg') }} c
    on o.customer_id = c.customer_id 
),
order_customer as
(
    select 
    o.customer_unique_id,
    count(distinct o.order_id) as number_of_orders,
    max(o.order_purchase_timestamp) as last_order_date,
    min(o.order_purchase_timestamp) as first_order_date,
    count(distinct o.order_id) > 1 as is_returning_buyer,
    count(distinct o.order_id) / greatest(1, (max(o.order_purchase_timestamp) - min(o.order_purchase_timestamp)) / 30.0) as average_order_per_month,
    sum(ots.total_spent_each_order) as total_spent_each_customer   
    from order_with_unique_customer_id o left join order_total_spent_temp ots on o.order_id = ots.order_id
    group by o.customer_unique_id
)
select * from order_customer
