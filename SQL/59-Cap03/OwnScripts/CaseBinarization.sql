Select Distinct(classe) from cap03.TB_DADOS;
Select
	Case
		When irradiando = 'yes' Then 1
		When irradiando = 'no' Then 0
	End as irradiando
From cap03.TB_DADOS;

Select Distinct(irradiando) from cap03.TB_DADOS;
Select
	Case
		When classe = 'no-recurrence-events' Then 0
		When classe = 'recurrence-events' Then 1
	End as classe
From cap03.TB_DADOS;

Select Distinct(node_caps) from cap03.TB_DADOS;
Select
	Case 
		When node_caps = 'yes' Then 1
        When node_caps = 'no' Then 0
        Else 'no-info'
	End as node_caps
From cap03.TB_DADOS;