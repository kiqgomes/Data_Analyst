# 4 - Quais embarcações têm classificação de risco A ou pontuação de risco igual a 0?

Select nome_navio,classificacao_risco,pontuacao_risco From cap02.TB_NAVIOS
Where classificacao_risco = 'A' 
	Or pontuacao_risco = 0;