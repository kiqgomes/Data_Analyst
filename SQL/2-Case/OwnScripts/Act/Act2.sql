# 2 - [Desafio] Crie uma nova coluna chamada posicao_tumor concatenando as colunas inv_nodes e quadrante.

Select Distinct(inv_nodes) From cap03.TB_DADOS2;
Select Distinct(quadrante) From cap03.TB_DADOS2;

Select Concat(inv_nodes,'/',quadrante) As posicao_tumor From cap03.TB_DADOS2;

Alter Table cap03.TB_DADOS2 Add posicao_tumor Varchar(50) As (Concat(inv_nodes,'/',quadrante));

Alter Table cap03.TB_DADOS2 Drop posicao_tumor;

Select posicao_tumor From cap03.TB_DADOS2;