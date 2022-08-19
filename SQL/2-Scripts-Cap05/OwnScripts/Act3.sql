Select 
	C.estado_cliente
    ,Count(P.id_pedido) as total_pedidos
From cap05.TB_PEDIDOS P
Join cap05.TB_CLIENTES C 
On P.id_cliente = C.id_cliente
Group by 1
Having total_pedidos > 5 