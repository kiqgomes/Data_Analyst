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

-- 9 - Qual o valor total de pedido (order_amount) no channel 'FOOD PLACE'?

Select Round(Sum(O.order_amount),2) as `Total Venda`, C.channel_name
From act2.orders O
Join act2.channels C
Using(channel_id)
Where C.channel_name = "FOOD PLACE"
Group By 2;

-- 10 - Quantos pagamentos foram cancelados (chargeback)?

Select Count(payment_id) total_cancelamentos,payment_status
From act2.payments
Where payment_status = "chargeback";

-- 11 - Qual foi o valor médio dos pagamentos cancelados (chargeback)?

Select Round(Avg(payment_amount),3) as valor_medio_cancelamento,payment_status
From act2.payments
Where payment_status = "chargeback";

-- 12 - Qual a média do valor de pagamento por método de pagamento (payment_method) em ordem decrescente?

Select Round(Avg(payment_amount),3) as valor_medio
	,payment_status
From act2.payments
Group By 2
Order By 1 Desc;

-- 13 - Quais métodos de pagamento tiveram valor médio superior a 100?

Select Round(Avg(payment_amount),3) as valor_medio
	,payment_status
From act2.payments
Group By 2
Having valor_medio > 100
Order By 1 Desc;

-- 14 - Qual a média de valor de pedido (order_amount) por estado do hub (hub_state),segmento da loja (store_segment) e tipo de canal (channel_type)?

Select Avg(O.order_amount)
	,If(Grouping(H.hub_state), 'Média de Vendas por Estado do Hub',H.hub_state) as Hub_State
    ,If(Grouping(S.store_segment),"Média de Vendas por Segmento de Loja", S.store_segment) as Loja_Segmento
    ,If(Grouping(C.channel_type),"Média de Vendas por Tipo de Channel", C.channel_type) as Channel_Type
From act2.orders O
Join act2.stores S Using(store_id)
Join act2.hubs H On S.hub_id = H.hub_id
Join act2.channels C Using(channel_id)
Group By H.hub_state
	,S.store_segment
    ,C.channel_type with rollup ;
    
-- 15 - Qual estado do hub (hub_state), segmento da loja (store_segment) e tipo de canal (channel_type) teve média de valor de pedido (order_amount) maior que 450?

Select Avg(O.order_amount) as avg_order
	,H.hub_state
    ,S.store_segment
    ,C.channel_type
From act2.orders O
Join act2.stores S Using(store_id)
Join act2.hubs H On S.hub_id = H.hub_id
Join act2.channels C Using(channel_id)
Group By 2,3,4
Having avg_order > 450;

/*
16 - Qual  o  valor  total  de  pedido  (order_amount)  por  estado  do  hub  (hub_state),segmento  da  loja  (store_segment)  e  tipo  de  canal  (channel_type)?
Demonstre  os  totais intermediários e formate o resultado.
*/
Select Round(Sum(O.order_amount),2) Valor_total
	,If(Grouping(H.hub_state), 'Total de Vendas por Estado do Hub',H.hub_state) as Hub_State
    ,If(Grouping(S.store_segment),"Total de Vendas por Segmento de Loja", S.store_segment) as Loja_Segmento
    ,If(Grouping(C.channel_type),"Total de Vendas por Tipo de Channel", C.channel_type) as Channel_Type
From act2.orders O
Join act2.stores S Using(store_id)
Join act2.hubs H On S.hub_id = H.hub_id
Join act2.channels C Using(channel_id)
Group By H.hub_state
	,S.store_segment
    ,C.channel_type with rollup ;

/*
17 - Quando  o  pedido  era  do  Hub  do  Rio  de  Janeiro  (hub_state),  segmento  de  loja 
'FOOD',  tipo  de  canal  Marketplace  e  foi  cancelado,  qual  foi  a  média  de  valor  do  pedido (order_amount)?
*/

Select Round(Avg(O.order_amount),3) as avg_order
	,H.hub_state as hub_state
    ,S.store_segment as store_segment
    ,C.channel_type as channel_type
From act2.orders O
Join act2.stores S Using(store_id)
Join act2.hubs H On S.hub_id = H.hub_id
Join act2.channels C Using(channel_id)
Where hub_state = "RJ"
And store_segment = "FOOD"
And channel_type = "Marketplace"
And O.order_status = "canceled"
Group By 2,3,4;

/*
18 - Quando o pedido era do segmento de loja 'GOOD', tipo de canal Marketplace e foi 
cancelado, algum hub_state teve total de valor do pedido superior a 100.000?
*/

Select Round(Sum(O.order_amount),2) as sum_order
	,H.hub_state as hub_state
    ,S.store_segment as store_segment
    ,C.channel_type as channel_type
From act2.orders O
Join act2.stores S Using(store_id)
Join act2.hubs H On S.hub_id = H.hub_id
Join act2.channels C Using(channel_id)
Where store_segment = "GOOD"
And channel_type = "Marketplace"
And O.order_status = "canceled"
Group By 2,3,4
Having sum_order > 100000;

/*
19 - Em  que  data  houve  a  maior  média  de  valor  do  pedido  (order_amount)?
Dica: Pesquise e use a função SUBSTRING().
*/

Select Round(Avg(order_amount),3) as avg_order
	,Substring(order_moment_created,1,9) as Date_ex
From act2.orders
Group By Date_ex
Order By avg_order Desc
Limit 1;

/*
20 - Em quais datas o valor do pedido foi igual a zero (ou seja, não houve venda)?
Dica: Use a função SUBSTRING().
*/

Select Sum(order_amount) as sum_day
	,Substring(order_moment_created,1,9) as Date_ex
From act2.orders
Group by 2
Having sum_day = 0;
