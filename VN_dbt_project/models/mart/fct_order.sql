with 

order_fct as 

(
    select *
    from {{ ref('order_stg') }}

)

select * from order_fct

