with ZZMQ00 as (
select	a11.ID_ITCP_TP_COD_MAT_SERV  ID_ITCP_TP_COD_MAT_SERV,
	a12.ID_CMPR_COMPRA  DS_CMPR_COMPRA_EDIT,
	a11.ID_ITCP_ITEM_COMPRA  ID_ITCP_ITEM_COMPRA
from	Siasg_DW_VBL.F_ITEM_FORNECEDOR	a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	Siasg_DW_VBL.D_DT_DATA	a13
	  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a13.ID_DT_DATA)
	join	Siasg_DW_VBL.D_UNDD_UNIDADE	a14
	  on 	(a12.ID_UNDD_RESP_COMPRA = a14.ID_UNDD_UNIDADE)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a15
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = a15.ID_ITCP_TP_COD_MAT_SERV)
where	1=1
 and a13.ID_DT_ANO in (2022)
 and a13.ID_DT_MES in (202201)
 and a14.ID_UNDD_IN_SISG in (1)
 and a15.ID_ITCP_TP_MATERIAL_SERVICO in (1)
group by	a11.ID_ITCP_TP_COD_MAT_SERV,
	a12.ID_CMPR_COMPRA,
	a11.ID_ITCP_ITEM_COMPRA
having	sum(a11.VL_PRECO_TOTAL_HOMOLOG) > 0 
), ZZSP01 as (
select	a11.ID_ITCP_ITEM_COMPRA  ID_ITCP_ITEM_COMPRA,
	a12.ID_CMPR_COMPRA  DS_CMPR_COMPRA_EDIT,
	a11.ID_ITCP_TP_COD_MAT_SERV  ID_ITCP_TP_COD_MAT_SERV,
	sum(a11.QT_ITCP_ITEM_COMPRAS)  WJXBFS1,
	sum(a11.VL_ITCP_PRECO_GLOBAL_ESTIM)  WJXBFS2
from	Siasg_DW_VBL.F_ITEM_COMPRA	a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	ZZMQ00	pa13
	  on 	(a11.ID_ITCP_ITEM_COMPRA = pa13.ID_ITCP_ITEM_COMPRA and 
			a11.ID_ITCP_TP_COD_MAT_SERV = pa13.ID_ITCP_TP_COD_MAT_SERV and 
			a12.ID_CMPR_COMPRA = pa13.DS_CMPR_COMPRA_EDIT)
	join	Siasg_DW_VBL.D_DT_DATA	a14
	  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a14.ID_DT_DATA)
	join	Siasg_DW_VBL.D_UNDD_UNIDADE	a15
	  on 	(a12.ID_UNDD_RESP_COMPRA = a15.ID_UNDD_UNIDADE)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a16
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = a16.ID_ITCP_TP_COD_MAT_SERV)
where	1=1
 and a14.ID_DT_ANO in (2022)
 and a14.ID_DT_MES in (202201)
 and a15.ID_UNDD_IN_SISG in (1)
 and a16.ID_ITCP_TP_MATERIAL_SERVICO in (1)
group by	a11.ID_ITCP_ITEM_COMPRA,
	a12.ID_CMPR_COMPRA,
	a11.ID_ITCP_TP_COD_MAT_SERV 
), ZZSP02 as (
select	a11.ID_ITCP_ITEM_COMPRA  ID_ITCP_ITEM_COMPRA,
	a12.ID_CMPR_COMPRA  DS_CMPR_COMPRA_EDIT,
	a11.ID_ITCP_TP_COD_MAT_SERV  ID_ITCP_TP_COD_MAT_SERV,
	sum(a11.VL_PRECO_TOTAL_HOMOLOG)  WJXBFS1
from	Siasg_DW_VBL.F_ITEM_FORNECEDOR	a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	ZZMQ00	pa13
	  on 	(a11.ID_ITCP_ITEM_COMPRA = pa13.ID_ITCP_ITEM_COMPRA and 
			a11.ID_ITCP_TP_COD_MAT_SERV = pa13.ID_ITCP_TP_COD_MAT_SERV and 
			a12.ID_CMPR_COMPRA = pa13.DS_CMPR_COMPRA_EDIT)
	join	Siasg_DW_VBL.D_DT_DATA	a14
	  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a14.ID_DT_DATA)
	join	Siasg_DW_VBL.D_UNDD_UNIDADE	a15
	  on 	(a12.ID_UNDD_RESP_COMPRA = a15.ID_UNDD_UNIDADE)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a16
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = a16.ID_ITCP_TP_COD_MAT_SERV)
where	1=1
 and a14.ID_DT_ANO in (2022)
 and a14.ID_DT_MES in (202201)
 and a15.ID_UNDD_IN_SISG in (1)
 and a16.ID_ITCP_TP_MATERIAL_SERVICO in (1)
