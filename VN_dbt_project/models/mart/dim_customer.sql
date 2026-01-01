with 
customer_info as (

select * from {{ ref('customer_stg') }}

)

select * from customer_info