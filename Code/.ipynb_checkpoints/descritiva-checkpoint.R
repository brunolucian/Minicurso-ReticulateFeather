source("Code/importa_dados.R", echo = T)

# Análise descritiva 
require(dplyr)

#### Clientes ####
glimpse(customers)
customers %>% 
  count(customer_id, sort = T)
customers %>% 
  count(customer_unique_id, sort = T) %>% 
  filter(n > 1)

customers %>% 
  count(customer_state, sort = T)

#### Produtos ####
glimpse(products)

#### Pedidos ####
glimpse(orders)
orders %>% 
  count(order_status, sort = T)

orders %>% 
  mutate_at(vars(4:8), lubridate::as_datetime) %>% 
  mutate(tempo_aprovacao_entrega = difftime(order_delivered_customer_date, order_approved_at, units = "days") %>% 
           as.numeric() %>% 
           floor(),
         tempo_estimado_realizado = difftime(order_estimated_delivery_date, order_delivered_customer_date, units = "days") %>% 
           as.numeric() %>% 
           floor()) %>% 
  as_tibble() %>% 
  summarise(Tempo_medio_aprovacao_entrega = mean(tempo_aprovacao_entrega, na.rm = T),
            Tempo_medio_estimado_realizado = mean(tempo_estimado_realizado, na.rm = T))

#### Pagamento ####
glimpse(payments)
summary(payments$payment_value)

payments %>% 
  count(payment_type, sort = T)

#### Reviews ####
glimpse(reviews)  
summary(reviews$review_score)
reviews %>% 
  count(review_score, sort = T)

#### Vendedores ####
glimpse(sellers)
sellers %>% 
  count(seller_state, sort = T)

# basket
dados_basket <- orders %>% 
  left_join(items, by = "order_id") %>% 
  left_join(products, by = "product_id") %>% 
  as_tibble() %>% 
  distinct(order_id, product_category_name) %>% 
  filter(product_category_name != "") %>% 
  group_by(order_id) %>% 
  filter(n() > 1) %>% 
  ungroup() %>% 
  data.table::as.data.table()

teste <- split(dados_basket[["product_category_name"]], dados_basket[["order_id"]])

require(arules)

teste <- teste %>% as("transactions")

basket <- apriori(teste, parameter = list(support = 0.01, confidence = 0.05,
                                          minlen = 2, maxlen = 2))

basket <- basket %>% 
  as("data.frame") %>% 
  as("data.table")

basket <- basket %>% 
  tidyr::separate(rules, into = c("Antecedente", "Consequente"), sep = "=>") %>% 
  mutate_at(vars(1:2), function(x){stringr::str_remove_all(x, "\\{") %>% 
      stringr::str_remove_all("\\}")}) %>% 
  arrange(-lift, -support, -confidence)

basket

# https://pbpython.com/market-basket-analysis.html
# https://www.brodrigues.co/blog/2018-12-30-reticulate/