group by	a11.ID_ITCP_ITEM_COMPRA,
	a12.ID_CMPR_COMPRA,
	a11.ID_ITCP_TP_COD_MAT_SERV 
)
select --distinct count(*) 
	a16.ID_UNDD_IN_SISG  ID_UNDD_IN_SISG,
	a115.DS_UNDD_IN_SISG  DS_UNDD_IN_SISG,
	a16.ID_UNDD_ESFERA  ID_UNDD_ESFERA,
	a113.DS_UNDD_ESFERA  DS_UNDD_ESFERA,
	a16.ID_UNDD_TP_ADM  ID_UNDD_TP_ADM,
	a116.DS_UNDD_TP_ADM  DS_UNDD_TP_ADM,
	a16.ID_UNDD_ORGAO  ID_UNDD_ORGAO,
	a118.DS_UNDD_ORGAO  DS_UNDD_ORGAO,
	a13.ID_UNDD_RESP_COMPRA  ID_UNDD_UNIDADE,
	a16.CD_UNDD_UNIDADE  CD_UNDD_UNIDADE,
	a16.NO_UNDD_UNIDADE  NO_UNDD_UNIDADE,
	a16.ID_LCAL_UF_UNIDADE  ID_LCAL_UF,
	a117.DS_LCAL_UF  DS_LCAL_UF,
	a14.ID_DT_ANO  ID_DT_ANO,
	a112.DS_DT_ANO  DS_DT_ANO,
	a14.ID_DT_MES  ID_DT_MES,
	a110.DS_DT_MES  DS_DT_MES,
	a15.ID_ITCP_GRUPO_MATERIAL  ID_ITCP_GRUPO_MATERIAL,
	a114.DS_ITCP_GRUPO_MATERIAL  DS_ITCP_GRUPO_MATERIAL,
	a15.ID_ITCP_CLASSE_MAT_SERV  ID_ITCP_CLASSE_MAT_SERV,
	a18.ID_ITCP_CLASSE_MAT_SERV_EDIT  DS_ITCP_CLASSE_MAT_SERV,
	a18.DS_ITCP_CLASSE_MAT_SERV  DS_ITCP_CLASSE_MAT_SERV0,
	a15.ID_ITCP_PADRAO_DESC_MAT  ID_ITCP_PADRAO_DESC_MAT,
	a111.DS_ITCP_PADRAO_DESC_MAT  DS_ITCP_PADRAO_DESC_MAT,
	pa11.ID_ITCP_TP_COD_MAT_SERV  ID_ITCP_TP_COD_MAT_SERV,
	a15.DS_ITCP_MATERIAL_SERVICO  DS_ITCP_MATERIAL_SERVICO,
	a15.ID_ITCP_MATERIAL_SERVICO  ID_ITCP_MATERIAL_SERVICO,
	a13.ID_CMPR_MODALIDADE_COMPRA  ID_CMPR_MODALIDADE_COMPRA,
	a19.DS_CMPR_MODALIDADE_COMPRA  DS_CMPR_MODALIDADE_COMPRA,
	a13.ID_CMPR_COMPRA  ID_CMPR_COMPRA,
	a13.DS_CMPR_OBJETO_COMPRA  DS_CMPR_COMPRA,
	pa11.DS_CMPR_COMPRA_EDIT  DS_CMPR_COMPRA_EDIT,
	a13.DS_CMPR_COMPRA_EDIT  DS_CMPR_COMPRA0,
	pa11.ID_ITCP_ITEM_COMPRA  ID_ITCP_ITEM_COMPRA,
	a17.CH_ITCP_ITEM_COMPRA_EDIT  DS_ITCP_ITEM_COMPRA,
	pa11.WJXBFS1  QT_ITCP_ITEM_COMPRAS,
	pa11.WJXBFS2  VL_ITCP_PRECO_GLOBAL_ESTIM,
	pa12.WJXBFS1  VL_PRECO_TOTAL_HOMOLOG
