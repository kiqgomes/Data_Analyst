Select
	V.nome_vendedor
	,Case 
		When data_pedido Is Null Then 'No-info'
		Else P.data_pedido
	End as data_pedido
    ,Case
		When nome_cliente Is Null Then 'No-info'
        Else C.nome_cliente
	End as nome_cliente
From cap04.TB_PEDIDOS as P
Join cap04.TB_CLIENTES as C 
	Using (id_cliente)
Right Join cap04.TB_VENDEDOR as V
	Using (id_vendedor)
Order By 2;