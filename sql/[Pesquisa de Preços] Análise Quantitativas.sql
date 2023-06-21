/*
	Quest�es:
	
	1) Quantidade de Pesquisas realizadas
	2) Quantidade de Pesquisas conclu�das
	3) Principais itens pesquisados (listar os top 5 ou 10, se poss�vel)
	4) Pesquisa com maior quantidade de itens
	5) Tempo m�dio de acesso a pesquisa (esse eu consigo no Google Analitycs)
	6) Quantidade de usu�rios
	7) Perfil de esfera por �rg�o
 */


SELECT DISTINCT
-- 1) Quantidade de Pesquisas realizadas
	(SELECT COUNT(DISTINCT id_cotacao) cotacoesRealizadaNaoExcluidas
		FROM Pesquisa_de_Precos_vbl.cotacao
		WHERE status <> 'E') cotacoesRealizadaNaoExcluidas,
-- 2) Quantidade de Pesquisas conclu�das
	(SELECT COUNT(DISTINCT id_cotacao) cotacoesConcluidas 
		FROM Pesquisa_de_Precos_vbl.cotacao
		WHERE status = 'C') cotacoesConcluidas,
-- 4) Pesquisa com maior quantidade de itens
	(SELECT MAX(quantidade_itens) cotacaoMaisItens
		FROM Pesquisa_de_Precos_vbl.cotacao) cotacaoMaisItens,
-- 6) Quantidade de usu�rios
	(SELECT COUNT(DISTINCT cpf_criador) usuarios
		FROM Pesquisa_de_Precos_vbl.cotacao) usuarios
FROM Pesquisa_de_Precos_vbl.cotacao;


-- 3) Principais itens pesquisados (listar os top 5 ou 10, se poss�vel)
SELECT COUNT(DISTINCT ic.id_item_cotacao) contaItens, ct.codigo_item_catalogo, ct.descricao_item
	FROM Pesquisa_de_Precos_vbl.item_cotacao ic
	JOIN Pesquisa_de_Precos_vbl.item_catalogo ct ON ct.id_item_catalogo = ic.id_item_catalogo
	JOIN Pesquisa_de_Precos_vbl.cotacao c ON c.id_cotacao = ic.id_cotacao
	WHERE c.status = 'C'
	GROUP BY ct.codigo_item_catalogo, ct.descricao_item
	ORDER BY contaItens DESC;

	-- 3.1) C�digo para PDI
	SELECT ct.codigo_item_catalogo, ic.id_item_cotacao
	FROM Pesquisa_de_Precos_vbl.item_cotacao ic
	JOIN Pesquisa_de_Precos_vbl.item_catalogo ct ON ct.id_item_catalogo = ic.id_item_catalogo
	JOIN Pesquisa_de_Precos_vbl.cotacao c ON c.id_cotacao = ic.id_cotacao
	WHERE c.status = 'C'
	ORDER BY ct.codigo_item_catalogo;


-- 7) Perfil de esfera por �rg�o (EM DESENVOLVIMENTO)
SELECT esfera, COUNT(DISTINCT id_cotacao) cotacoesConcluidas
FROM Pesquisa_de_Precos_vbl.cotacao c
JOIN Pesquisa_de_Precos_vbl.uasg_compra u ON u.codigo_uasg = c.uasg
WHERE c.status = 'C'
GROUP BY u.esfera
ORDER BY cotacoesConcluidas DESC;
