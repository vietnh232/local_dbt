with 

order_review as (

select * from {{ ref('order_review_stg') }}

)

select * from order_review