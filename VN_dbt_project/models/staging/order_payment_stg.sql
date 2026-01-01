with 

order_payment_stg as (

select  

order_id,
payment_sequential,
payment_type, 
payment_installments,
cast(payment_value as numeric) as payment_value

from {{source('raw_data', 'order_payments')}} 

)

select * from order_payment_stg