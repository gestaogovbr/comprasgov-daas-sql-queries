----------------------------------------- tb_licitacao

SELECT
	--co_compra
	CONCAT(RIGHT(CONCAT(REPLICATE('0', 6), co_uasg), 6), RIGHT(CONCAT(REPLICATE('0', 2), co_modalidade_licitacao), 2), RIGHT(CONCAT(REPLICATE('0', 9), nu_aviso_licitacao), 9)) co_compra,
	co_modalidade_licitacao,
	co_municipio_uasg,
	co_orgao_uasg AS co_orgao,
	co_uasg,
	ds_situacao_aviso,
	ds_tipo_recurso,
	dt_abertura_proposta,
	dt_entrega_edital,
	dt_entrega_proposta,
	dt_publicacao,
	-- in_pregao_eletronico
	CASE in_pregao_eletronico WHEN 'true' THEN 'Sim' WHEN 'false' THEN 'N�o' END in_pregao_eletronico,
	-- in_outlier
	CASE WHEN vr_homologado_total > 8000000000 THEN 1 ELSE 0 END in_outlier,
	-- in_srp
	CASE no_sistema WHEN 'SISPP' THEN 'Tradicional'WHEN 'SISRP' THEN 'Registro de Pre�os' END in_srp,
	-- no_modalidade_licitacao
	CASE co_modalidade_licitacao 
		WHEN 1 THEN 'Convite'
		WHEN 2 THEN 'Tomada de Pre�os'
		WHEN 3 THEN 'Concorr�ncia'
		WHEN 4 THEN 'Concorr�ncia Internacional'
		WHEN 5 THEN 'Preg�o'
		WHEN 6 THEN 'Dispensa de Licita��o'
		WHEN 7 THEN 'Inexigibilidade de Licita��o'
		WHEN 20 THEN 'Concurso'
		WHEN 22 THEN 'Tomada de Pre�os por T�cnica e Pre�o'
		WHEN 33 THEN 'Concorr�ncia por T�cnica e Pre�o'
		WHEN 44 THEN 'Concorr�ncia Internacional por T�cnica e Pre�o'
		WHEN 99 THEN 'Regime Diferenciado de Contrata��es'
		END no_modalidade_licitacao,
	no_municipio_uasg,
	no_orgao_uasg,
	no_sistema,
	no_uasg,
	-- nu_ano_compra
	CAST(SUBSTRING(CAST(nu_aviso_licitacao AS VARCHAR), LEN(nu_aviso_licitacao) - 3, 4) AS INT) nu_ano_compra,
	nu_aviso_licitacao,
	nu_itens,
	sg_uf_municipio,
	tx_objeto_licitacao,
	vr_estimado_total,
	vr_homologado_total
FROM dados_abertos.tb_licitacao
WHERE co_orgao_uasg = 22000 AND in_status_registro = 1 AND ds_tipo_recurso = 'Nacional'
ORDER BY co_compra;

----------------------------------------- compras_sem_licitacao

SELECT
	-- co_compra
	CONCAT(RIGHT(CONCAT(REPLICATE('0', 6), co_uasg), 6), RIGHT(CONCAT(REPLICATE('0', 2), co_modalidade_licitacao), 2), RIGHT(CONCAT(REPLICATE('0', 9), nu_aviso_licitacao), 9)) co_compra,
	co_modalidade_licitacao,
	co_orgao,
	co_uasg,
	dt_declaracao_dispensa AS dt_compra,
	CASE co_modalidade_licitacao 
		WHEN 1 THEN 'Convite'
		WHEN 2 THEN 'Tomada de Pre�os'
		WHEN 3 THEN 'Concorr�ncia'
		WHEN 4 THEN 'Concorr�ncia Internacional'
		WHEN 5 THEN 'Preg�o'
		WHEN 6 THEN 'Dispensa de Licita��o'
		WHEN 7 THEN 'Inexigibilidade de Licita��o'
		WHEN 20 THEN 'Concurso'
		WHEN 22 THEN 'Tomada de Pre�os por T�cnica e Pre�o'
		WHEN 33 THEN 'Concorr�ncia por T�cnica e Pre�o'
		WHEN 44 THEN 'Concorr�ncia Internacional por T�cnica e Pre�o'
		WHEN 99 THEN 'Regime Diferenciado de Contrata��es'
		END no_modalidade_licitacao,
	dt_ano_aviso_licitacao AS nu_ano_compra,
	CASE WHEN vr_estimado > 8000000000 THEN 1 ELSE 0 END in_outlier,
	-- nu_compra
	CONCAT(nu_aviso_licitacao,dt_ano_aviso_licitacao) nu_compra,
	qt_total_item,
	vr_estimado AS vr_homologado_total
