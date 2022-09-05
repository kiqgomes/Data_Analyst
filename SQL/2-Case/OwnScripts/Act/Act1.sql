# 1-Aplique label encoding à variável menopausa.
Select Distinct(menopausa) From cap03.TB_DADOS2;
Select
	Case 
		When menopausa = 'premeno' Then 1
        When menopausa = 'ge40' Then 2
        When menopausa = 'lt40' Then 3
	End as menopausa
From cap03.TB_DADOS2;
