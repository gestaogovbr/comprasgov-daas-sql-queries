SELECT
    LPAD(p.num_cpf_cnpj, 14, '0') AS cnpj,
    'Responsável pelo Cadastro' AS vinculo,
    r.nom_nome AS nomecontato,
    'Email' AS tipocontato,
    LOWER(p.dsc_email) AS email,
    nj.dsc_natureza_juridica AS natureza_juridica
FROM Sicaf2018_VBL.pessoa p  
JOIN Sicaf2018_VBL.fornecedor_juridico fj 
    ON p.id_fornecedor_proprietario = fj.id_pessoa_juridica
JOIN Sicaf2018_VBL.responsavel_cadastro r 
    ON fj.id_responsavel_cadastro = r.id_responsavel_cadastro
JOIN Sicaf2018_VBL.natureza_juridica nj
    ON fj.id_natureza_juridica = nj.id_natureza_juridica
WHERE fj.id_natureza_juridica = 1

UNION

SELECT
    LPAD(p.num_cpf_cnpj, 14, '0') AS cnpj,
    'Responsável pelo Cadastro' AS vinculo,
    r.nom_nome AS nomecontato,
    'Email' AS tipocontato,
    LOWER(p.dsc_email) AS email,
    nj.dsc_natureza_juridica
FROM Sicaf2018_VBL.pessoa p  
JOIN Sicaf2018_VBL.fornecedor_juridico fj 
    ON p.id_fornecedor_proprietario = fj.id_pessoa_juridica
JOIN Sicaf2018_VBL.responsavel_cadastro r 
    ON fj.id_responsavel_cadastro = r.id_responsavel_cadastro
JOIN Sicaf2018_VBL.natureza_juridica nj
    ON fj.id_natureza_juridica = nj.id_natureza_juridica
WHERE fj.id_natureza_juridica = 1

UNION

SELECT
    LPAD(p2.num_cpf_cnpj, 14, '0') AS cnpj,
    CASE p2.tp_vinculo_fornecedor
        WHEN 1 THEN 'Fornecedor'
        WHEN 3 THEN 'Sócio'
        WHEN 4 THEN 'Dirigente'
        WHEN 7 THEN 'Sócio e Dirigente'
        WHEN 8 THEN 'Sócio e Fornecedor'
        WHEN 9 THEN 'Representante Legal'
        WHEN 10 THEN 'Responsavel Legal'
        WHEN 11 THEN 'Cônjuge do Dirigente'
        WHEN 12 THEN 'Sócio/Admin e Responsável Legal'
        ELSE CAST(p.tp_vinculo_fornecedor AS VARCHAR(50))
    END AS vinculo,
    p.nom_nome AS nomecontato,
    'Email' AS tipocontato,
    LOWER(p.dsc_email) AS email,
    nj.dsc_natureza_juridica
FROM Sicaf2018_VBL.pessoa p
JOIN Sicaf2018_VBL.fornecedor_juridico fj 
    ON p.id_fornecedor_proprietario = fj.id_pessoa_juridica
JOIN Sicaf2018_VBL.pessoa p2 
    ON fj.id_pessoa_juridica = p2.id_pessoa
JOIN Sicaf2018_VBL.natureza_juridica nj
    ON fj.id_natureza_juridica = nj.id_natureza_juridica
WHERE fj.id_natureza_juridica = 1

ORDER BY cnpj, vinculo, nomecontato, tipocontato;
