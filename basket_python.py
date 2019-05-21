import pandas as pd

#customers = pd.read_csv("../Dados/olist_customers_dataset.csv", encoding = "UTF-8")
#geolocation = pd.read_csv("../Dados/olist_geolocation_dataset.csv", encoding = "UTF-8")
#items = pd.read_csv("../Dados/olist_order_items_dataset.csv", encoding = "UTF-8")
#payments = pd.read_csv("../Dados/olist_order_payments_dataset.csv", encoding = "UTF-8")
#reviews = pd.read_csv("../Dados/olist_order_reviews_dataset.csv", encoding = "UTF-8")
#orders = pd.read_csv("../Dados/olist_orders_dataset.csv", encoding = "UTF-8")
#products = pd.read_csv("../Dados/olist_products_dataset.csv", encoding = "UTF-8")
#sellers = pd.read_csv("../Dados/olist_sellers_dataset.csv", encoding = "UTF-8")
#product_category = pd.read_csv("../Dados/product_category_name_translation.csv", encoding = "UTF-8")

orders = pd.merge(orders, items, left_on = "order_id", right_on = "order_id", how = "left")
orders = pd.merge(orders, products, left_on = "product_id", right_on = "product_id", how = "left")

orders = orders[['order_id', 'product_category_name']].drop_duplicates()

orders = orders.groupby('order_id').filter(lambda x: len(x) >= 2)

orders_dummy = pd.get_dummies(orders["product_category_name"])

