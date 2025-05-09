SELECT *
FROM (
    SELECT 
        c.isn, 
        ug.it_sg_uf as UF,
        org.it_no_orgao as Orgao,
        ug.it_no_unidade_gestora as UG,
        c.it_co_unidade_gestora as Codigo_UG,
        c.it_co_modalidade_licitacao,
        c.it_nu_aviso_licitacao as Num_Aviso_Licitacao,
        c.it_nu_item_material as Num_Item_Material,
        c.it_co_conjunto_materiais as Cod_Conjunto_Material,
        --c.it_co_servico, 
        c.it_tx_descricao_material as Descricao, 
        c.it_da_resultado_item as Data_Resultado,
        c.it_in_decreto_7174, 
        CAST (c.it_qt_material_alt AS INTEGER) it_qt_material_alt,
        --c.it_va_preco_unitario_item,
        --c.it_va_unitario_homologado_item,
        CASE WHEN c.it_va_preco_unitario_item = 0 
             THEN c.it_va_unitario_homologado_item
             ELSE c.it_va_preco_unitario_item 
        END  it_va_preco_unitario,
        CASE WHEN c.it_va_preco_unitario_item = 0 AND c.it_va_unitario_homologado_item = 0
             THEN CAST (c.it_qt_material_alt AS INTEGER)* c.it_va_estimado
             WHEN c.it_va_preco_unitario_item = 0 AND c.it_va_unitario_homologado_item != 0
             THEN CAST (c.it_qt_material_alt AS INTEGER)* c.it_va_unitario_homologado_item
             ELSE CAST (c.it_qt_material_alt AS INTEGER)* c.it_va_preco_unitario_item 
        END  it_va_valor_total,
        CASE WHEN c.it_co_modalidade_licitacao = '05'
             THEN 'https://compras.dados.gov.br/pregoes/v1/pregoes.html?'||'co_uasg='||c.it_co_unidade_gestora||'&nu_pregao='||c.it_nu_aviso_licitacao
        END  Link_Pregao
    FROM Siasg_DL_VBL.sidec_resultado_compra c
    LEFT JOIN Siasg_DL_VBL.siasg_unidade_gestora ug ON c.it_co_unidade_gestora = ug.it_co_unidade_gestora  
    LEFT JOIN (
        SELECT IT_CO_ORGAO, MAX(it_no_orgao) it_no_orgao  
        FROM Siasg_DL_VBL.SIASG_ORGAO
        GROUP BY IT_CO_ORGAO
    ) org ON ug.it_co_orgao = org.it_co_orgao 
    WHERE c.it_da_resultado_item BETWEEN '20240129' AND '20250508' 
    AND c.it_co_conjunto_materiais BETWEEN 1 AND 200000
) AS result
WHERE result.it_va_valor_total <> 0;