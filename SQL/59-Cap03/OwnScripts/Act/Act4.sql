#4 - Crie um novo dataset com todas as variáveis após as transformações anteriores

Create Table cap03.TB_DADOSACT
As
Select
	idade
	,Case 
		When menopausa = 'premeno' Then 1
        When menopausa = 'ge40' Then 2
        When menopausa = 'lt40' Then 3
	End as menopausa
    ,inv_nodes
    ,Case When deg_malig = '1' Then 1 Else 0 End as 'deg_malig-1'
	,Case When deg_malig = '2' Then 1 Else 0 End as 'deg_malig-2'
	,Case When deg_malig = '3' Then 1 Else 0 End as 'deg_malig-3'
    ,seio
    ,tamanho_tumor
    ,quadrante
    ,irradiando
    ,classe
    ,posicao_tumor
From cap03.TB_DADOS2;