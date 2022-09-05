# 2 - Quais embarcações têm classificação de risco A e índice de conformidade maior ou igual a 95%?

Select nome_navio From cap02.TB_NAVIOS
Where classificacao_risco = 'A' AND indice_conformidade >= 95;