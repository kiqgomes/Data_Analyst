# 3 - Quais embarcações têm classificação de risco C ou D e índice de conformidade menor ou igual a 95%?

Select nome_navio, classificacao_risco From cap02.TB_NAVIOS 
Where classificacao_risco IN ('C','D')
	And indice_conformidade <= 95; 