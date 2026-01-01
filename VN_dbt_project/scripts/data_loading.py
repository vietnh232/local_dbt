import pandas as pd
from sqlalchemy import create_engine

# Read CSV
df_cust_ds = pd.read_csv('data/brazilian-ecommerce/olist_customers_dataset.csv')
df_geo = pd.read_csv('data/brazilian-ecommerce/olist_geolocation_dataset.csv')
df_items = pd.read_csv('data/brazilian-ecommerce/olist_order_items_dataset.csv')
df_payments = pd.read_csv('data/brazilian-ecommerce/olist_order_payments_dataset.csv')
df_reviews = pd.read_csv('data/brazilian-ecommerce/olist_order_reviews_dataset.csv')
df_orders = pd.read_csv('data/brazilian-ecommerce/olist_orders_dataset.csv')
df_products = pd.read_csv('data/brazilian-ecommerce/olist_products_dataset.csv')
df_sellers = pd.read_csv('data/brazilian-ecommerce/olist_sellers_dataset.csv')
df_product_cat_name = pd.read_csv('data/brazilian-ecommerce/product_category_name_translation.csv')

# Connect to PostgreSQL
engine = create_engine('postgresql://dbt_user:happy_testing@localhost:5432/dbt_learning')

# Load to database
df_cust_ds.to_sql('customers', engine, schema='raw_data', if_exists='replace', index=False)
df_geo.to_sql('geolocation', engine, schema='raw_data', if_exists='replace', index=False)
df_items.to_sql('order_items', engine, schema='raw_data', if_exists='replace', index=False)
df_payments.to_sql('order_payments', engine, schema='raw_data', if_exists='replace', index=False)
df_reviews.to_sql('order_reviews', engine, schema='raw_data', if_exists='replace', index=False)
df_orders.to_sql('orders', engine, schema='raw_data', if_exists='replace', index=False)
df_products.to_sql('products', engine, schema='raw_data', if_exists='replace', index=False)
df_sellers.to_sql('sellers', engine, schema='raw_data', if_exists='replace', index=False)
df_product_cat_name.to_sql('product_category_name_translation', engine, schema='raw_data', if_exists='replace', index=False)
print("Data loaded successfully!")