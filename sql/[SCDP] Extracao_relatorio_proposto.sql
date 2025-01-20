SELECT 
pcdp.ano ano_pcdp,
o.nome orgao,
ho.nome unidade,
CASE pcdp.situacao_pcdp_vl 
	WHEN 1 THEN 'Em Planejamento'
	WHEN 2 THEN 'Em Prestação de Contas'
	WHEN 3 THEN 'Cancelada'
	WHEN 4 THEN 'Concluída'
END situacao_pcdp,
pl.numero_pcdp,
pp.nome nome_proposto,
--pp.email email_proposto,
pcdp.data_solicitacao dt_solicitacao,
pl.data_inicio_viagem dt_inicio_viagem,
pl.data_fim_viagem dt_fim_viagem,
mv.descricao motivo_viagem,
pl.descricao_motivo_viagem,
COALESCE(
(
	SELECT 
		SUM(CASE WHEN pg.cotacao IS NULL THEN pg.valor_real else pg.cotacao * pg.valor_moeda END)
	FROM
		STG_SCDP.dbo.pagamento pg
	WHERE
		pg.id_pcdp = pcdp.id
		AND pg.tipo_pagamento_vl IN (1,2)
), 0.00) vl_diarias,
COALESCE(
(
	SELECT 
		SUM(COALESCE(d.valor_divida_diaria_nacional,0.00) + COALESCE( d.valor_divida_restituicao,0.00) 
			+ ROUND( COALESCE(d.valor_divida_diaria_internacional,0.00) * ROUND( COALESCE(d.cotacao, 0.0000),4),2)) 
	FROM
		STG_SCDP.dbo.devolucao d
	WHERE
		d.id_pcdp = pcdp.id
),0.00) vl_devolucoes_diarias
FROM STG_SCDP.dbo.pcdp pcdp
LEFT JOIN STG_SCDP.dbo.planejamento pl ON pcdp.id_planejamento = pl.id
LEFT JOIN STG_SCDP.dbo.motivo_viagem mv ON pl.id_motivo_viagem = mv.id 
LEFT JOIN STG_SCDP.dbo.proposto_pcdp pp ON pcdp.id = pp.id_pcdp 
JOIN STG_SCDP.dbo.hierarquia_orgao ho ON ho.id = pcdp.id_orgao_solicitante
JOIN STG_SCDP.dbo.orgao o ON o.id = ho.id_orgao_hierarquia 
	AND o.raiz = 1
WHERE pcdp.ano BETWEEN 2013 AND 2016
AND o.id =  -- sirog/id orgao
AND pp.cpf =  --cpf proposto
ORDER BY 
pcdp.ano,
pl.numero_pcdp 

