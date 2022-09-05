Select 
	Round(SUM(P.valor_pedido * 0.1),2) as comissao
    ,V.nome_vendedor
    ,C.estado_cliente
From cap05.TB_PEDIDOS P
Inner Join cap05.TB_CLIENTES C On P.id_cliente = C.id_cliente
Right Join cap05.TB_VENDEDOR V On P.id_vendedor = V.id_vendedor
Where C.estado_cliente = "CE"
Group By 2,3
Order By 3;

Select 
	Case 
		When SUM(P.valor_pedido * 0.1) Is Null Then 0
        Else Round(SUM(P.valor_pedido * 0.1),2)
	End as comissao
    ,V.nome_vendedor
    ,
    Case
		When C.estado_cliente Is Null Then 'No CE'
        Else C.estado_cliente
        End as estado_cliente
From cap05.TB_PEDIDOS P
Inner Join cap05.TB_CLIENTES C Right Join cap05.TB_VENDEDOR V
On P.id_cliente = C.id_cliente
And P.id_vendedor = V.id_vendedor
And C.estado_cliente = "CE"
Group By 2,3
Order By 3;
