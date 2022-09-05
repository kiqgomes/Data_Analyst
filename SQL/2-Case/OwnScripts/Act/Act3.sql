#3 - [Desafio] Aplique One - Hot - Encoding à coluna deg_malig

Select Distinct(deg_malig) from cap03.TB_DADOS2;

Select
	seio
	,count(Case When deg_malig = '1' Then 1 End) as 'one'
	,count(Case When deg_malig = '2' Then 3 End) as 'two'
	,count(Case When deg_malig = '3' Then 3 End) as 'three'
From cap03.TB_DADOS2
Group By 1; 