FROM dados_abertos.tb_compras_sem_licitacao
WHERE co_orgao = 22000
ORDER BY co_compra
;

----------------------------------------- tb_licitacao_item

SELECT
	-- co_compra 
	CONCAT(RIGHT(CONCAT(REPLICATE('0', 6), co_uasg), 6), RIGHT(CONCAT(REPLICATE('0', 2), co_modalidade_licitacao), 2), RIGHT(CONCAT(REPLICATE('0', 9), nu_aviso_licitacao), 9)) co_compra,
	-- co_material_servico 
	CASE WHEN co_item_material != 0 THEN co_item_material ELSE co_item_servico END co_material_servico,
	-- in_tipo_fornecedor_vencedor 
	CASE WHEN nu_cnpj_fornecedor IS NOT NULL THEN 'PJ' ELSE 'PF' END in_tipo_fornecedor_vencedor,
	-- in_tipo_item 
	CASE WHEN co_item_material != 0 THEN 'S' ELSE 'M' END in_tipo_item,
	-- no_fornecedor_vencedor 
	CASE WHEN no_fornecedor_pj IS NOT NULL THEN no_fornecedor_pj ELSE no_fornecedor_pf END no_fornecedor_vencedor,
	nu_cnpj_fornecedor,
	-- nu_cpf_cnpj_fornecedor 
	CASE WHEN nu_cnpj_fornecedor IS NOT NULL THEN nu_cnpj_fornecedor ELSE nu_cpf_fornecedor END nu_cpf_cnpj_fornecedor,
	nu_cpf_fornecedor,
	vr_estimado AS vr_homologado_item
FROM dados_abertos.tb_licitacao_item x
JOIN dados_abertos.tb_unidade_gestora u ON x.co_uasg = u.id_unidade_gestora 
WHERE u.id_orgao = 22000
ORDER BY co_compra
;

----------------------------------------- itens_sem_licitacao

SELECT
	--co_compra
	CONCAT(RIGHT(CONCAT(REPLICATE('0', 6), co_uasg), 6), RIGHT(CONCAT(REPLICATE('0', 2), co_modalidade_licitacao), 2), RIGHT(CONCAT(REPLICATE('0', 5), nu_aviso_licitacao), 5), RIGHT(CONCAT(REPLICATE('0', 4), dt_ano_aviso_licitacao), 4)) co_compra,
	--co_material_servico
	CASE WHEN co_conjunto_materiais = 0 THEN co_servico ELSE co_conjunto_materiais END co_material_servico,
	in_tipo_fornecedor_vencedor,
	--in_tipo_item 
	CASE WHEN co_conjunto_materiais = 0 THEN 'S' ELSE 'M' END in_tipo_item,
	no_fornecedor_vencedor,
	nu_cpf_cnpj_fornecedor,
	vr_estimado AS vr_homologado_item
FROM dados_abertos.tb_itens_sem_licitacao x
JOIN dados_abertos.tb_unidade_gestora u ON x.co_uasg = u.id_unidade_gestora 
WHERE u.id_orgao = 22000
ORDER BY co_compra
;