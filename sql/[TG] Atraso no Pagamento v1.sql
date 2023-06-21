select
--	a17.ID_UG  ID_UG,
	max(a111.CO_UG)  	EmitenteUG,
	max(a111.NO_UG)  EmitenteUGNome,
	a12.ID_DOC_HABIL  DocumentoHabil,
	a18.VA_DOC  ValorDocumentoHabil,
	sum(a19.VA_DOC)  ValorPagoAcumulado,
	a18.VA_DOC=sum(a19.VA_DOC) PagoTotalmente,
--	a14.ID_DOCUMENTO  ID_DOCUMENTO,
--	a14.ID_ANO_EMISSAO_DOC  ID_ANO_EMISSAO_DOC,
--	a11.ID_DIA  ID_DIA_ATESTE_DOC_HABIL,
--	a11.ID_MES  ID_MES_ATESTE_DOC_HABIL,
--	a11.ID_ANO  ID_ANO_ATESTE_DOC_HABIL,
	max(a11.NO_DIA_COMPLETO)  DHDataEmissaoDocOrigem,
--	a14.ID_ANO_EMISSAO_DOC  ID_ANO,
--	a14.ID_MES_EMISSAO_DOC  ID_MES,
--	a14.ID_DIA_EMISSAO_DOC  ID_DIA,
--	cast(lpad(a11.ID_ANO,4,2)||'-'||lpad(a11.ID_MES,2,0)||'-'||lpad(a11.ID_DIA,2,0) as date),
	cast(max(lpad(a14.ID_ANO_EMISSAO_DOC,4,2)||'-'||lpad(a14.ID_MES_EMISSAO_DOC,2,0)||'-'||lpad(a14.ID_DIA_EMISSAO_DOC,2,0)) as date),
	max(a110.NO_DIA_COMPLETO)  DataUltimoPagamento
from	DWTG_Colunar_VBL.WD_DIA	a11
	join	DWTG_Colunar_VBL.WD_DOC_ORIGEM_DOC_HABIL	a12
	  on 	(a11.ID_ANO = a12.ID_ANO_EMISSAO and 
	a11.ID_DIA = a12.ID_DIA_EMISSAO and 
	a11.ID_MES = a12.ID_MES_EMISSAO)
	join	(DWTG_Colunar_VBL.WD_DOCUMENTO	a14
	join	DWTG_Colunar_VBL.WD_COMPROMISSO_DOCUMENTO	a15
	  on 	(a14.ID_ANO_EMISSAO_DOC = a15.ID_ANO_EMISSAO_DOC and 
	a14.ID_DOCUMENTO = a15.ID_DOCUMENTO)
	join	DWTG_Colunar_VBL.WD_COMPROMISSO	a16
	  on 	(a15.ID_COMPROMISSO = a16.ID_COMPROMISSO)
	join	DWTG_Colunar_VBL.WD_UG_EXERCICIO	a17
	  on 	(a14.ID_ANO_EMISSAO_DOC = a17.ID_ANO and 
	a14.ID_UG = a17.ID_UG))
	  on 	(a12.ID_DOC_HABIL = a16.ID_DOC_HABIL)
	join	DWTG_Colunar_VBL.WD_DOC_HABIL	a18
	  on 	(a12.ID_DOC_HABIL = a18.ID_DOC_HABIL)
	join	DWTG_Colunar_VBL.WF_DOCUMENTO	a19
	  on 	(a14.ID_ANO_EMISSAO_DOC = a19.ID_ANO_EMISSAO_DOC and 
	a14.ID_DOCUMENTO = a19.ID_DOCUMENTO)
	join	DWTG_Colunar_VBL.WD_DIA	a110
	  on 	(a14.ID_ANO_EMISSAO_DOC = a110.ID_ANO and 
	a14.ID_DIA_EMISSAO_DOC = a110.ID_DIA and 
	a14.ID_MES_EMISSAO_DOC = a110.ID_MES)
	join	DWTG_Colunar_VBL.WD_UG	a111
	  on 	(a17.ID_UG = a111.ID_UG)
where	(
	a17.ID_UG in (130024) and
	a18.ID_ANO_EMISSAO in (2022) and 
	a18.ID_TP_DOC_HABIL in ('NP') and 
	a14.ID_TP_DOCUMENTO in ('OB'))
group by
	a17.ID_UG,
	a12.ID_DOC_HABIL,
	a18.VA_DOC,
--	a14.ID_DOCUMENTO,
	a14.ID_ANO_EMISSAO_DOC,
	a11.ID_DIA,
	a11.ID_MES,
	a11.ID_ANO
--	a14.ID_ANO_EMISSAO_DOC,
--	a14.ID_MES_EMISSAO_DOC,
--	a14.ID_DIA_EMISSAO_DOC