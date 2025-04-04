SELECT 
    id,
    numero_uasg,
    CASE codigo_modalidade
         WHEN 3  THEN 'concorrência'
         WHEN 5  THEN 'pregão'
         WHEN 6  THEN 'dispensa'
         WHEN 20 THEN 'concurso'
         ELSE 'Outra'
    END AS modalidade,
    numero_compra,
    ano_compra,
    numero_item,
    descricao,
    descricao_detalhada,
    unidade_fornecimento,
    valor_estimado,
    quantidade_solicitada,
    CASE situacao
         WHEN '1' THEN 'ativo'
         ELSE situacao
    END AS situacao,
    orcamento_sigiloso,
    data_hora_alteracao,
    data_hora_inclusao,
    fase,
    homologado,
    data_hora_previsao_abertura,
    codigo_item_catalogo,
    tipo_item_catalogo,
    melhor_valor_proposta_lance_informado,
    melhor_valor_proposta_lance_calculado,
    id_melhor_proposta_nao_desclassificada,
    CASE situacao_envio_resultado
         WHEN 'SP' THEN 'Resultado enviado com sucesso ao PNCP'
         ELSE situacao_envio_resultado
    END AS situacao_envio_resultado,
    quantidade_minima_solicitada,
    qtde_aceita,
    qtde_adjudicada,
    id_fase_recursal_atual,
    login_homologador,
    nome_homologador,
    ip_homologador,
    data_hora_homologacao
FROM ComprasGov_FaseExterna_VBL.item
WHERE homologado = 'S'
  AND situacao_envio_resultado = 'SP'
  AND codigo_modalidade IN (3, 5, 6, 20)
  AND ano_compra = 2024
  AND situacao = '1';



SELECT 
    id,
    login_homologador,
    nome_homologador,
    numero_uasg,
    CASE codigo_modalidade
         WHEN 3  THEN 'concorrência'
         WHEN 5  THEN 'pregão'
         WHEN 6  THEN 'dispensa'
         WHEN 20 THEN 'concurso'
         ELSE 'Outra'
    END AS modalidade,
    numero_compra,
    ano_compra,
    numero_item,
    numero_uasg || codigo_modalidade || numero_compra || ano_compra AS cod_compra,
    descricao,
    descricao_detalhada,
    unidade_fornecimento,
    valor_estimado,
    quantidade_solicitada,
    CASE situacao
         WHEN '1' THEN 'ativo'
         ELSE situacao
    END AS situacao,
    data_hora_alteracao,
    data_hora_inclusao,
    fase,
    homologado,
    data_hora_previsao_abertura,
    codigo_item_catalogo,
    tipo_item_catalogo,
    melhor_valor_proposta_lance_informado,
    melhor_valor_proposta_lance_calculado,
    id_melhor_proposta_nao_desclassificada,
    CASE situacao_envio_resultado
         WHEN 'SP' THEN 'Resultado enviado com sucesso ao PNCP'
         ELSE situacao_envio_resultado
    END AS situacao_envio_resultado,
    quantidade_minima_solicitada,
    qtde_aceita,
    qtde_adjudicada,
    id_fase_recursal_atual,
    ip_homologador,
    data_hora_homologacao
FROM ComprasGov_FaseExterna_VBL.item
WHERE homologado = 'S'
  AND situacao_envio_resultado = 'SP'
  AND codigo_modalidade IN (3, 5, 6, 20)
  AND ano_compra = 2024
  --AND (numero_uasg || codigo_modalidade || numero_compra || ano_compra) = '98787106000022024'
  AND situacao = '1'
  ORDER BY login_homologador 

SELECT 
    login_homologador,
    nome_homologador,
    COUNT(DISTINCT numero_compra || '-' || ano_compra) AS total_compras,
    COUNT(*) AS total_itens,
    SUM(valor_estimado) AS total_valor_estimado
FROM ComprasGov_FaseExterna_VBL.item
WHERE homologado = 'S'
  AND situacao_envio_resultado = 'SP'
  AND codigo_modalidade IN (3, 5, 6, 20)
  AND ano_compra = 2024
  AND situacao = '1'
GROUP BY login_homologador, nome_homologador
ORDER BY total_valor_estimado DESC;


SELECT 
    login_homologador,
    nome_homologador,
    numero_uasg,
    CASE codigo_modalidade
         WHEN 3  THEN 'concorrência'
         WHEN 5  THEN 'pregão'
         WHEN 6  THEN 'dispensa'
         WHEN 20 THEN 'concurso'
         ELSE 'outra'
    END AS modalidade,
    COUNT(DISTINCT numero_compra || '-' || ano_compra) AS total_compras,
    COUNT(*) AS total_itens,
    SUM(valor_estimado) AS total_valor_estimado
FROM ComprasGov_FaseExterna_VBL.item
WHERE homologado = 'S'
  AND situacao_envio_resultado = 'SP'
  AND codigo_modalidade IN (3, 5, 6, 20)
  AND ano_compra = 2024
  AND situacao = '1'
GROUP BY 
    login_homologador, 
    nome_homologador, 
    numero_uasg, 
    CASE codigo_modalidade
         WHEN 3  THEN 'concorrência'
         WHEN 5  THEN 'pregão'
         WHEN 6  THEN 'dispensa'
         WHEN 20 THEN 'concurso'
         ELSE 'outra'
    END
ORDER BY 
    total_valor_estimado DESC;





;