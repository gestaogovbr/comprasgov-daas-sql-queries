/* ========================================================
   Diárias e Passagens – Resumo anual (2020 – 2024)
   --------------------------------------------------------
   Cada linha = 1 ano
   • Quantidade de diárias            →  SUM(qtd_diarias_viagem)
   • Quantidade de passagens (bilhetes)→ SUM(qtd_bilhetes_viagem)
   • Valor total de diárias (R$)      →  SUM(vr_diarias_reais_viagem)
   • Valor total de passagens (R$)    →  SUM(vr_passagem_viagem)
   • Total geral (diárias + passagens)→  soma anterior
   --------------------------------------------------------
   Ajuste a FK de data se preferir usar ‘data início’ ou
   ‘data solicitação’; aqui uso id_dm_data_fim_viagem
   ======================================================== */
SELECT
        dd.ano                                                           AS Ano,
        /* ­­­­­­QUANTIDADES ­­­­­*/
        SUM(fv.qtd_diarias_viagem)                                       AS Qtd_Diarias,
        SUM(fv.qtd_bilhetes_viagem)                                      AS Qtd_Passagens,
        /* ­­­­­­VALORES ­­­­­­­­­ */
        SUM(fv.vr_diarias_reais_viagem)                                  AS Total_Diarias,
        SUM(fv.vr_passagem_viagem)                                       AS Total_Passagens,
        SUM(fv.vr_diarias_reais_viagem + fv.vr_passagem_viagem)          AS Total_Geral
FROM    DM_SCDP.dbo.ft_viagem   AS fv
JOIN    DM_SCDP.dbo.dm_data     AS dd
          ON dd.id = fv.id_dm_data_fim_viagem   -- ou outra FK de data
WHERE   dd.ano BETWEEN 2020 AND 2024            -- anos desejados
GROUP BY dd.ano
ORDER BY dd.ano;