(SELECT 
REF_INSCARR.ref_dspl as 'Ins Carrier',null as 'Request Type',Case_Number as 'Case Number',Episode_ID as 'Episode ID',convert(varchar(10), cast(Episode_Dt as date), 101) as 'Episode Date',Case_Priority as 'Case Priority',null as 'TAT Hours',null as TATCompliant,
Case_Status as 'Case Status'
--REF_TEL.ref_desc as 'Case Status Desc'
,Case_Status_Desc as 'Case Status Desc',null as 'Request for Additional Info Date',null as 'Requested P2P Date',convert(varchar(10),cast(C_TEL.peer_to_peer_rev_dt as date), 101) as 'P2P Occured Date',convert(varchar(10),cast(P_TEL.srvc_strt_dt as date), 101) as 'Auth Approved Start Date',convert(varchar(10),cast(P_TEL.srvc_end_dt as date), 101) as 'Auth Expiration Date',null as 'Denial Code',null as 'Denial Description',
--Non_Cert_Phys_Last_Name as 'Non Cert Phys Last Name',
null as 'Non Cert Phys Last Name',
--Non_Cert_Phys_First_Name as 'Non Cert Phys First Name',
null as 'Non Cert Phys First Name',
convert(varchar(10),cast(C_TEL.decn_rndr_dttm as date), 101) as 'Coverage Determination Decision Date',convert(varchar(10),cast(C_TEL.wrt_decn_cmnct_dttm as date), 101) as 'Sent Date Coverage Determination Letter',null as 'New Revised',Clinical_Trial as 'Clinical Trial',
case 
when Cancer_Type1 <> 50 then REF_CS2.ref_dspl 
when Cancer_Type1 =50 then ctype else '' end  as 'Cancer Type',
--Diagnosis_Cd as 'Diagnosis',
null as 'Diagnosis',
Location,null as 'Adult Pediatric',
Custom,null as 'Metastatic at Diagnosis',
--null as 'Progression Recurrence'
case 
when Progression_Recurrence = 0 then 'No'
when Progression_Recurrence = 1 then 'Yes' else ''  end as  'Progression Recurrence'
,First_Relapse_Dt as 'Date Of First Relapse',substring(REF_TEL_1.REF_DSPL,1,10) as 'Treatment Type',trt_guid_typ_id as 'Treatment Line',DOD as 'Date Of Diagnosis',Stage_Diag_Adjuvant as 'Stage At Diagnosis Adjuvant',null as 'Stage At Diagnosis Adjuvant Tumor',null as 'Stage At Diagnosis Adjuvant Node',null as 'Stage At Diagnosis Adjuvant Met',HER2Status as 'HER2 Status',Hormone_Receptor_Status_ER as 'Hormone Receptor Status ER',
--Hormone_Receptor_Status_PR as 'Hormone Receptor Status PR'
null as 'Hormone Receptor Status PR',null as 'Onco Type DX',null as 'Mammo Print',null as 'Mammo Strat',Histology,EGFR,ALK,BRAF,KRAS,MET,RET,ROS1,null as PSA,null as 'Primary Gleason Score',null as 'Secondary Gleason Score',NCCNRegimen_Offered as 'NCCNRegimen Offered',NCCNRegimen_Selected as 'NCCNRegimen Selected',null as HCPCCode,null as 'HCPCCode Description',w_tel.proc_cd as 'HCPCCode Approved',A_TEL.cd_desc AS 'HCPCCode Description Approved',ICD9Code,M_tel.cd_desc as 'ICD9Description',Ord_Phys_Fst_Nm as 'Ordering Phys First Name',Ord_Phys_Lst_Nm as 'Ordering Phys Last Name',Ord_Phys_Specialty as 'Ordering Phys Specialty',Ord_Phys_MPIN as 'Ordering Phys MPIN',Ord_Phys_TIN as 'Ordering Phys TIN',Ord_Phys_Addr1 as 'Ordering Phys Addr1',
Ord_Phys_Addr2 as 'Ordering Phys Addr2',Ord_Phys_City as 'Ordering Phys City',Ord_Phys_State as 'Ordering Phys State',Ord_Phys_Zip as 'Ordering Phys Zip',Ord_Phys_Phone as 'Ordering Phys Phone',Ord_Phys_Fax as 'Ordering Phys Fax',Person_Entered_Case as 'Person Who Entered Case',Ord_Same_Rndr as 'Is Ordering Same As Rendering',fst_nm as 'Member First Name',lst_nm as 'Member Last Name',convert(varchar(10),cast(bth_dt as date), 101) as 'Member DOB',Z_MID.MBR_ID_TXT as 'Member ID',Mbr_Group_Nbr as 'Member Group Number',adr_ln_1_txt as 'Member Addr1',adr_ln_2_txt as 'Member Addr2',cty_nm as 'Member City',st_cd as 'Member State',zip_cd_txt as 'Member Zip',Mbr_Funding_Type as 'Member Funding Type',Rndr_Prvdr_Lst_Nm as 'Rendering Provider Last Name',Rndr_Prvdr_Fst_Nm as 'Rendering Provider First Name',Rndr_Prvdr_Specialty as 'Rendering Provider Specialty',Rndr_Prvdr_MPIN as 'Rendering Provider MPIN',Rndr_Prvdr_TIN as 'Rendering Provider TIN',Rndr_Prvdr_Addr1 as 'Rendering Provider Addr1',Rndr_Prvdr_Addr2 as 'Rendering Provider Addr2',Rndr_Prvdr_City as 'Rendering Provider City',Rndr_Prvdr_State as 'Rendering Provider State',Rndr_Prvdr_Zip as 'Rendering Provider Zip',Rndr_Prvdr_Phone as 'Rendering Provider Phone',Rndr_Prvdr_Fax as 'Rendering Provider Fax',LOB,null as 'Backdate Reason',Mnpsl_St as 'Menopausal Status',Pregnant,PDL1 as 'PD-L1',BRAF_V600E_Mutatn as 'BRAF V600E Mutation',Indication,
--Sppt_Cre as 'Supportive Care'
case 
when Supportive_Care = 0 then 'No' 
when Supportive_Care = 1 then 'Yes' else '' end as 'Supportive Care'
,Andro_Rcptr as 'Androgen Receptor',Ulms as 'uLMS',Age,Flt3 as FLT3,Cd33 as CD33,Flt3_Itd as 'FLT3-ITD',IDH1,IDH2,Plt_Snst_St as 'Plat Sensitive Stat',Ln_Thrpy as 'Line of Therapy',BRAF_V600K_Mutatn as 'BRAF V600K Mutation',BRAF_V600K as 'BRAF V600K',Ckit_Mutatn as 'c-Kit Mutation',Phase,Risk_Level as 'Risk Level',
CNS_DSES as 'CNS Disease',CD20,CD30,Trnsp_Cndt as 'Transplant Candidate',T315I,PDL1_Grt as 'PD-L1  1 Percent',Cncr_Sbtp as 'Cancer Subtype',DSES_Stat as 'Disease Status',Epo,Del_SQ as 'Del 5q',Fail_No_Rdoio as 'Fail No Radioiodine',Prg_Sym_Dses as 'Prog Sym Disease',Del_TP53 as 'del17p TP53',HER2_Mutatn as 'HER2 Mutation',Frl_Ptnt as 'FrailPtw cocond',Age_Und_65 as 'Age less 65 wo CoCondition',Sm_Rcptr as 'Somatostatin Recptor',ALK_ALCL as 'ALK ALCL',Pln_Trnsp as 'Plan for Transplant',Slw_Prg_Dses as 'SlowProgress Disease',Eosin_W_Gene as 'EosinFIP1L1PDGFRAfus',Rpd_Cytordtn as 'Rapid Cytoreduction',Kit_mutatn_neg as 'KIT D816V mutatn neg',BRCA_1_2 as 'BRCA 1 or 2',MSI_MMR as 'MSI MMR',BRAF_V600E as 'BRAF V600E',REF_CS.ref_cd as 'Disease Code',
vend_cse_id as 'Vender Case ID'
FROM  
(select DISTINCT Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,Diagnosis_Cd,ICD9Code,
Location,Stage_Diag_Adjuvant,HER2Status,Hormone_Receptor_Status_ER,Hormone_Receptor_Status_PR,Histology,EGFR,ALK,BRAF,KRAS,MET,RET,ROS1,Mnpsl_St,Pregnant,PDL1,BRAF_V600E_Mutatn,Indication,Sppt_Cre,Andro_Rcptr,Ulms,Age,Flt3,Cd33,Flt3_Itd,IDH1,IDH2,Plt_Snst_St,Ln_Thrpy,
BRAF_V600K_Mutatn,BRAF_V600K,Ckit_Mutatn,Phase,Risk_Level,CNS_DSES,CD20,CD30,Trnsp_Cndt,T315I,PDL1_Grt,Cncr_Sbtp,DSES_Stat,Epo,Del_SQ ,Fail_No_Rdoio,Prg_Sym_Dses,Del_TP53,HER2_Mutatn,Frl_Ptnt,Age_Und_65,Sm_Rcptr,ALK_ALCL,
Pln_Trnsp,Slw_Prg_Dses,Eosin_W_Gene,Rpd_Cytordtn,Kit_mutatn_neg,BRCA_1_2,MSI_MMR,BRAF_V600E,Ins_Carrier,Mbr_Group_Nbr,Mbr_Funding_Type,LOB,Ord_Same_Rndr,Ord_Phys_Fst_Nm,Rndr_Prvdr_Lst_Nm,Ord_Phys_Lst_Nm,Ord_Phys_Specialty,Ord_Phys_MPIN,Ord_Phys_TIN,Ord_Phys_Addr1,Ord_Phys_Addr2,Ord_Phys_City,Ord_Phys_State,Ord_Phys_Zip,Ord_Phys_Phone,Ord_Phys_Fax,Rndr_Prvdr_Fst_Nm,Rndr_Prvdr_Specialty,Rndr_Prvdr_MPIN,Rndr_Prvdr_TIN,Rndr_Prvdr_Addr1,Rndr_Prvdr_Addr2,Rndr_Prvdr_City,Rndr_Prvdr_State,Rndr_Prvdr_Zip,Rndr_Prvdr_Phone,Rndr_Prvdr_Fax,req_trt_rgmn_ver_id,MBR_ID as TEST,
Ord_Phys_Fst_Nm as Non_Cert_Phys_First_Name,Ord_Phys_Lst_Nm as Non_Cert_Phys_Last_Name 
,hsc_sts_typ_id,Case_Status_Desc,Progression_Recurrence,Supportive_Care,vend_cse_id,Cancer_Type1,ctype
FROM (Select 
Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,Diagnosis_Cd,Date_Of_Diag,ICD9Code,
Location,Stage_Diag_Adjuvant,HER2Status,Hormone_Receptor_Status_ER,Hormone_Receptor_Status_PR,Histology,EGFR,ALK,BRAF,KRAS,MET,RET,ROS1,Mnpsl_St,Pregnant,PDL1,BRAF_V600E_Mutatn,Indication,Sppt_Cre,Andro_Rcptr,Ulms,Age,Flt3,Cd33,Flt3_Itd,IDH1,IDH2,Plt_Snst_St,Ln_Thrpy,
BRAF_V600K_Mutatn,BRAF_V600K,Ckit_Mutatn,Phase,Risk_Level,CNS_DSES,CD20,CD30,Trnsp_Cndt,T315I,PDL1_Grt,Cncr_Sbtp,DSES_Stat,Epo,Del_SQ,Fail_No_Rdoio,Prg_Sym_Dses,Del_TP53,HER2_Mutatn,Frl_Ptnt,Age_Und_65,Sm_Rcptr,ALK_ALCL,
Pln_Trnsp,Slw_Prg_Dses,Eosin_W_Gene,Rpd_Cytordtn,Kit_mutatn_neg,BRCA_1_2,MSI_MMR,BRAF_V600E,PROV_SEQ_NBR,RF_COLUMN,SJ_COLUMN,Ord_Same_Rndr,
case when RF_COLUMN is not null then F.fst_nm else '' end as bh,case when RF_COLUMN is not null then F.lst_nm else '' end as LN,case when RF_COLUMN is not null then F.spcl_typ_id else '' end as SPID,case when RF_COLUMN is not null then F.ndb_mpin else '' end as mpin,
case when RF_COLUMN is not null then F.fed_tax_id else '' end as TID,case when RF_COLUMN is not null then F.adr_ln_1_txt else '' end as AD1,case when RF_COLUMN is not null then F.adr_ln_2_txt else '' end as AD2,case when RF_COLUMN is not null then F.cty_nm else '' end as CN,
case when RF_COLUMN is not null then F.st_cd else '' end as SCD,case when RF_COLUMN is not null then F.zip_cd_txt else '' end as ZCD,case when RF_COLUMN is not null then F.pri_tel_nbr else '' end as TNBR,case when RF_COLUMN is not null then F.fax_nbr else '' end as FNBR,
case when SJ_COLUMN is not null then F.lst_nm else '' end as t1,case when SJ_COLUMN is not null then F.fst_nm else '' end as FN,case when SJ_COLUMN is not null then F.spcl_typ_id else '' end as SID,case when SJ_COLUMN is not null then F.ndb_mpin else '' end as SMPIN,
case when SJ_COLUMN is not null then F.fed_tax_id else '' end as SFID,case when SJ_COLUMN is not null then F.adr_ln_1_txt else '' end as SAD1,case when SJ_COLUMN is not null then F.adr_ln_2_txt else '' end as SAD2,case when SJ_COLUMN is not null then F.cty_nm else '' end as SCN,
case when SJ_COLUMN is not null then F.st_cd else '' end as SCD1,case when SJ_COLUMN is not null then F.zip_cd_txt else '' end as SZIP,case when SJ_COLUMN is not null then F.pri_tel_nbr else '' end as SPNBR,case when SJ_COLUMN is not null then F.fax_nbr else '' end as SFNBR,
req_trt_rgmn_ver_id,MBR_ID,Mbr_Group_Nbr,Mbr_Funding_Type,LOB,Ins_Carrier
,hsc_sts_typ_id,Case_Status_Desc,Progression_Recurrence,Supportive_Care,vend_cse_id,Cancer_Type1,ctype
FROM
(select 
Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,Diagnosis_Cd,Date_Of_Diag,ICD9Code,
Location,Stage_Diag_Adjuvant,HER2Status,Hormone_Receptor_Status_ER,Hormone_Receptor_Status_PR,Histology,EGFR,ALK,BRAF,KRAS,MET,RET,ROS1,Mnpsl_St,Pregnant,PDL1,BRAF_V600E_Mutatn,Indication,Sppt_Cre,Andro_Rcptr,Ulms,Age,Flt3,Cd33,Flt3_Itd,IDH1,IDH2,Plt_Snst_St,Ln_Thrpy,
BRAF_V600K_Mutatn,BRAF_V600K,Ckit_Mutatn,Phase,Risk_Level,CNS_DSES,CD20,CD30,Trnsp_Cndt,T315I,PDL1_Grt,Cncr_Sbtp,DSES_Stat,Epo,Del_SQ,Fail_No_Rdoio,Prg_Sym_Dses,Del_TP53,HER2_Mutatn,Frl_Ptnt,Age_Und_65,Sm_Rcptr,ALK_ALCL,
Pln_Trnsp,Slw_Prg_Dses,Eosin_W_Gene,Rpd_Cytordtn,Kit_mutatn_neg,BRCA_1_2,MSI_MMR,BRAF_V600E,PROV_SEQ_NBR as PROV_SEQ_NBR_1,RF_COLUMN,SJ_COLUMN,Ord_Same_Rndr,req_trt_rgmn_ver_id,MBR_ID ,Mbr_Group_Nbr,Mbr_Funding_Type,LOB,Ins_Carrier
,hsc_sts_typ_id,Case_Status_Desc,Progression_Recurrence,Supportive_Care,vend_cse_id,Cancer_Type1,ctype
FROM 
(select Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,Diagnosis_Cd,Date_Of_Diag,ICD9Code,
[59] as Location,[1] as Stage_Diag_Adjuvant,[5] as HER2Status,[4] as Hormone_Receptor_Status_ER,[4] as Hormone_Receptor_Status_PR,[12] as Histology,[14] as EGFR,[15] as ALK,[46] as BRAF,[7] as KRAS,[19] as MET,[18] as RET,[16] as ROS1,[10] as Mnpsl_St,[11] as Pregnant,
[13] as PDL1,[17] as BRAF_V600E_Mutatn,[2] as Indication,[20] as Sppt_Cre,[21] as Andro_Rcptr,[22] as Ulms,[23] as Age,[24] as Flt3,[25] as Cd33,[26] as Flt3_Itd,[27] as IDH1,[28] as IDH2,[29] as Plt_Snst_St,[3] as Ln_Thrpy,
[30] as BRAF_V600K_Mutatn,[31] as BRAF_V600K,[32] as Ckit_Mutatn,[33] as Phase,[34] as Risk_Level,[35] as CNS_DSES,[36] as CD20,[37] as CD30,[39] as Trnsp_Cndt,[40] as T315I,[41] as PDL1_Grt,[42] as Cncr_Sbtp,
[43] as DSES_Stat,[44] as Epo,[45] as Del_SQ,[47] as Fail_No_Rdoio,[48] as Prg_Sym_Dses,[49] as Del_TP53,[38] as HER2_Mutatn,[50] as Frl_Ptnt,[51] as Age_Und_65,[52] as Sm_Rcptr,[53] as ALK_ALCL,
[54] as Pln_Trnsp,[55] as Slw_Prg_Dses,[56] as Eosin_W_Gene,[57] as Rpd_Cytordtn,[58] as Kit_mutatn_neg,[6] as BRCA_1_2,[8] as MSI_MMR,[9] as BRAF_V600E,req_trt_rgmn_ver_id,MBR_ID,Mbr_Group_Nbr,Mbr_Funding_Type,LOB,Ins_Carrier
,hsc_sts_typ_id,Case_Status_Desc,Progression_Recurrence,Supportive_Care,vend_cse_id,Cancer_Type1,ctype
FROM 
(SELECT Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,
req_trt_rgmn_ver_id,MBR_ID,HSC_DIAG.DSES_TRVRS_ID,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,TRVRS.dses_typ_id as Cancer_Type,C.diag_cd as Diagnosis_Cd,c.diag_cd as ICD9Code, convert(varchar(10),cast(C.CREAT_DTTM as date), 101) as Date_Of_Diag,
Mbr_Group_Nbr,Mbr_Funding_Type,LOB,Ins_Carrier,Progression_Recurrence,Supportive_Care
,hsc_sts_typ_id,Case_Status_Desc,vend_cse_id,Cancer_Type1,ctype
FROM 
(SELECT Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,
req_trt_rgmn_ver_id,MBR_ID,DSES_TRVRS_ID,
convert(varchar(10), cast([20] as date), 101) as Auth_Appr_Start_Dt ,
right(convert(varchar(10), cast([7] as date), 103),7)  as First_Relapse_Dt,right(convert(varchar(10), cast([3] as date), 103),7)  as DOD,Mbr_Group_Nbr,Mbr_Funding_Type,LOB,Ins_Carrier
,hsc_sts_typ_id,Case_Status_Desc,[6] as Progression_Recurrence,[18] as Supportive_Care,vend_cse_id,[4] as Cancer_Type1,[31] as ctype
--,hsc_atr_val
FROM 
(
select 
TST_NEW.*,
REF_hsc.ref_cd as Case_Status,
REF_hsc.ref_dspl as Case_Status_Desc,
E.pol_nbr as Mbr_Group_Nbr,E.Fund_arng_ID as Mbr_Funding_Type,E.lob_typ_id as LOB,E.lgl_enty_id as Ins_Carrier
from ( select * from (
SELECT 
A.hsc_id as Case_Number,
--glb_id as Episode_ID
 pri_srvc_ref_nbr as Episode_ID
,A.creat_dttm as Episode_Dt, rev_prr_typ_id as Case_Priority,
hsc_sts_typ_id,vend_cse_id,
case hsc_sts_typ_id  
  when 1 then (
   CASE f.decn_otcome_typ_id
                        WHEN 2
                        THEN (
                                CASE a.hsc_sts_rsn_typ_id
                                    WHEN 26
                                    THEN 2
                                    WHEN 27
                                    THEN 2
                                    WHEN 28
                                    THEN 2
                                    ELSE 4
                                END)
                        ELSE 4
                    END


  )


     WHEN 2
            THEN (
                    CASE a.hsc_sts_rsn_typ_id
                        WHEN 45
                        THEN 10
                        ELSE (
                                CASE f.decn_otcome_typ_id
                                    WHEN 1
                                    THEN 1
                                    WHEN 2
                                    THEN 2
                                    WHEN 4
                                    THEN 3
                                    ELSE NULL
                                END)
                    END)

   WHEN 5
            THEN (
                    CASE
                        WHEN (a.creat_dttm > (getdate()-45))
                        THEN 7
                        ELSE 8
                    END)
            WHEN 9
            THEN (
                    CASE a.hsc_sts_rsn_typ_id
                        WHEN 44
                        THEN 8
                        ELSE 9
                    END)
            ELSE NULL
  end 

as hscOverallStatusType,
null as Clinical_Trial,
DSES_TRVRS_ID,
req_cstm_trt_rgmn_ind as Custom,req_trt_rgmn_ver_ID as NCCNRegimen_Offered,aprv_trt_rgmn_ver_ID as NCCNRegimen_Selected,A.creat_user_id as Person_Entered_Case,
req_trt_rgmn_ver_id,MBR_ID

FROM (SELECT * FROM MBM.HSC) A

left join
(
        SELECT DISTINCT
            aa.hsc_id             AS hsc_id,
            aa.decn_otcome_typ_id AS decn_otcome_typ_id
        FROM
            (MBM.hsc_srvc_decn aa
        JOIN
            MBM.hsc_srvc_non_facl bb
        ON
            (((
                        aa.hsc_id = bb.hsc_id)
                AND (
                        aa.srvc_seq_nbr = bb.srvc_seq_nbr)
                AND (
                        (bb.medcn_admin_rte_typ_id) is null
                    OR  
					(
                            bb.medcn_admin_rte_typ_id <> '01')))))
        WHERE
            (
                aa.inac_ind = 0)) f  on A.hsc_id=f.hsc_id) Csests
				Where hscOverallStatusType=1)TST_NEW

INNER JOIN 
(select *, ROW_NUMBER() OVER(PARTITION BY hsc_id ORDER BY hsc_id desc) as RNK2 from MBM.HSC_MBR_COV where lob_typ_id in (1, 9, 15, 18, 11)) E
ON TST_NEW.Case_Number = E.HSC_ID and RNK2 =1
left join (select * from MBM.REF where  ref_nm = 'hscOverallStatusType') REF_hsc
ON REF_hsc.ref_cd = TST_NEW.hscOverallStatusType



)MBR_COV_TEST
LEFT JOIN (
    SELECT *
    FROM (
        SELECT HSC_ATR_VAL,hsc_atr_typ_id,hsc_id
       FROM mbm.hsc_atr 
        where hsc_atr_typ_id IN (20,7,3,6,18,4,31)
    ) AS SRC
    PIVOT( MAX(HSC_ATR_VAL) FOR hsc_atr_typ_id IN ([20],[7],[3],[6],[18],[4],[31])) AS pvt
) AS c
ON c.Hsc_id = MBR_COV_TEST.Case_Number)HSC_DIAG
LEFT JOIN
(select * from MBM.DSES_TRVRS)TRVRS
ON TRVRS.[DSES_TRVRS_ID]=HSC_DIAG.dses_trvrs_id
LEFT JOIN
(select *, ROW_NUMBER() OVER(PARTITION BY hsc_id ORDER BY hsc_id desc) as RNK1 from MBM.HSC_DIAG) C 
ON HSC_DIAG.Case_Number = C.HSC_ID and RNK1 =1)DSES_TRVRS_CLIN_VAR
LEFT JOIN 
(
    SELECT *
    FROM (
        SELECT clin_var_val,clin_var_typ_id,dses_trvrs_id
        FROM mbm.DSES_TRVRS_CLIN_VAR 
        where clin_var_typ_id IN (59,1,5,4,12,14,15,46,7,19,18,16,10,11,13,17,2,20,21,22,23,24,25,26,27,28,29,3,30,31,32,33,34,35,36,37,39,40,41,42,43,44,45,47,48,49,38,50,51,52,53,54,55,56,57,58,6,8,9)
    ) AS SRC_1
    PIVOT( MAX(clin_var_val) FOR clin_var_typ_id IN ([59],[1],[5],[4],[12],[14],[15],[46],[7],[19],[18],[16],[10],[11],[13],[17],[2],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[3],[30],[31],[32],[33],[34],[35],[36],[37],[39],[40],[41],[42],[43],[44],[45],[47],[48],[49],[38],[50],[51],[52],[53],[54],[55],[56],[57],[58],[6],[8],[9])) AS pvt1
) AS D
ON D.dses_trvrs_id = DSES_TRVRS_CLIN_VAR.DSES_TRVRS_ID)HSC_MBR_COV
LEFT JOIN
(SELECT case when RF_COLUMN='RF' and SJ_COLUMN='' then 'NO' 
                    when RF_COLUMN='' and SJ_COLUMN='SJ' then 'NO'
                    when RF_COLUMN='RF' and SJ_COLUMN='SJ' then 'YES' ELSE 'NO' END as Ord_Same_Rndr,HSC_ID as b,PROV_SEQ_NBR,RF_COLUMN,SJ_COLUMN 
FROM 
(SELECT 
             HSC_ID,
             PROV_SEQ_NBR,
             max(CASE WHEN prov_role_typ_id = 'RF' THEN prov_role_typ_id end ) AS 'RF_COLUMN',
             max(CASE WHEN prov_role_typ_id = 'SJ' THEN prov_role_typ_id end ) AS 'SJ_COLUMN'
FROM 
mbm.HSC_PROV_ROLE group by HSC_ID,PROV_SEQ_NBR
)HSC_PROV_ROLE)HSC_PROV_ROLE_MAIN
ON HSC_PROV_ROLE_MAIN.b = HSC_MBR_COV.CASE_NUMBER)HSC_PROV
LEFT JOIN 
(select * from MBM.HSC_PROV) F
on HSC_PROV.PROV_SEQ_NBR_1 =F.PROV_SEQ_NBR and HSC_PROV.case_number =F.HSC_ID
)CTE
LEFT JOIN 
(select max(b.bh) as Ord_Phys_Fst_Nm,max(b.t1) as Rndr_Prvdr_Lst_Nm,b.case_number as t4,MAX(b.LN) as Ord_Phys_Lst_Nm,       MAX(b.SPID) as Ord_Phys_Specialty,MAX(b.mpin) as Ord_Phys_MPIN,       MAX(b.TID) as Ord_Phys_TIN,MAX(b.AD1) as Ord_Phys_Addr1,MAX(b.AD2) as Ord_Phys_Addr2,     MAX(b.CN) as Ord_Phys_City,MAX(b.SCD) as Ord_Phys_State,MAX(b.ZCD) as Ord_Phys_Zip,MAX(b.TNBR) as Ord_Phys_Phone,MAX(b.FNBR) as Ord_Phys_Fax,MAX(b.FN) as Rndr_Prvdr_Fst_Nm,MAX(b.SID) as Rndr_Prvdr_Specialty,MAX(b.SMPIN) as Rndr_Prvdr_MPIN, MAX(b.SFID) as Rndr_Prvdr_TIN,MAX(b.SAD1) as Rndr_Prvdr_Addr1,MAX(b.SAD2) as Rndr_Prvdr_Addr2,MAX(b.SCN) as Rndr_Prvdr_City,MAX(b.SCD1) as Rndr_Prvdr_State,MAX(b.SZIP) as Rndr_Prvdr_Zip,MAX(b.SPNBR) as Rndr_Prvdr_Phone,MAX(b.SFNBR) as Rndr_Prvdr_Fax 
from (Select 
Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,Diagnosis_Cd,Date_Of_Diag,ICD9Code,
Location,Stage_Diag_Adjuvant,HER2Status,Hormone_Receptor_Status_ER,Hormone_Receptor_Status_PR,Histology,EGFR,ALK,BRAF,KRAS,MET,RET,ROS1,Mnpsl_St,Pregnant,PDL1,BRAF_V600E_Mutatn,Indication,Sppt_Cre,Andro_Rcptr,Ulms,Age,Flt3,Cd33,Flt3_Itd,IDH1,IDH2,Plt_Snst_St,Ln_Thrpy,
BRAF_V600K_Mutatn,BRAF_V600K,Ckit_Mutatn,Phase,Risk_Level,CNS_DSES,CD20,CD30,Trnsp_Cndt,T315I,PDL1_Grt,Cncr_Sbtp,DSES_Stat,Epo,Del_SQ,Fail_No_Rdoio,Prg_Sym_Dses,Del_TP53,HER2_Mutatn,Frl_Ptnt,Age_Und_65,Sm_Rcptr,ALK_ALCL,
Pln_Trnsp,Slw_Prg_Dses,Eosin_W_Gene,Rpd_Cytordtn,Kit_mutatn_neg,BRCA_1_2,MSI_MMR,BRAF_V600E,PROV_SEQ_NBR,RF_COLUMN,SJ_COLUMN,Ord_Same_Rndr,
case when RF_COLUMN is not null then F.fst_nm else '' end as bh,case when RF_COLUMN is not null then F.lst_nm else '' end as LN,case when RF_COLUMN is not null then F.spcl_typ_id else '' end as SPID,case when RF_COLUMN is not null then F.ndb_mpin else '' end as mpin,
case when RF_COLUMN is not null then F.fed_tax_id else '' end as TID,case when RF_COLUMN is not null then F.adr_ln_1_txt else '' end as AD1,case when RF_COLUMN is not null then F.adr_ln_2_txt else '' end as AD2,case when RF_COLUMN is not null then F.cty_nm else '' end as CN,
case when RF_COLUMN is not null then F.st_cd else '' end as SCD,case when RF_COLUMN is not null then F.zip_cd_txt else '' end as ZCD,case when RF_COLUMN is not null then F.pri_tel_nbr else '' end as TNBR,case when RF_COLUMN is not null then F.fax_nbr else '' end as FNBR,
case when SJ_COLUMN is not null then F.lst_nm else '' end as t1,case when SJ_COLUMN is not null then F.fst_nm else '' end as FN,case when SJ_COLUMN is not null then F.spcl_typ_id else '' end as SID,case when SJ_COLUMN is not null then F.ndb_mpin else '' end as SMPIN,
case when SJ_COLUMN is not null then F.fed_tax_id else '' end as SFID,case when SJ_COLUMN is not null then F.adr_ln_1_txt else '' end as SAD1,case when SJ_COLUMN is not null then F.adr_ln_2_txt else '' end as SAD2,case when SJ_COLUMN is not null then F.cty_nm else '' end as SCN,
case when SJ_COLUMN is not null then F.st_cd else '' end as SCD1,case when SJ_COLUMN is not null then F.zip_cd_txt else '' end as SZIP,case when SJ_COLUMN is not null then F.pri_tel_nbr else '' end as SPNBR,case when SJ_COLUMN is not null then F.fax_nbr else '' end as SFNBR,
req_trt_rgmn_ver_id,MBR_ID,Mbr_Group_Nbr,Mbr_Funding_Type,LOB,Ins_Carrier,hsc_sts_typ_id,Case_Status_Desc,Progression_Recurrence,Supportive_Care,vend_cse_id,Cancer_Type1,ctype
FROM
(select 
Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,Diagnosis_Cd,Date_Of_Diag,ICD9Code,
Location,Stage_Diag_Adjuvant,HER2Status,Hormone_Receptor_Status_ER,Hormone_Receptor_Status_PR,Histology,EGFR,ALK,BRAF,KRAS,MET,RET,ROS1,Mnpsl_St,Pregnant,PDL1,BRAF_V600E_Mutatn,Indication,Sppt_Cre,Andro_Rcptr,Ulms,Age,Flt3,Cd33,Flt3_Itd,IDH1,IDH2,Plt_Snst_St,Ln_Thrpy,
BRAF_V600K_Mutatn,BRAF_V600K,Ckit_Mutatn,Phase,Risk_Level,CNS_DSES,CD20,CD30,Trnsp_Cndt,T315I,PDL1_Grt,Cncr_Sbtp,DSES_Stat,Epo,Del_SQ,Fail_No_Rdoio,Prg_Sym_Dses,Del_TP53,HER2_Mutatn,Frl_Ptnt,Age_Und_65,Sm_Rcptr,ALK_ALCL,
Pln_Trnsp,Slw_Prg_Dses,Eosin_W_Gene,Rpd_Cytordtn,Kit_mutatn_neg,BRCA_1_2,MSI_MMR,BRAF_V600E,PROV_SEQ_NBR as PROV_SEQ_NBR_1,RF_COLUMN,SJ_COLUMN,Ord_Same_Rndr,req_trt_rgmn_ver_id,MBR_ID ,Mbr_Group_Nbr,Mbr_Funding_Type,LOB,Ins_Carrier
,hsc_sts_typ_id,Case_Status_Desc,Progression_Recurrence,Supportive_Care,vend_cse_id,Cancer_Type1,ctype
FROM 
(select Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Cancer_Type,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,Diagnosis_Cd,Date_Of_Diag,ICD9Code,
[59] as Location,[1] as Stage_Diag_Adjuvant,[5] as HER2Status,[4] as Hormone_Receptor_Status_ER,[4] as Hormone_Receptor_Status_PR,[12] as Histology,[14] as EGFR,[15] as ALK,[46] as BRAF,[7] as KRAS,[19] as MET,[18] as RET,[16] as ROS1,[10] as Mnpsl_St,[11] as Pregnant,
[13] as PDL1,[17] as BRAF_V600E_Mutatn,[2] as Indication,[20] as Sppt_Cre,[21] as Andro_Rcptr,[22] as Ulms,[23] as Age,[24] as Flt3,[25] as Cd33,[26] as Flt3_Itd,[27] as IDH1,[28] as IDH2,[29] as Plt_Snst_St,[3] as Ln_Thrpy,
[30] as BRAF_V600K_Mutatn,[31] as BRAF_V600K,[32] as Ckit_Mutatn,[33] as Phase,[34] as Risk_Level,[35] as CNS_DSES,[36] as CD20,[37] as CD30,[39] as Trnsp_Cndt,[40] as T315I,[41] as PDL1_Grt,[42] as Cncr_Sbtp,
[43] as DSES_Stat,[44] as Epo,[45] as Del_SQ,[47] as Fail_No_Rdoio,[48] as Prg_Sym_Dses,[49] as Del_TP53,[38] as HER2_Mutatn,[50] as Frl_Ptnt,[51] as Age_Und_65,[52] as Sm_Rcptr,[53] as ALK_ALCL,
[54] as Pln_Trnsp,[55] as Slw_Prg_Dses,[56] as Eosin_W_Gene,[57] as Rpd_Cytordtn,[58] as Kit_mutatn_neg,[6] as BRCA_1_2,[8] as MSI_MMR,[9] as BRAF_V600E,req_trt_rgmn_ver_id,MBR_ID,Mbr_Group_Nbr,Mbr_Funding_Type,LOB,Ins_Carrier
,hsc_sts_typ_id,Case_Status_Desc,Progression_Recurrence,Supportive_Care,vend_cse_id,Cancer_Type1,ctype
FROM 
(SELECT Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,
req_trt_rgmn_ver_id,MBR_ID,HSC_DIAG.DSES_TRVRS_ID,Auth_Appr_Start_Dt,First_Relapse_Dt,DOD,TRVRS.dses_typ_id as Cancer_Type,C.diag_cd as Diagnosis_Cd,c.diag_cd as ICD9Code, convert(varchar(10),cast(C.CREAT_DTTM as date), 101) as Date_Of_Diag,
Mbr_Group_Nbr,Mbr_Funding_Type,LOB,Ins_Carrier,hsc_sts_typ_id,Case_Status_Desc,Progression_Recurrence,Supportive_Care,vend_cse_id,Cancer_Type1,ctype
FROM 
(SELECT Case_Number,Episode_ID,Episode_Dt,Case_Priority,Case_Status,Clinical_Trial,Custom,NCCNRegimen_Offered,NCCNRegimen_Selected,Person_Entered_Case,
req_trt_rgmn_ver_id,MBR_ID,DSES_TRVRS_ID,
convert(varchar(10), cast([20] as date), 101) as Auth_Appr_Start_Dt ,
right(convert(varchar(10), cast([7] as date), 103),7)  as First_Relapse_Dt,right(convert(varchar(10), cast([3] as date), 103),7)  as DOD,Mbr_Group_Nbr,Mbr_Funding_Type,LOB,Ins_Carrier
,hsc_sts_typ_id,Case_Status_Desc,[6] as Progression_Recurrence,[18] as Supportive_Care,vend_cse_id,[4] as Cancer_Type1,[31] as ctype
--,HSC_ATR_VAL
FROM 
(

select 
TST_NEW.*,
REF_hsc.ref_cd as Case_Status,
REF_hsc.ref_dspl as Case_Status_Desc,
E.pol_nbr as Mbr_Group_Nbr,E.Fund_arng_ID as Mbr_Funding_Type,E.lob_typ_id as LOB,E.lgl_enty_id as Ins_Carrier
from ( select * from (
SELECT 
A.hsc_id as Case_Number,
--glb_id as Episode_ID
 pri_srvc_ref_nbr as Episode_ID
,A.creat_dttm as Episode_Dt, rev_prr_typ_id as Case_Priority,
hsc_sts_typ_id,vend_cse_id,
case hsc_sts_typ_id  
  when 1 then (
   CASE f.decn_otcome_typ_id
                        WHEN 2
                        THEN (
                                CASE a.hsc_sts_rsn_typ_id
                                    WHEN 26
                                    THEN 2
                                    WHEN 27
                                    THEN 2
                                    WHEN 28
                                    THEN 2
                                    ELSE 4
                                END)
                        ELSE 4
                    END


  )


     WHEN 2
            THEN (
                    CASE a.hsc_sts_rsn_typ_id
                        WHEN 45
                        THEN 10
                        ELSE (
                                CASE f.decn_otcome_typ_id
                                    WHEN 1
                                    THEN 1
                                    WHEN 2
                                    THEN 2
                                    WHEN 4
                                    THEN 3
                                    ELSE NULL
                                END)
                    END)

   WHEN 5
            THEN (
                    CASE
                        WHEN (a.creat_dttm > (getdate()-45))
                        THEN 7
                        ELSE 8
                    END)
            WHEN 9
            THEN (
                    CASE a.hsc_sts_rsn_typ_id
                        WHEN 44
                        THEN 8
                        ELSE 9
                    END)
            ELSE NULL
  end 

as hscOverallStatusType,
null as Clinical_Trial,
DSES_TRVRS_ID,
req_cstm_trt_rgmn_ind as Custom,req_trt_rgmn_ver_ID as NCCNRegimen_Offered,aprv_trt_rgmn_ver_ID as NCCNRegimen_Selected,A.creat_user_id as Person_Entered_Case,
req_trt_rgmn_ver_id,MBR_ID

FROM (SELECT * FROM MBM.HSC) A

left join
(
        SELECT DISTINCT
            aa.hsc_id             AS hsc_id,
            aa.decn_otcome_typ_id AS decn_otcome_typ_id
        FROM
            (MBM.hsc_srvc_decn aa
        JOIN
            MBM.hsc_srvc_non_facl bb
        ON
            (((
                        aa.hsc_id = bb.hsc_id)
                AND (
                        aa.srvc_seq_nbr = bb.srvc_seq_nbr)
                AND (
                        (bb.medcn_admin_rte_typ_id) is null
                    OR  
					(
                            bb.medcn_admin_rte_typ_id <> '01')))))
        WHERE
            (
                aa.inac_ind = 0)) f  on A.hsc_id=f.hsc_id) Csests
				Where hscOverallStatusType=1)TST_NEW

INNER JOIN 
(select *, ROW_NUMBER() OVER(PARTITION BY hsc_id ORDER BY hsc_id desc) as RNK2 from MBM.HSC_MBR_COV where lob_typ_id in (1, 9, 15, 18, 11)) E
ON TST_NEW.Case_Number = E.HSC_ID and RNK2 =1
left join (select * from MBM.REF where  ref_nm = 'hscOverallStatusType') REF_hsc
ON REF_hsc.ref_cd = TST_NEW.hscOverallStatusType

)MBR_COV_TEST
LEFT JOIN (
    SELECT *
    FROM (
        SELECT HSC_ATR_VAL,hsc_atr_typ_id,hsc_id
       FROM mbm.hsc_atr 
        where hsc_atr_typ_id IN (20,7,3,6,18,4,31)
    ) AS SRC
    PIVOT( MAX(HSC_ATR_VAL) FOR hsc_atr_typ_id IN ([20],[7],[3],[6],[18],[4],[31])) AS pvt
) AS c
ON c.Hsc_id = MBR_COV_TEST.Case_Number)HSC_DIAG
LEFT JOIN
(select * from MBM.DSES_TRVRS)TRVRS
ON TRVRS.[DSES_TRVRS_ID]=HSC_DIAG.dses_trvrs_id
LEFT JOIN
(select *, ROW_NUMBER() OVER(PARTITION BY hsc_id ORDER BY hsc_id desc) as RNK1 from MBM.HSC_DIAG) C 
ON HSC_DIAG.Case_Number = C.HSC_ID and RNK1 =1)DSES_TRVRS_CLIN_VAR
LEFT JOIN 
(
    SELECT *
    FROM (
        SELECT clin_var_val,clin_var_typ_id,dses_trvrs_id
        FROM mbm.DSES_TRVRS_CLIN_VAR 
        where clin_var_typ_id IN (59,1,5,4,12,14,15,46,7,19,18,16,10,11,13,17,2,20,21,22,23,24,25,26,27,28,29,3,30,31,32,33,34,35,36,37,39,40,41,42,43,44,45,47,48,49,38,50,51,52,53,54,55,56,57,58,6,8,9)
    ) AS SRC_1
    PIVOT( MAX(clin_var_val) FOR clin_var_typ_id IN ([59],[1],[5],[4],[12],[14],[15],[46],[7],[19],[18],[16],[10],[11],[13],[17],[2],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[3],[30],[31],[32],[33],[34],[35],[36],[37],[39],[40],[41],[42],[43],[44],[45],[47],[48],[49],[38],[50],[51],[52],[53],[54],[55],[56],[57],[58],[6],[8],[9])) AS pvt1
) AS D
ON D.dses_trvrs_id = DSES_TRVRS_CLIN_VAR.DSES_TRVRS_ID)HSC_MBR_COV
LEFT JOIN
(SELECT case when RF_COLUMN='RF' and SJ_COLUMN='' then 'NO' 
                    when RF_COLUMN='' and SJ_COLUMN='SJ' then 'NO'
                    when RF_COLUMN='RF' and SJ_COLUMN='SJ' then 'YES' ELSE 'NO' END as Ord_Same_Rndr,HSC_ID as b,PROV_SEQ_NBR,RF_COLUMN,SJ_COLUMN 
FROM 
(SELECT 
             HSC_ID,
             PROV_SEQ_NBR,
             max(CASE WHEN prov_role_typ_id = 'RF' THEN prov_role_typ_id end ) AS 'RF_COLUMN',
             max(CASE WHEN prov_role_typ_id = 'SJ' THEN prov_role_typ_id end ) AS 'SJ_COLUMN'
FROM 
mbm.HSC_PROV_ROLE group by HSC_ID,PROV_SEQ_NBR
)HSC_PROV_ROLE)HSC_PROV_ROLE_MAIN
ON HSC_PROV_ROLE_MAIN.b = HSC_MBR_COV.CASE_NUMBER)HSC_PROV
LEFT JOIN 
(select * from MBM.HSC_PROV) F
on HSC_PROV.PROV_SEQ_NBR_1 =F.PROV_SEQ_NBR and HSC_PROV.case_number =F.HSC_ID
) b group by b.case_number) PET
on PET.t4=cte.case_number
)main
LEFT JOIN
(select *, ROW_NUMBER() OVER(PARTITION BY hsc_id ORDER BY hsc_id desc) as RNK5 from MBM.HSC_SRVC_DECN) C_TEL
ON C_TEL.HSC_ID=MAIN.CASE_NUMBER AND RNK5=1
LEFT JOIN
(select *, ROW_NUMBER() OVER(PARTITION BY hsc_id ORDER BY hsc_id desc) as RNK6 from MBM.HSC_SRVC_NON_FACL) P_TEL
ON P_TEL.HSC_ID=MAIN.CASE_NUMBER AND RNK6=1
LEFT JOIN
(select * from MBM.ICD10) M_TEL
ON M_TEL.DIAG_CD=MAIN.Diagnosis_Cd
LEFT JOIN
(select * from MBM.TRT_RGMN_VER) D_TEL
ON D_TEL.trt_rgmn_ver_id =MAIN.req_trt_rgmn_ver_id
LEFT JOIN
(select * from MBM.MBR) Z_TEL
on Z_TEL.MBR_ID = MAIN.TEST
LEFT JOIN
(select *, ROW_NUMBER() OVER(PARTITION BY TT.MBR_ID ORDER BY TT.MBR_ID desc) as RNK8 from MBM.MBR_ADR TT where TT.adr_typ_id = '1') T_TEL
on T_TEL.MBR_ID = MAIN.TEST
LEFT JOIN 
(select * from MBM.REF where  ref_nm = 'hscStatusType')REF_TEL
ON REF_TEL.ref_cd = MAIN.hsc_sts_typ_id 
LEFT JOIN 
(select *, ROW_NUMBER() OVER(PARTITION BY HSC_ID,PROC_CD ORDER BY HSC_ID,PROC_CD desc) as RNK9 from MBM.HSC_SRVC) W_TEL
on MAIN.case_number =W_TEL.HSC_ID and RNK9 = 1 
LEFT JOIN
(select *, ROW_NUMBER() OVER(PARTITION BY proc_cd ORDER BY trpy_typ_id desc) as RNK7 from MBM.TRT_RGMN_VER_PROC) S_TEL 
ON S_TEL.proc_cd =W_TEL.proc_cd and RNK7 =1
LEFT JOIN 
(select * from MBM.REF where  ref_nm = 'therapyType')REF_TEL_1
ON REF_TEL_1.ref_cd = S_TEL.trpy_typ_id
LEFT JOIN 
(select * from [MBM].[HCPCS]) A_TEL
ON A_TEL.proc_cd  = W_TEL.PROC_CD
LEFT JOIN
(select * from MBM.REF where  ref_nm = 'DiseaseType')REF_CS
ON REF_CS.ref_cd = MAIN.Cancer_Type
LEFT JOIN
(select * from MBM.REF where  ref_nm = 'DiseaseType')REF_CS2
ON REF_CS2.ref_cd = MAIN.Cancer_Type1
LEFT JOIN
(select * from MBM.MBR_ID where MBR_ID_TYP_ID = 1) Z_MID
on Z_MID.MBR_ID = MAIN.TEST
LEFT JOIN
(select * from MBM.REF where  ref_nm = 'lineOfBusinessType')REF_INSCARR
ON REF_INSCARR.ref_cd = MAIN.LOB)TST