Select
	P.valor_pedido
	,V.nome_vendedor
From cap05.TB_PEDIDOS P
Join cap05.TB_CLIENTES C On P.id_cliente = C.id_cliente
Join cap05.TB_VENDEDOR V On P.id_vendedor = V.id_vendedor
Where P.valor_pedido > 600 And C.estado_cliente = 'SP';

Select
	P.valor_pedido
	,V.nome_vendedor
From cap05.TB_PEDIDOS P Inner Join cap05.TB_CLIENTES C Inner Join cap05.TB_VENDEDOR V
On P.id_cliente = C.id_cliente
And P.id_vendedor = V.id_Vendedor
And estado_cliente = 'SP'
And valor_pedido > 600;
