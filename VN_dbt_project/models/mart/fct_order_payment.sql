

with 
order_payment as
(
    select
        op.*, 
        cast(sum(payment_value) over (partition by order_id) as numeric) as total_payment_value_per_order
    from
       {{ ref('order_payment_stg') }} op
)

select * from order_payment

