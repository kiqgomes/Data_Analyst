Select 
	Case 
		When ano Is Null Then 'Total'
        Else ano
	End as ano
    ,Sum(faturamento) as faturamento
From cap05.TB_VENDAS
Group By ano With RollUp;

Select 
	Case 
		When ano Is Null Then 'Total por ano'
        Else ano
	End as Ano
    ,Case 
		When pais Is Null Then 'Total por pais'
        Else pais
	End as Pais
    ,Sum(faturamento) as faturamento
From cap05.TB_VENDAS
Group By ano,pais With RollUp;

Select 
	ano
    ,pais
    ,Sum(faturamento) as faturamento
From cap05.TB_VENDAS
Group By ano, pais With RollUp;

Select
	If(Grouping(ano), 'Total de Vendas por Ano',ano) as Ano
    ,If(Grouping(pais), 'Total de Vendas por Pais',pais) as Pais
    ,Sum(faturamento) as Faturamento
From cap05.TB_VENDAS
Group By ano,pais With RollUp;
