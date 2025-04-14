SELECT 
    p.numero_pcdp,
    pp.nome AS nome_proposto,
    p.data_inicio_viagem,
    p.data_fim_viagem,
    p.descricao_motivo_viagem,
    p.nome_orgao_solicitante,
    p.nome_orgao_raiz_solicitante,
    e.id AS id_encaminhamento,
    e.data_hora_inclusao_alteracao,
    e.id_cargo,
    e.id_atividade_funcao,
    e.id_funcao,
    e.id_usuario,
    u.nome AS nome_usuario_registro,
    e.id_planejamento,
    CASE e.tipo_evento_vl
        WHEN 1 THEN 'Criada'
        WHEN 2 THEN 'Cadastrada/Alterada'
        WHEN 3 THEN 'Documento Anexado'
        WHEN 4 THEN 'Aprovada pelo Proponente'
        WHEN 5 THEN 'Não Aprovada pelo Proponente'
        WHEN 7 THEN 'Complementação Não Aprovada pelo Proponente'
        WHEN 8 THEN 'Documento Anexado'
        WHEN 9 THEN 'Parecer Positivo do Assessor do Proponente'
        WHEN 10 THEN 'Parecer Negativo do Assessor do Proponente'
        WHEN 11 THEN 'Documento Anexado'
        WHEN 12 THEN 'Aprovada pelo Ordenador de Despesas'
        WHEN 13 THEN 'Não Aprovada pelo Ordenador de Despesas'
        WHEN 15 THEN 'Documento Anexado'
        WHEN 16 THEN 'Parecer Positivo do Assessor do Ordenador de Despesas'
        WHEN 17 THEN 'Parecer Negativo do Assessor do Ordenador de Despesas'
        WHEN 18 THEN 'Documento Anexado'
        WHEN 19 THEN 'Aprovada pela Autoridade Superior'
        WHEN 20 THEN 'Não Aprovada pela Autoridade Superior'
        WHEN 22 THEN 'Documento Anexado'
        WHEN 23 THEN 'Parecer Positivo do Assessor da Autoridade Superior'
        WHEN 24 THEN 'Parecer Negativo do Assessor da Autoridade Superior'
        WHEN 25 THEN 'Documento Anexado'
        WHEN 100 THEN 'Parecer Positivo do Consultor Internacional'
        WHEN 101 THEN 'Parecer Negativo do Consultor Internacional'
        WHEN 102 THEN 'Documento Anexado'
        WHEN 26 THEN 'Aprovada pelo Ministro'
        WHEN 27 THEN 'Não Aprovada pelo Ministro'
        WHEN 29 THEN 'Documento Anexado'
        WHEN 34 THEN 'Passagem Reservada'
        WHEN 36 THEN 'Documento Anexado'
        WHEN 37 THEN 'Emissão Finalizada'
        WHEN 110 THEN 'Bilhete Emitido'
        WHEN 39 THEN 'Bilhete Remarcado'
        WHEN 40 THEN 'Documento Anexado'
        WHEN 158 THEN 'Solicitação de geração de RB'
        WHEN 157 THEN 'Solicitação de geração de AV'
        WHEN 156 THEN 'Solicitação de geração de OB'
        WHEN 41 THEN 'Pagamento Confirmado'
        WHEN 42 THEN 'Adiantamento de Viagem Cancelada no SCDP'
        WHEN 43 THEN 'Ordem Bancária Cancelada no SCDP'
        WHEN 45 THEN 'Execução Financeira Cancelada'
        WHEN 46 THEN 'Adiantamento de Viagem Aprovada'
        WHEN 112 THEN 'Reembolso de Despesas Aprovado'
        WHEN 47 THEN 'Ordem Bancária Aprovada'
        WHEN 48 THEN 'Documento Anexado'
        WHEN 155 THEN 'Execução Financeira Encaminhada para Prestação de Contas'
        WHEN 49 THEN 'Valores Devolvidos - Viagem realizada'
        WHEN 154 THEN 'Valores Devolvidos - Viagem não realizada'
        WHEN 51 THEN 'Documento Anexado'
        WHEN 52 THEN 'Prestação de Contas Aprovada pelo Proponente - Viagem realizada'
        WHEN 147 THEN 'Prestação de Contas Aprovada pelo Proponente - Viagem não realizada'
        WHEN 53 THEN 'Prestação de Contas Não Aprovada pelo Proponente'
        WHEN 55 THEN 'Documento Anexado'
        WHEN 56 THEN 'PC com Parecer Positivo do Assessor do Proponente - Viagem realizada'
        WHEN 148 THEN 'PC com Parecer Positivo do Assessor do Proponente - Viagem não realizada'
        WHEN 57 THEN 'PC com Parecer Negativo do Assessor do Proponente - Viagem realizada'
        WHEN 149 THEN 'PC com Parecer Negativo do Assessor do Proponente - Viagem não realizada'
        WHEN 58 THEN 'Documento Anexado'
        WHEN 59 THEN 'Prestação de Contas Aprovada pelo Ordenador de Despesas - Viagem realizada'
        WHEN 151 THEN 'Prestação de Contas Aprovada pelo Ordenador de Despesas - Viagem não realizada'
        WHEN 60 THEN 'Prestação de Contas Não Aprovada pelo Ordenador de Despesas'
        WHEN 62 THEN 'Documento Anexado'
        WHEN 63 THEN 'Parecer Positivo da Prestação de Contas pelo Assessor do Ordenador de Despesas - Viagem realizada'
        WHEN 152 THEN 'Parecer Positivo da Prestação de Contas pelo Assessor do Ordenador de Despesas - Viagem não realizada'
        WHEN 64 THEN 'Parecer Negativo da Prestação de Contas pelo Assessor do Ordenador de Despesas - Viagem realizada'
        WHEN 153 THEN 'Parecer Negativo da Prestação de Contas pelo Assessor do Ordenador de Despesas - Viagem não realizada'
        WHEN 65 THEN 'Documento Anexado'
        WHEN 66 THEN 'Viagem Cancelada'
        WHEN 67 THEN 'Documento Anexado'
        WHEN 68 THEN 'Bilhete Cancelado'
        WHEN 69 THEN 'Documento Anexado'
        WHEN 70 THEN 'Reembolso Solicitado'
        WHEN 71 THEN 'Reembolso Aceito'
        WHEN 72 THEN 'Reembolso Rejeitado'
        WHEN 73 THEN 'Viagem Complementada'
        WHEN 92 THEN 'Complementação Excluída pelo Solicitante'
        WHEN 93 THEN 'Viagem Complementada Realizada Fora do Prazo'
        WHEN 160 THEN 'Prestação de Contas iniciada'
        WHEN 74 THEN 'Prestação de Contas encaminhada ao Proponente - Viagem realizada'
        WHEN 144 THEN 'Prestação de Contas encaminhada ao Proponente - Viagem não realizada'
        WHEN 75 THEN 'Prestação de Contas Concluída com Viagem Não Realizada'
        WHEN 76 THEN 'Retornado da Prestação de Contas'
        WHEN 94 THEN 'Prestação de Contas Fora do Prazo encaminhada ao Proponente - Viagem realizada'
        WHEN 145 THEN 'Prestação de Contas Fora do Prazo encaminhada ao Proponente - Viagem não realizada'
        WHEN 98 THEN 'Prestação de Contas encaminhada para Devolução de Valores - Viagem realizada'
        WHEN 146 THEN 'Prestação de Contas encaminhada para Devolução de Valores - Viagem não realizada'
        WHEN 95 THEN 'Desfazer Prestação de Contas'
        WHEN 77 THEN 'Solicitado ajuste da PCDP'
        WHEN 91 THEN 'Documento Anexado no Ajuste da PCDP'
        WHEN 96 THEN 'Publicação de PCDP Sigilosa'
        WHEN 97 THEN 'Cancelar publicação de PCDP Sigilosa'
        WHEN 6 THEN 'Retornada da Aprovação para o Solicitante pelo Proponente'
        WHEN 113 THEN 'Retornada da Aprovação para o Solicitante pelo Assessor do Proponente'
        WHEN 114 THEN 'Retornada da Aprovação para o Solicitante pelo Proponente/Assessor'
        WHEN 78 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Proponente'
        WHEN 115 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Assessor do Proponente'
        WHEN 116 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Proponente/Assessor'
        WHEN 14 THEN 'Retornada da Aprovação para o Proponente pelo Ordenador de Despesas'
        WHEN 117 THEN 'Retornada da Aprovação para o Proponente pelo Assessor do Ordenador de Despesas'
        WHEN 118 THEN 'Retornada da Aprovação para o Proponente pelo Ordenador/Assessor'
        WHEN 79 THEN 'Retornada da Aprovação para o Solicitante pelo Ordenador de Despesas'
        WHEN 119 THEN 'Retornada da Aprovação para o Solicitante pelo Assessor do Ordenador de Despesas'
        WHEN 141 THEN 'Retornada da Aprovação para o Solicitante pelo Ordenador/Assessor'
        WHEN 80 THEN 'Retornada da Aprovaçãos para o Solicitante de Passagem pelo Ordenador de Despesas'
        WHEN 142 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Assessor do Ordenador de Despesas'
        WHEN 143 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Ordenador/Assessor'
        WHEN 21 THEN 'Retornada da Aprovação para o Proponente pela Autoridade Superior'
        WHEN 123 THEN 'Retornada da Aprovação para o Proponente pelo Assessor da Autoridade Superior'
        WHEN 124 THEN 'Retornada da Aprovação para o Proponente pela Autoridade/Assessor'
        WHEN 81 THEN 'Retornada da Aprovação para o Solicitante pela Autoridade Superior'
        WHEN 125 THEN 'Retornada da Aprovação para o Solicitante pelo Assessor da Autoridade Superior'
        WHEN 126 THEN 'Retornada da Aprovação para o Solicitante pela Autoridade/Assessor'
        WHEN 82 THEN 'Retornada da Aprovação para o Solicitante de Passagem pela Autoridade Superior'
        WHEN 127 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Assessor da Autoridade Superior'
        WHEN 128 THEN 'Retornada da Aprovação para o Solicitante de Passagem pela Autoridade/Assessor'
        WHEN 28 THEN 'Retornada da Aprovação para o Proponente pelo Ministro'
        WHEN 129 THEN 'Retornada da Aprovação para o Proponente pelo Consultor Internacional'
        WHEN 130 THEN 'Retornada da Aprovação para o Proponente pelo Ministro/Consultor'
        WHEN 83 THEN 'Retornada da Aprovação para o Solicitante pelo Ministro'
        WHEN 131 THEN 'Retornada da Aprovação para o Solicitante pelo Consultor Internacional'
        WHEN 132 THEN 'Retornada da Aprovação para o Solicitante pelo Ministro/Consultor'
        WHEN 84 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Ministro'
        WHEN 133 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Consultor Internacional'
        WHEN 134 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Ministro/Consultor'
        WHEN 35 THEN 'Retornada da Reserva de Passagem para o Solicitante'
        WHEN 44 THEN 'Retornada da Execução Financeira para o Solicitante'
        WHEN 87 THEN 'Retornada da Execução Financeira para o Solicitante de Passagem'
        WHEN 88 THEN 'Retornada da Execução Financeira para o Ordenador de Despesas'
        WHEN 89 THEN 'Retornada da Execução Financeira para o Proponente'
        WHEN 50 THEN 'Retornada da Devolução de Valores para o Solicitante'
        WHEN 54 THEN 'Retornada da Aprovação de Contas para o Solicitante pelo Proponente'
        WHEN 135 THEN 'Retornada da Aprovação de Contas para o Solicitante pelo Assessor do Proponente'
        WHEN 136 THEN 'Retornada da Aprovação de Contas para o Solicitante pelo Proponente/Assessor'
        WHEN 61 THEN 'Retornada da Aprovação de Contas para o Proponente pelo Ordenador de Despesas'
        WHEN 139 THEN 'Retornada da Aprovação de Contas para o Proponente pelo Assessor do Ordenador de Despesas'
        WHEN 140 THEN 'Retornada da Aprovação de Contas para o Proponente pelo Ordenador/Assessor'
        WHEN 90 THEN 'Retornada da Aprovação de Contas para o Solicitante pelo Ordenador de Despesas'
        WHEN 137 THEN 'Retornada da Aprovação de Contas para o Solicitante pelo Assessor do Ordenador de Despesas'
        WHEN 138 THEN 'Retornada da Aprovação de Contas para o Solicitante pelo Ordenador/Assessor'
        WHEN 38 THEN 'Emissão Rejeitada (para o Solicitante de Passagem)'
        WHEN 111 THEN 'Emissão de Bilhete Rejeitada'
        WHEN 166 THEN 'Solicitada Rejeição de Emissão de Bilhete'
        WHEN 120 THEN 'Viagem Encerrada - realizada'
        WHEN 121 THEN 'Viagem Encerrada - não realizada'
        WHEN 122 THEN 'Viagem Encerrada - não aprovada'
        WHEN 150 THEN 'Apuração Especial'
        WHEN 159 THEN 'Operação efetuada via Compra Direta'
        WHEN 161 THEN 'Serviço Correlato Emitido'
        WHEN 162 THEN 'Emissão de Serviço Correlato Rejeitada'
        WHEN 165 THEN 'Reserva Efetuada: Passagem'
        WHEN 163 THEN 'Reserva Efetuada: Serviço Correlato'
        WHEN 164 THEN 'Reserva Efetuada: Passagem e Serviço Correlato'
        WHEN 167 THEN 'Prestação de contas automatizada'
        WHEN 168 THEN 'Confirmado vínculo com um bilhete de PCDP Grupo'
        WHEN 169 THEN 'Rejeitado vínculo com um bilhete de PCDP Grupo'
        WHEN 170 THEN 'Cancelamento de bilhete registrado manualmente'
        WHEN 171 THEN 'Não encontrados valores de passagens para Trecho Único/Ida-Volta'
        WHEN 172 THEN 'Companhia aérea cobrou remarcação fora do previsto'
        ELSE 'Não Cadastrado'
    END AS tipo_evento_descricao,
    e.observacao,
    e.detalhe,
    e.data_ultima_atualizacao_registro,
    CASE e.atividade_evento_vl
        WHEN 1 THEN 'Aprovação de Autoridade Superior'
        WHEN 3 THEN 'Aprovação de Ministro'
        WHEN 4 THEN 'Aprovação de Ordenador de Despesas'
        WHEN 5 THEN 'Aprovação de Ordenador de Despesas na PC'
        WHEN 6 THEN 'Aprovação de Proponente'
        WHEN 7 THEN 'Aprovação de Proponente na PC'
        WHEN 8 THEN 'Cadastro de PCDP'
        WHEN 9 THEN 'Cancelamento do Bilhete'
        WHEN 10 THEN 'Cancelamento da Viagem'
        WHEN 11 THEN 'Criação de Complemento da Viagem'
        WHEN 12 THEN 'Devolução de Valores'
        WHEN 13 THEN 'Emissão de Bilhete'
        WHEN 14 THEN 'Execução Financeira'
        WHEN 15 THEN 'Parecer do Assessor de Ordenador de Despesas'
        WHEN 16 THEN 'Parecer de Assessor de Ordenador de Despesas na PC'
        WHEN 17 THEN 'Parecer do Assessor de Proponente'
        WHEN 18 THEN 'Parecer de Assessor de Proponente na PC'
        WHEN 19 THEN 'Parecer de Autoridade Superior'
        WHEN 20 THEN 'Reserva de Passagem'
        WHEN 21 THEN 'Solicitação de Reembolso'
        WHEN 22 THEN 'Prestação de Contas'
        WHEN 23 THEN 'Viagem Encerrada'
        WHEN 24 THEN 'Parecer do Consultor Internacional'
        WHEN 25 THEN 'Realização de apuração especial'
        ELSE 'Não Mapeado'
    END AS atividade_evento_descricao,
    ev.data AS data_evento,
    ev.observacao AS observacao_evento,
    ev.detalhe AS detalhe_evento,
    ev.certificado_digital AS certificado_digital_evento,
    CASE ev.tipo_evento_vl
        WHEN 1 THEN 'Criada'
        WHEN 2 THEN 'Cadastrada/Alterada'
        WHEN 3 THEN 'Documento Anexado'
        WHEN 4 THEN 'Aprovada pelo Proponente'
        WHEN 5 THEN 'Não Aprovada pelo Proponente'
        WHEN 7 THEN 'Complementação Não Aprovada pelo Proponente'
        WHEN 8 THEN 'Documento Anexado'
        WHEN 9 THEN 'Parecer Positivo do Assessor do Proponente'
        WHEN 10 THEN 'Parecer Negativo do Assessor do Proponente'
        WHEN 11 THEN 'Documento Anexado'
        WHEN 12 THEN 'Aprovada pelo Ordenador de Despesas'
        WHEN 13 THEN 'Não Aprovada pelo Ordenador de Despesas'
        WHEN 15 THEN 'Documento Anexado'
        WHEN 16 THEN 'Parecer Positivo do Assessor do Ordenador de Despesas'
        WHEN 17 THEN 'Parecer Negativo do Assessor do Ordenador de Despesas'
        WHEN 18 THEN 'Documento Anexado'
        WHEN 19 THEN 'Aprovada pela Autoridade Superior'
        WHEN 20 THEN 'Não Aprovada pela Autoridade Superior'
        WHEN 22 THEN 'Documento Anexado'
        WHEN 23 THEN 'Parecer Positivo do Assessor da Autoridade Superior'
        WHEN 24 THEN 'Parecer Negativo do Assessor da Autoridade Superior'
        WHEN 25 THEN 'Documento Anexado'
        WHEN 100 THEN 'Parecer Positivo do Consultor Internacional'
        WHEN 101 THEN 'Parecer Negativo do Consultor Internacional'
        WHEN 102 THEN 'Documento Anexado'
        WHEN 26 THEN 'Aprovada pelo Ministro'
        WHEN 27 THEN 'Não Aprovada pelo Ministro'
        WHEN 29 THEN 'Documento Anexado'
        WHEN 34 THEN 'Passagem Reservada'
        WHEN 36 THEN 'Documento Anexado'
        WHEN 37 THEN 'Emissão Finalizada'
        WHEN 110 THEN 'Bilhete Emitido'
        WHEN 39 THEN 'Bilhete Remarcado'
        WHEN 40 THEN 'Documento Anexado'
        WHEN 158 THEN 'Solicitação de geração de RB'
        WHEN 157 THEN 'Solicitação de geração de AV'
        WHEN 156 THEN 'Solicitação de geração de OB'
        WHEN 41 THEN 'Pagamento Confirmado'
        WHEN 42 THEN 'Adiantamento de Viagem Cancelada no SCDP'
        WHEN 43 THEN 'Ordem Bancária Cancelada no SCDP'
        WHEN 45 THEN 'Execução Financeira Cancelada'
        WHEN 46 THEN 'Adiantamento de Viagem Aprovada'
        WHEN 112 THEN 'Reembolso de Despesas Aprovado'
        WHEN 47 THEN 'Ordem Bancária Aprovada'
        WHEN 48 THEN 'Documento Anexado'
        WHEN 155 THEN 'Execução Financeira Encaminhada para Prestação de Contas'
        WHEN 49 THEN 'Valores Devolvidos - Viagem realizada'
        WHEN 154 THEN 'Valores Devolvidos - Viagem não realizada'
        WHEN 51 THEN 'Documento Anexado'
        WHEN 52 THEN 'Prestação de Contas Aprovada pelo Proponente - Viagem realizada'
        WHEN 147 THEN 'Prestação de Contas Aprovada pelo Proponente - Viagem não realizada'
        WHEN 53 THEN 'Prestação de Contas Não Aprovada pelo Proponente'
        WHEN 55 THEN 'Documento Anexado'
        WHEN 56 THEN 'PC com Parecer Positivo do Assessor do Proponente - Viagem realizada'
        WHEN 148 THEN 'PC com Parecer Positivo do Assessor do Proponente - Viagem não realizada'
        WHEN 57 THEN 'PC com Parecer Negativo do Assessor do Proponente - Viagem realizada'
        WHEN 149 THEN 'PC com Parecer Negativo do Assessor do Proponente - Viagem não realizada'
        WHEN 58 THEN 'Documento Anexado'
        WHEN 59 THEN 'Prestação de Contas Aprovada pelo Ordenador de Despesas - Viagem realizada'
        WHEN 151 THEN 'Prestação de Contas Aprovada pelo Ordenador de Despesas - Viagem não realizada'
        WHEN 60 THEN 'Prestação de Contas Não Aprovada pelo Ordenador de Despesas'
        WHEN 62 THEN 'Documento Anexado'
        WHEN 63 THEN 'Parecer Positivo da Prestação de Contas pelo Assessor do Ordenador de Despesas - Viagem realizada'
        WHEN 152 THEN 'Parecer Positivo da Prestação de Contas pelo Assessor do Ordenador de Despesas - Viagem não realizada'
        WHEN 64 THEN 'Parecer Negativo da Prestação de Contas pelo Assessor do Ordenador de Despesas - Viagem realizada'
        WHEN 153 THEN 'Parecer Negativo da Prestação de Contas pelo Assessor do Ordenador de Despesas - Viagem não realizada'
        WHEN 65 THEN 'Documento Anexado'
        WHEN 66 THEN 'Viagem Cancelada'
        WHEN 67 THEN 'Documento Anexado'
        WHEN 68 THEN 'Bilhete Cancelado'
        WHEN 69 THEN 'Documento Anexado'
        WHEN 70 THEN 'Reembolso Solicitado'
        WHEN 71 THEN 'Reembolso Aceito'
        WHEN 72 THEN 'Reembolso Rejeitado'
        WHEN 73 THEN 'Viagem Complementada'
        WHEN 92 THEN 'Complementação Excluída pelo Solicitante'
        WHEN 93 THEN 'Viagem Complementada Realizada Fora do Prazo'
        WHEN 160 THEN 'Prestação de Contas iniciada'
        WHEN 74 THEN 'Prestação de Contas encaminhada ao Proponente - Viagem realizada'
        WHEN 144 THEN 'Prestação de Contas encaminhada ao Proponente - Viagem não realizada'
        WHEN 75 THEN 'Prestação de Contas Concluída com Viagem Não Realizada'
        WHEN 76 THEN 'Retornado da Prestação de Contas'
        WHEN 94 THEN 'Prestação de Contas Fora do Prazo encaminhada ao Proponente - Viagem realizada'
        WHEN 145 THEN 'Prestação de Contas Fora do Prazo encaminhada ao Proponente - Viagem não realizada'
        WHEN 98 THEN 'Prestação de Contas encaminhada para Devolução de Valores - Viagem realizada'
        WHEN 146 THEN 'Prestação de Contas encaminhada para Devolução de Valores - Viagem não realizada'
        WHEN 95 THEN 'Desfazer Prestação de Contas'
        WHEN 77 THEN 'Solicitado ajuste da PCDP'
        WHEN 91 THEN 'Documento Anexado no Ajuste da PCDP'
        WHEN 96 THEN 'Publicação de PCDP Sigilosa'
        WHEN 97 THEN 'Cancelar publicação de PCDP Sigilosa'
        WHEN 6 THEN 'Retornada da Aprovação para o Solicitante pelo Proponente'
        WHEN 113 THEN 'Retornada da Aprovação para o Solicitante pelo Assessor do Proponente'
        WHEN 114 THEN 'Retornada da Aprovação para o Solicitante pelo Proponente/Assessor'
        WHEN 78 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Proponente'
        WHEN 115 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Assessor do Proponente'
        WHEN 116 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Proponente/Assessor'
        WHEN 14 THEN 'Retornada da Aprovação para o Proponente pelo Ordenador de Despesas'
        WHEN 117 THEN 'Retornada da Aprovação para o Proponente pelo Assessor do Ordenador de Despesas'
        WHEN 118 THEN 'Retornada da Aprovação para o Proponente pelo Ordenador/Assessor'
        WHEN 79 THEN 'Retornada da Aprovação para o Solicitante pelo Ordenador de Despesas'
        WHEN 119 THEN 'Retornada da Aprovação para o Solicitante pelo Assessor do Ordenador de Despesas'
        WHEN 141 THEN 'Retornada da Aprovação para o Solicitante pelo Ordenador/Assessor'
        WHEN 80 THEN 'Retornada da Aprovaçãos para o Solicitante de Passagem pelo Ordenador de Despesas'
        WHEN 142 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Assessor do Ordenador de Despesas'
        WHEN 143 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Ordenador/Assessor'
        WHEN 21 THEN 'Retornada da Aprovação para o Proponente pela Autoridade Superior'
        WHEN 123 THEN 'Retornada da Aprovação para o Proponente pelo Assessor da Autoridade Superior'
        WHEN 124 THEN 'Retornada da Aprovação para o Proponente pela Autoridade/Assessor'
        WHEN 81 THEN 'Retornada da Aprovação para o Solicitante pela Autoridade Superior'
        WHEN 125 THEN 'Retornada da Aprovação para o Solicitante pelo Assessor da Autoridade Superior'
        WHEN 126 THEN 'Retornada da Aprovação para o Solicitante pela Autoridade/Assessor'
        WHEN 82 THEN 'Retornada da Aprovação para o Solicitante de Passagem pela Autoridade Superior'
        WHEN 127 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Assessor da Autoridade Superior'
        WHEN 128 THEN 'Retornada da Aprovação para o Solicitante de Passagem pela Autoridade/Assessor'
        WHEN 28 THEN 'Retornada da Aprovação para o Proponente pelo Ministro'
        WHEN 129 THEN 'Retornada da Aprovação para o Proponente pelo Consultor Internacional'
        WHEN 130 THEN 'Retornada da Aprovação para o Proponente pelo Ministro/Consultor'
        WHEN 83 THEN 'Retornada da Aprovação para o Solicitante pelo Ministro'
        WHEN 131 THEN 'Retornada da Aprovação para o Solicitante pelo Consultor Internacional'
        WHEN 132 THEN 'Retornada da Aprovação para o Solicitante pelo Ministro/Consultor'
        WHEN 84 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Ministro'
        WHEN 133 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Consultor Internacional'
        WHEN 134 THEN 'Retornada da Aprovação para o Solicitante de Passagem pelo Ministro/Consultor'
        WHEN 35 THEN 'Retornada da Reserva de Passagem para o Solicitante'
        WHEN 44 THEN 'Retornada da Execução Financeira para o Solicitante'
        WHEN 87 THEN 'Retornada da Execução Financeira para o Solicitante de Passagem'
        WHEN 88 THEN 'Retornada da Execução Financeira para o Ordenador de Despesas'
        WHEN 89 THEN 'Retornada da Execução Financeira para o Proponente'
        WHEN 50 THEN 'Retornada da Devolução de Valores para o Solicitante'
        WHEN 54 THEN 'Retornada da Aprovação de Contas para o Solicitante pelo Proponente'
        WHEN 135 THEN 'Retornada da Aprovação de Contas para o Solicitante pelo Assessor do Proponente'
        WHEN 136 THEN 'Retornada da Aprovação de Contas para o Solicitante pelo Proponente/Assessor'
        WHEN 61 THEN 'Retornada da Aprovação de Contas para o Proponente pelo Ordenador de Despesas'
        WHEN 139 THEN 'Retornada da Aprovação de Contas para o Proponente pelo Assessor do Ordenador de Despesas'
        WHEN 140 THEN 'Retornada da Aprovação de Contas para o Proponente pelo Ordenador/Assessor'
        WHEN 90 THEN 'Retornada da Aprovação de Contas para o Solicitante pelo Ordenador de Despesas'
        WHEN 137 THEN 'Retornada da Aprovação de Contas para o Solicitante pelo Assessor do Ordenador de Despesas'
        WHEN 138 THEN 'Retornada da Aprovação de Contas para o Solicitante pelo Ordenador/Assessor'
        WHEN 38 THEN 'Emissão Rejeitada (para o Solicitante de Passagem)'
        WHEN 111 THEN 'Emissão de Bilhete Rejeitada'
        WHEN 166 THEN 'Solicitada Rejeição de Emissão de Bilhete'
        WHEN 120 THEN 'Viagem Encerrada - realizada'
        WHEN 121 THEN 'Viagem Encerrada - não realizada'
        WHEN 122 THEN 'Viagem Encerrada - não aprovada'
        WHEN 150 THEN 'Apuração Especial'
        WHEN 159 THEN 'Operação efetuada via Compra Direta'
        WHEN 161 THEN 'Serviço Correlato Emitido'
        WHEN 162 THEN 'Emissão de Serviço Correlato Rejeitada'
        WHEN 165 THEN 'Reserva Efetuada: Passagem'
        WHEN 163 THEN 'Reserva Efetuada: Serviço Correlato'
        WHEN 164 THEN 'Reserva Efetuada: Passagem e Serviço Correlato'
        WHEN 167 THEN 'Prestação de contas automatizada'
        WHEN 168 THEN 'Confirmado vínculo com um bilhete de PCDP Grupo'
        WHEN 169 THEN 'Rejeitado vínculo com um bilhete de PCDP Grupo'
        WHEN 170 THEN 'Cancelamento de bilhete registrado manualmente'
        WHEN 171 THEN 'Não encontrados valores de passagens para Trecho Único/Ida-Volta'
        WHEN 172 THEN 'Companhia aérea cobrou remarcação fora do previsto'
        ELSE 'Não Cadastrado'
    END AS tipo_evento_vl_evento
