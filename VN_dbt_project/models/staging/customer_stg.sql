with 

customer_stg as 

(
select 
customer_unique_id,
customer_id, 
customer_zip_code_prefix as customer_zip_code,
customer_city,
customer_state,
CASE
        WHEN customer_state IN ('AM', 'RR', 'AP', 'PA', 'TO', 'AC', 'RO') THEN 'North'
        WHEN customer_state IN ('MA', 'PI', 'CE', 'RN', 'PB', 'PE', 'AL', 'SE', 'BA') THEN 'Northeast'
        WHEN customer_state IN ('MT', 'MS', 'GO', 'DF') THEN 'Central-West'
        WHEN customer_state IN ('SP', 'RJ', 'MG', 'ES') THEN 'Southeast'
        WHEN customer_state IN ('PR', 'SC', 'RS') THEN 'South'
        ELSE 'Unknown'
    END AS customer_region

from {{source('raw_data', 'customers')}} 

 )
 
 select * from customer_stg
