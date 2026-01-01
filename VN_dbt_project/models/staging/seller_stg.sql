with 

seller_stg as (

select  

seller_id,
seller_zip_code_prefix,
seller_city,
seller_state,

CASE
        WHEN seller_state IN ('AM', 'RR', 'AP', 'PA', 'TO', 'AC', 'RO') THEN 'North'
        WHEN seller_state IN ('MA', 'PI', 'CE', 'RN', 'PB', 'PE', 'AL', 'SE', 'BA') THEN 'Northeast'
        WHEN seller_state IN ('MT', 'MS', 'GO', 'DF') THEN 'Central-West'
        WHEN seller_state IN ('SP', 'RJ', 'MG', 'ES') THEN 'Southeast'
        WHEN seller_state IN ('PR', 'SC', 'RS') THEN 'South'
        ELSE 'Unknown'
    END AS seller_region

from {{source('raw_data', 'sellers')}}

)

select * from seller_stg