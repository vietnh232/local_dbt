with 

seller as (

select * from {{ref('seller_stg')}}

)

select * from seller