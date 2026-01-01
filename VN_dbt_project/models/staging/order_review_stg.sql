with 

order_review_stg as 
(

select  

review_id,
order_id,
review_score,
review_comment_title,
review_comment_message,
review_creation_date,
review_answer_timestamp

from {{source('raw_data', 'order_reviews')}}

)

select * from order_review_stg