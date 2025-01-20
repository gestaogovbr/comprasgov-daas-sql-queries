SELECT 
o.nome orgao,
ho.nome unidade,
pl.numero_pcdp,
pp.nome nome_proposto,
pcdp.data_solicitacao dt_solicitacao,
pl.data_inicio_viagem dt_inicio_viagem,
pl.data_fim_viagem dt_fim_viagem,
pgt.data_geracao_ob dt_ordem_bancaria, 
pgt.numero_ob numero_ordem_bancaria,
--ep.natureza_despesa_vl natureza_despesa,
CASE ep.natureza_despesa_vl
	WHEN 339014 THEN 'Custeio - Diárias de Servidor'
	WHEN 449014 THEN 'Investimento - Diárias de Servidor'
	WHEN 339015 THEN 'Custeio - Diárias de Militar'
	WHEN 449015 THEN 'Investimento - Diárias de Militar'
	WHEN 339036 THEN 'Custeio - Diárias de Não-Servidor'
	WHEN 449036 THEN 'Investimento - Diárias de Não-Servidor'
	WHEN 339033 THEN 'Custeio - Passagens'
	WHEN 449033 THEN 'Investimento - Passagens'
	WHEN 339093 THEN 'Custeio - Restituições'
	WHEN 449093 THEN 'Investimento - Restituições'
	WHEN 339092 THEN 'Custeio - Despesas de Exercícios Anteriores'
	WHEN 449092 THEN 'Investimento - Despesas de Exercícios Anteriores'
	WHEN 339039 THEN 'Custeio - Outros Serviços de Terceiros'
	WHEN 449039 THEN 'Investimento - Outros Serviços de Terceiros'
END natureza_despesa,
pgt.numero_processo_protocolo numero_pcdp_pagamento,
COALESCE(
(SELECT 
	COALESCE(pg.valor_real,0)+COALESCE(pg.valor_moeda*pg.cotacao,0)
	FROM
	DM_SCDP.dbo.pagamento pg
	WHERE
	pg.numero_ob = pgt.numero_ob
), 0.00) vl_deposito
FROM DM_SCDP.dbo.pcdp pcdp
LEFT JOIN DM_SCDP.dbo.planejamento pl ON pcdp.id_planejamento = pl.id
LEFT JOIN DM_SCDP.dbo.pagamento pgt ON pcdp.id = pgt.id_pcdp 
LEFT JOIN DM_SCDP.dbo.empenho ep ON pgt.id_empenho = ep.id 
LEFT JOIN DM_SCDP.dbo.proposto_pcdp pp ON pcdp.id = pp.id_pcdp 
LEFT JOIN DM_SCDP.dbo.hierarquia_orgao ho ON ho.id = pcdp.id_orgao_solicitante
LEFT JOIN DM_SCDP.dbo.orgao o ON o.id = ho.id_orgao_hierarquia 
	AND o.raiz = 1
WHERE o.id = 86144
AND YEAR(pl.data_inicio_viagem) = 2022
AND MONTH(pl.data_inicio_viagem) = 08
AND pgt.numero_ob IS NOT NULL 
ORDER BY pl.numero_pcdp ASC 
