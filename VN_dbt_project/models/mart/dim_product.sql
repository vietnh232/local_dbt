
with 

product as (

select * from {{ref('product_stg')}}

)

select * from product