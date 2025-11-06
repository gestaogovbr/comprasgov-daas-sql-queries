SELECT 
ano_pcdp,
orgao_superior,
orgao_solicitante,
--sigilosa,
tipo_viagem,
numero_pcdp,
proposto,
tipo_proposto,
data_inicio_viagem,
data_fim_viagem,
origem,
destino,
motivo_viagem,
descricao_motivo_viagem,
qtd_total_diarias,
vl_total_diarias,
qtd_total_passagens,
vl_total_passagens,
vl_agenciamento,
vl_servico_correlato,
vl_restituicoes,
vl_devolucoes,
((vl_total_diarias+vl_total_passagens+vl_agenciamento+vl_servico_correlato+vl_restituicoes)-vl_devolucoes) vl_total_viagem,
dt_extracao
FROM(
SELECT DISTINCT 
pcdp.ano ano_pcdp,
o.nome orgao_superior,
ho.nome orgao_solicitante,
--pcdp.sigilosa,
CASE pl.tipo_viagem_vl 
	WHEN 'I' THEN 'Internacional'
	WHEN 'N' THEN 'Nacional'
END as tipo_viagem,
pl.numero_pcdp,
pp.nome proposto,
CASE pp.tipo_proposto_vl
	WHEN 1	THEN 'Servidor - Servidor'
	WHEN 2	THEN 'Servidor - Convidado'
	WHEN 4	THEN 'Servidor - Assessor Especial'
	WHEN 6	THEN 'Servidor - Participante Comitiva'
	WHEN 7	THEN 'Servidor - Equipe de Apoio'
	WHEN 3	THEN 'Não Servidor - Colaborador Eventual'
	WHEN 5	THEN 'Não Servidor - Outros'
	WHEN 8	THEN 'Não Servidor - Participante Comitiva'
	WHEN 9	THEN 'Não Servidor - Equipe de Apoio'
	WHEN 10	THEN 'Não Servidor - Dependente'
	WHEN 13	THEN 'Militar - Militar das Forças Armadas'
	WHEN 14	THEN 'Militar - Policial Militar'
	WHEN 15	THEN 'Militar - Bombeiro Militar'
	WHEN 16	THEN 'Militar - Equipe de Apoio'
	WHEN 17	THEN 'Militar - Participante de Comitiva'
	WHEN 28	THEN 'Militar - Assessor Especial das Forças Armadas'
	WHEN 18	THEN 'Sepe - Empregado Público'
	WHEN 19	THEN 'Sepe - Servidor Judiciário'
	WHEN 20	THEN 'Sepe - Servidor Legislativo'
	WHEN 21	THEN 'Sepe - Servidor Estadual'
	WHEN 22	THEN 'Sepe - Servidor Distrital'
	WHEN 23	THEN 'Sepe - Servidor Municipal'
	WHEN 24	THEN 'Sepe - Participante de Comitiva'
	WHEN 25	THEN 'Sepe - Equipe de Apoio'
	WHEN 26	THEN 'Mais Médicos - Médico'
	WHEN 27	THEN 'Mais Médicos - Dependente'
END as tipo_proposto,
pl.data_inicio_viagem,
pl.data_fim_viagem,
--t_origem.posicao origem1,
c_origem.nome origem,
--t_destino.posicao destino1,
c_destino.nome destino,
mv.descricao motivo_viagem,
pl.descricao_motivo_viagem,
COALESCE(
(
	SELECT  
		sum(rc.qtd_diarias_internacionais+rc.qtd_diarias_nacionais)
	FROM 
		NovoSCDP_VBL.resumo_calculo rc 
	WHERE
		pl.id = rc.id_planejamento
),0.00) qtd_total_diarias,
round(COALESCE(
(
	SELECT 
		SUM(CASE WHEN pg.cotacao IS NULL THEN pg.valor_real else pg.cotacao * pg.valor_moeda END)
	FROM
		NovoSCDP_VBL.pagamento pg
	WHERE
		pg.id_pcdp = pcdp.id
	AND pg.tipo_pagamento_vl IN (1,2)
),0.00),2) vl_total_diarias,
COALESCE(
(
	SELECT 
		count(b.id) qtd_bilhete 
	FROM 
		NovoSCDP_VBL.bilhete b
	WHERE 
		pcdp.id = b.id_pcdp
),0.00) qtd_total_passagens,
round(COALESCE(
(
	SELECT 
		SUM((COALESCE(pg.valor_tarifa,0.00) + COALESCE(pg.valor_taxa_embarque,0.00) + COALESCE(pg.valor_taxa_servico,0.00)) * COALESCE(pg.cotacao,1.00))
	FROM
		NovoSCDP_VBL.pagamento_bilhete pg
		JOIN NovoSCDP_VBL.bilhete b ON b.id = pg.id_bilhete
	WHERE
		b.id_pcdp = pcdp.id
),0.00),2) vl_total_passagens,
COALESCE(
(
	SELECT 
		SUM(coalesce(sa.valor, 0.00))
	FROM
		NovoSCDP_VBL.servico_agenciamento sa
		JOIN NovoSCDP_VBL.planejamento pl ON pl.id = sa.id_planejamento
	WHERE
		pl.id_pcdp = pcdp.id
		AND sa.tipo_lancamento_vl = 2 -- REALIZADO
),0.00) vl_agenciamento, 
COALESCE(
(
	SELECT 
		SUM(coalesce(sc.valor, 0.00))
	FROM
		NovoSCDP_VBL.servico_correlato sc
	WHERE
		sc.id_pcdp = pcdp.id
		AND sc.situacao_vl IN (2, 3) -- emitido e inutilizado, descartando reservado e emissÃ£o rejeitada
),0.00) vl_servico_correlato,
COALESCE(
(
	SELECT 
		SUM(CASE WHEN pg.cotacao IS NULL THEN pg.valor_real else pg.cotacao * pg.valor_moeda END)
	FROM
		NovoSCDP_VBL.pagamento pg
	WHERE
		pg.id_pcdp = pcdp.id
		AND pg.tipo_pagamento_vl = 3
),0.00) vl_restituicoes,
COALESCE(
(
	SELECT 
		SUM(COALESCE(d.valor_divida_diaria_nacional,0) + COALESCE( d.valor_divida_restituicao, 0.00 ) 
			+ ROUND( COALESCE(d.valor_divida_diaria_internacional, 0.00) * ROUND( COALESCE(d.cotacao, 0.0000), 4 ), 2)) 
	FROM
		NovoSCDP_VBL.devolucao d
	WHERE
		d.id_pcdp = pcdp.id
),0.00) vl_devolucoes,
parseDate(now(), 'yyyy-MM-dd') dt_extracao
FROM NovoSCDP_VBL.pcdp pcdp
JOIN NovoSCDP_VBL.proposto_pcdp pp ON pcdp.id = pp.id_pcdp 
JOIN NovoSCDP_VBL.planejamento pl ON pcdp.id_planejamento = pl.id
JOIN NovoSCDP_VBL.trecho t_destino ON pl.id = t_destino.id_planejamento 
	AND t_destino.posicao = (SELECT 
					MAX(t2.posicao)
					FROM NovoSCDP_VBL.trecho t2
					WHERE t2.id_planejamento = pl.id)
JOIN NovoSCDP_VBL.trecho t_origem ON pl.id = t_origem.id_planejamento 
	AND t_origem.posicao = (SELECT 
					t2.posicao
					FROM NovoSCDP_VBL.trecho t2
					WHERE t2.id_planejamento = pl.id
					AND t2.posicao = 1)
JOIN NovoSCDP_VBL.pagamento pg ON pl.id = pg.id_planejamento 
--JOIN NovoSCDP_VBL.resumo_calculo rc ON pl.id = rc.id_planejamento 
JOIN NovoSCDP_VBL.motivo_viagem mv ON pl.id_motivo_viagem = mv.id
JOIN NovoSCDP_VBL.cidade c_origem ON t_origem.id_cidade_origem = c_origem.id 
JOIN NovoSCDP_VBL.cidade c_destino ON t_destino.id_cidade_origem = c_destino.id 
JOIN NovoSCDP_VBL.hierarquia_orgao ho ON ho.id = pcdp.id_orgao_solicitante
JOIN NovoSCDP_VBL.orgao o ON o.id = ho.id_orgao_hierarquia 
	AND o.raiz = 1
WHERE 
pp.tipo_proposto_vl = 3 
AND pcdp.ano >= 2023
ORDER BY 
pcdp.ano,
pl.numero_pcdp ASC)x;