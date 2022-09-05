Select Distinct(seio) From cap03.TB_DADOS;
Select
	Case 
		When seio = 'left' Then 'E'
        When seio = 'right' Then 'D'
	End as seio
From cap03.TB_DADOS;

Select Count(Distinct(tamanho_tumor)) from cap03.TB_DADOS;
Select Distinct(tamanho_tumor) from cap03.TB_DADOS;
Select 
	Case
		When tamanho_tumor = '0-4' Or tamanho_tumor = '5-9' Then '0-9'
        When tamanho_tumor = '10-14' Or tamanho_tumor = '15-19' Then '10-19'
        When tamanho_tumor = '20-24' Or tamanho_tumor = '25-29' Then '20-29'
        When tamanho_tumor = '30-34' Or tamanho_tumor = '35-39' Then '30-39'
        When tamanho_tumor = '40-44' Or tamanho_tumor = '45-49' Then '40-49'
        When tamanho_tumor = '50-54' Then '50-54'
	End as tamanho_tumor
From cap03.TB_DADOS;

Select Distinct(quadrante) from cap03.TB_DADOS;
Select 
	Case 
		When quadrante = 'left_low' Then 1
        When quadrante = 'right_low' Then 2
        When quadrante = 'left_up' Then 3
        When quadrante = 'right_up' Then 4
        When quadrante = 'central' Then 5
		Else 0
	End as quadrante
From cap03.TB_DADOS;