FROM NovoSCDP_VBL.planejamento p
JOIN NovoSCDP_VBL.pcdp pc 
       ON p.id = pc.id_planejamento
JOIN NovoSCDP_VBL.proposto_pcdp pp 
       ON pc.id = pp.id_pcdp
JOIN NovoSCDP_VBL.encaminhamento e 
       ON p.id = e.id_planejamento
JOIN NovoSCDP_VBL.usuario u
       ON e.id_usuario = u.id
LEFT JOIN NovoSCDP_VBL.evento ev
       ON p.id = ev.id_planejamento  
WHERE EXTRACT(YEAR FROM p.data_fim_viagem) = 2024
  AND p.numero_pcdp = '009047/24'
  AND pp.nome = 'JOSEMAR PINHEIRO LIMA'
ORDER BY e.data_ultima_atualizacao_registro;

SELECT 
    p.numero_pcdp,
    pp.nome AS nome_proposto,
    p.data_inicio_viagem,
    p.data_fim_viagem, 
    p.descricao_motivo_viagem,
    p.nome_orgao_solicitante,
    p.nome_orgao_raiz_solicitante
FROM NovoSCDP_VBL.planejamento p
JOIN NovoSCDP_VBL.pcdp pc ON p.id = pc.id_planejamento
JOIN NovoSCDP_VBL.proposto_pcdp pp ON pc.id = pp.id_pcdp
WHERE EXTRACT(YEAR FROM p.data_fim_viagem) =  2024
AND p.numero_pcdp = '009047/24'
AND pp.nome = 'JOSEMAR PINHEIRO LIMA'