with 

product_stg as 
(
select  

p.product_id,

pcnt.product_category_name_english,

p.product_weight_g,
p.product_length_cm,
p.product_height_cm,
p.product_width_cm

from {{source('raw_data', 'products')}} p 

left join 

{{source('raw_data', 'product_category_name_translation')}} pcnt 

on p.product_category_name = pcnt.product_category_name 

)

select * from product_stg