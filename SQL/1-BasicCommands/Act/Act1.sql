# 1 - Quais embarcações possuem pontuação de risco igual a 310?
SELECT nome_navio,pontuacao_risco FROM cap02.TB_NAVIOS
WHERE pontuacao_risco = 310; 