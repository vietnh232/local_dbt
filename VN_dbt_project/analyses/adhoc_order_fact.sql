select 
o.*,
c.customer_zip_code,
c.customer_city,
c.customer_state,
oi.order_item_id,
oi.product_id,
p.product_category_name_english,
p.product_weight_g,
p.product_length_cm,
p.product_height_cm,
p.product_width_cm,
oi.shipping_limit_date,
oi.price,
oi.freight_value,
oi.total_cost,
oi.seller_id,
s.seller_zip_code_prefix,
s.seller_city,
s.seller_state,
op.payment_sequential,
op.payment_type, 
op.payment_installments,
op.payment_value,
ors.review_score
from {{ref('order_stg')}} o left join {{ref('customer_stg')}} c on o.customer_id = c.customer_id
                            left join {{ref('order_item_stg')}} oi on o.order_id = oi.order_id
                            left join {{ref('product_stg')}} p on oi.product_id = p.product_id
                            left join {{ref('seller_stg')}} s on oi.seller_id = s.seller_id
                            left join {{ref('order_payment_stg')}} op on o.order_id = op.order_id
                            left join {{ref('order_review_stg')}} ors on o.order_id = ors.order_id
