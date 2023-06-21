SELECT
	o.codigo 					AS '�rg�o',
	u.uasg						AS 'Unidade Respons�vel (UASG)',
	pa.ano						AS 'Ano do Plano',
	i.numeroitem				AS 'N� Item',
	i.tipo_item					AS 'Tipo do item',
	sub.nome					AS 'Subitem',
	i.codigo_item				AS 'C�digo do item (C�digo relacionado ao CATMAT/CATSER)',
	i.descricao					AS 'Descri��o do item',
	i.unidade_fornecimento		AS 'Unidade de fornecimento',
	i.tem_vinculacao_item		AS 'Despesa informada � somente para vincular aos aspectos/necessidades or�ament�rias',
	i.quantidade_total			AS 'Quantidade estimada',
	i.valor_unitario			AS 'Valor unit�rio estimado (R$)',
	i.valor_total				AS 'Valor total estimado (R$)',
	i.valor_orcamentario		AS 'Valor or�ament�rio estimado para o exerc�cio (R$)',
	i.participacao_recurso		AS 'Participa��o de recursos externos',
	i.acao_orcamentaria			AS 'A��o or�ament�ria',
	g.nome						AS 'Natureza de Despesa',
	i.renovacao_contrato		AS 'Renova��o de contrato',
	i.id_item_vinculado			AS 'Depend�ncia de outro item',
	i.vinculo_orcamentario		AS 'Item Vinculado',
	i.grau_prioridade			AS 'Grau de prioridade',
	i.periodo_estimado			AS 'Data desejada',
	i.id_grupo					AS 'Identificador do grupo',
	g.nome						AS 'Nome do grupo',
	h.situacao					AS 'Situa��o do Item',
	i.justificativa_contratacao	AS 'Justificativa para aquisi��o ou contrata��o',
	i.unidade_responsavel 		AS 'Unidade Requisitante',
	i.email_responsavel			AS 'E-mail',
	i.telefone_responsavel		AS 'Telefone',
	i.cpf_cadastrou
FROM pgc.itens i
	LEFT JOIN pgc.uasgs  u ON i.id_uasg = u.id
	LEFT JOIN pgc.orgaos o ON o.id = u.orgao_id
	LEFT JOIN pgc.grupos g ON g.id = i.id_grupo
	LEFT JOIN pgc.users usr ON usr.cpf = i.cpf_cadastrou
	LEFT JOIN pgc.sub_itens sub ON sub.id = i.id_sub_item
	LEFT JOIN pgc.planos_anuais pa ON pa.id = i.id_plano_anual
	LEFT JOIN pgc.historico_tramitacoes h ON h.id_item = i.id
WHERE
	h.situacao IN ('EN', 'EL')
	AND i.id_uasg IN ('837', '13975')
	AND i.id_plano_anual = 6
;

SELECT *
FROM pgc.itens i LEFT JOIN pgc.uasgs u ON i.id_uasg = u.id
WHERE i.id_uasg IN ('837') -- '13975