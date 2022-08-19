Select
	P.id_pedido
    ,C.nome_cliente
    ,V.nome_vendedor
From cap04.TB_PEDIDOS as P, cap04.TB_CLIENTES as C, cap04.TB_VENDEDOR as V
Where P.id_cliente = C.id_cliente And P.id_vendedor = V.id_vendedor;

-- Or

Select
	P.id_pedido
    ,C.nome_cliente
    ,V.nome_vendedor
From cap04.TB_PEDIDOS as P
Join cap04.TB_CLIENTES as C On P.id_cliente = C.id_cliente
Join cap04.TB_VENDEDOR as V On P.id_vendedor = V.id_vendedor;

-- Or

Select
	P.id_pedido
    ,C.nome_cliente
    ,V.nome_vendedor
From cap04.TB_PEDIDOS as P
Join cap04.TB_CLIENTES as C 
Using (id_cliente)
Join cap04.TB_VENDEDOR as V 
Using (id_vendedor); -- Using, because the ID COLUMN has the same name on both tables