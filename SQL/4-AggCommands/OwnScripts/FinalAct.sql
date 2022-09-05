-- 1-Qual o número de hubs por cidade?
Select Count(hub_id),hub_city 
From act2.hubs
Group By 2;

-- 2 - Qual o número de pedidos (orders) por status?

Select Count(order_id),order_status
From act2.orders
Group By 2;

-- 3-Qual o número de lojas (stores) por cidade dos hubs?

Select Count(S.store_id) as lojas,H.hub_city
From act2.stores S
Inner Join act2.hubs H
Using(hub_id)
Group By 2;

-- 4 - Qual o maior e o menor valor de pagamento (payment_amount) registrado?

Select Max(payment_amount) as Max, Min(payment_amount) as Min
From act2.payments;

-- 5 - Qual tipo de driver (driver_type) fez o maior número de entregas?

Select Dr.driver_type,Max(De.delivery_id) as Max
From act2.drivers Dr
Join act2.deliveries De
Using(driver_id)
Group By 1;

-- 6 - Qual a distância média das entregas por tipo de driver (driver_modal)?

Select Avg(De.delivery_distance_meters),Dr.driver_type
From act2.deliveries De
Join act2.drivers Dr
Using(driver_id)
Group By 2;

-- 7 - Qual a média de valor de pedido (order_amount) por loja, em ordem decrescente?

Select Avg(O.order_amount) `Media Venda`,S.store_name
From act2.orders O
Join act2.stores S
Using(store_id)
Group By 2
Order By `Media Venda` Desc;

-- 8 - Existem pedidos que não estão associados a lojas? Se caso positivo, quantos?

Select order_id, store_id 
From act2.orders
Where store_id is Null;