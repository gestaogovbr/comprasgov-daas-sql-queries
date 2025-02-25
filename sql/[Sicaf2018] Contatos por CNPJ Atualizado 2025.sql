SELECT DISTINCT
    LPAD(p2.num_cpf_cnpj, 14, '0')        AS cnpjfornecedor,   
    p2.nom_nome                           AS nomefornecedor,
    p2.dsc_email                          AS emailfornecedor,
    t2.num_ddd || t2.num_telefone         AS telefonefornecedor,
    p1.num_cpf_cnpj                       AS cpfcnpjpessoa,
    p1.nom_nome                           AS nomepessoa,
    CASE p1.tp_vinculo_fornecedor
        WHEN 1  THEN 'Fornecedor'
        WHEN 3  THEN 'Sócio'
        WHEN 4  THEN 'Dirigente'
        WHEN 7  THEN 'Sócio e Dirigente'
        WHEN 8  THEN 'Sócio e Fornecedor'
        WHEN 9  THEN 'Representante Legal'
        ELSE p1.tp_vinculo_fornecedor
    END                                   AS vinculo_pessoa,
    t1.num_ddd || t1.num_telefone         AS telefonepessoa,
    p1.dsc_email                          AS emailpessoa
FROM Sicaf2018_VBL.pessoa p1
JOIN Sicaf2018_VBL.fornecedor f
       ON p1.id_fornecedor_proprietario = f.id_fornecedor
JOIN Sicaf2018_VBL.pessoa p2
       ON f.id_fornecedor = p2.id_pessoa
JOIN Sicaf2018_VBL.telefone t1
       ON p1.id_pessoa = t1.id_pessoa
JOIN Sicaf2018_VBL.telefone t2
       ON p2.id_pessoa = t2.id_pessoa;
