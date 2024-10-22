---------- Quantidade de fornecedores que enviaram alguma proposta em 2023

SELECT
	COUNT(DISTINCT p.identificacao_participante) AS contagem_fornecedores
FROM ComprasGov_FaseExterna_VBL.compra AS c
	JOIN ComprasGov_FaseExterna_VBL.item AS i 
		ON c.numero_uasg = i.numero_uasg
		AND c.codigo_modalidade = i.codigo_modalidade
		AND c.numero_compra = i.numero_compra
		AND c.ano_compra = i.ano_compra
	JOIN ComprasGov_FaseExterna_VBL.proposta_item AS pi ON i.id = pi.id_item
		AND (pi.data_hora_inclusao > '2023-01-01 00:00:00' OR pi.data_hora_inclusao > '2023-01-01 00:00:00') -- filtra lances dados em 2023
	JOIN ComprasGov_FaseExterna_VBL.participacao AS p
		ON pi.id_participacao = p.id

---------- Quantidade de fornecedores que ganharam alguma compra em 2023