from	ZZSP01	pa11
	join	ZZSP02	pa12
	  on 	(pa11.DS_CMPR_COMPRA_EDIT = pa12.DS_CMPR_COMPRA_EDIT and 
			pa11.ID_ITCP_ITEM_COMPRA = pa12.ID_ITCP_ITEM_COMPRA and 
			pa11.ID_ITCP_TP_COD_MAT_SERV = pa12.ID_ITCP_TP_COD_MAT_SERV)
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a13
	  on 	(pa11.DS_CMPR_COMPRA_EDIT = a13.ID_CMPR_COMPRA)
	join	Siasg_DW_VBL.D_DT_DATA	a14
	  on 	(a13.DT_CMPR_RESULTADO_COMPRA = a14.ID_DT_DATA)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a15
	  on 	(pa11.ID_ITCP_TP_COD_MAT_SERV = a15.ID_ITCP_TP_COD_MAT_SERV)
	join	Siasg_DW_VBL.D_UNDD_UNIDADE	a16
	  on 	(a13.ID_UNDD_RESP_COMPRA = a16.ID_UNDD_UNIDADE)
	join	Siasg_DW_VBL.D_ITCP_ITEM_COMPRA	a17
	  on 	(pa11.ID_ITCP_ITEM_COMPRA = a17.ID_ITCP_ITEM_COMPRA)
	join	Siasg_DW_VBL.D_ITCP_CLASSE_MAT_SERV	a18
	  on 	(a15.ID_ITCP_CLASSE_MAT_SERV = a18.ID_ITCP_CLASSE_MAT_SERV)
	join	Siasg_DW_VBL.D_CMPR_MODALIDADE_COMPRA	a19
	  on 	(a13.ID_CMPR_MODALIDADE_COMPRA = a19.ID_CMPR_MODALIDADE_COMPRA)
	join	Siasg_DW_VBL.D_DT_MES	a110
	  on 	(a14.ID_DT_MES = a110.ID_DT_MES)
	join	Siasg_DW_VBL.D_ITCP_PADRAO_DESC_MAT	a111
	  on 	(a15.ID_ITCP_PADRAO_DESC_MAT = a111.ID_ITCP_PADRAO_DESC_MAT)
	join	Siasg_DW_VBL.D_DT_ANO	a112
	  on 	(a14.ID_DT_ANO = a112.ID_DT_ANO)
	join	Siasg_DW_VBL.D_UNDD_ESFERA	a113
	  on 	(a16.ID_UNDD_ESFERA = a113.ID_UNDD_ESFERA)
	join	Siasg_DW_VBL.D_ITCP_GRUPO_MATERIAL	a114
	  on 	(a15.ID_ITCP_GRUPO_MATERIAL = a114.ID_ITCP_GRUPO_MATERIAL)
	join	Siasg_DW_VBL.D_UNDD_IN_SISG	a115
	  on 	(a16.ID_UNDD_IN_SISG = a115.ID_UNDD_IN_SISG)
	join	Siasg_DW_VBL.D_UNDD_TP_ADM	a116
	  on 	(a16.ID_UNDD_TP_ADM = a116.ID_UNDD_TP_ADM)
	join	Siasg_DW_VBL.D_LCAL_UF	a117
	  on 	(a16.ID_LCAL_UF_UNIDADE = a117.ID_LCAL_UF)
	join	Siasg_DW_VBL.D_UNDD_ORGAO	a118
	  on 	(a16.ID_UNDD_ORGAO = a118.ID_UNDD_ORGAO)
limit 1
;