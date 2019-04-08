# Script para leitura de dados

customers <- read.csv("Dados/olist_customers_dataset.csv", encoding = "UTF-8", stringsAsFactors = F)
geolocation <- read.csv("Dados/olist_geolocation_dataset.csv", encoding = "UTF-8", stringsAsFactors = F)
items <- read.csv("Dados/olist_order_items_dataset.csv", encoding = "UTF-8", stringsAsFactors = F)
payments <- read.csv("Dados/olist_order_payments_dataset.csv", encoding = "UTF-8", stringsAsFactors = F)
reviews <- read.csv("Dados/olist_order_reviews_dataset.csv", encoding = "UTF-8", stringsAsFactors = F)
orders <- read.csv("Dados/olist_orders_dataset.csv", encoding = "UTF-8", stringsAsFactors = F)
products <- read.csv("Dados/olist_products_dataset.csv", encoding = "UTF-8", stringsAsFactors = F)
sellers <- read.csv("Dados/olist_sellers_dataset.csv", encoding = "UTF-8", stringsAsFactors = F)
product_category <- read.csv("Dados/product_category_name_translation.csv", encoding = "UTF-8", stringsAsFactors = F)