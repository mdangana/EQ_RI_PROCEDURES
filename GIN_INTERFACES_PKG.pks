CREATE OR REPLACE PACKAGE TQ_GIS.gin_interfaces_pkg
IS
   FUNCTION accountname (
      v_act_code       NUMBER DEFAULT NULL,
      v_ssl_act_code   NUMBER DEFAULT NULL
   )
      RETURN VARCHAR2;

   FUNCTION getpolicyno (v_drcr_no VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION get_brn_code (v_trans_no IN NUMBER)
      RETURN NUMBER;

   PROCEDURE trans_query (
      trans_data_rec   IN OUT   fms_interfaces_pkg.type_trans_ref_cur,
      v_act_code       IN       NUMBER,
      v_act_type       IN       VARCHAR2
   );

   FUNCTION gis_def_cur (v_brh NUMBER)
      RETURN NUMBER;

   PROCEDURE valid_acc (
      v_acc_no     VARCHAR2,
      v_org_code   NUMBER,
      v_brh_code   NUMBER
   );

--   PROCEDURE post_gis_rct (
--   v_rct_code                       NUMBER,
--   v_rct_rec                        fms_interfaces_pkg.type_receipts_table,
--   v_tran_mapping          IN OUT   fms_interfaces_pkg.tran_mapping_type,
--   v_rct_type                       VARCHAR2,
--   v_user_name                      VARCHAR2,
--   v_cancel                         VARCHAR2 DEFAULT 'N',
--   v_mtran_ref_no                   VARCHAR2 DEFAULT NULL,
--   v_reasons_for_failure            VARCHAR2 DEFAULT NULL
--);

  PROCEDURE post_gis_rct (
   v_rct_code                       NUMBER,
   v_rct_rec                        fms_interfaces_pkg.type_receipts_table,
   v_tran_mapping          IN OUT   fms_interfaces_pkg.tran_mapping_type,
   v_rct_type                       VARCHAR2,
   v_user_name                      VARCHAR2,
   v_cancel                         VARCHAR2 DEFAULT 'N',
   v_mtran_ref_no                   VARCHAR2 DEFAULT NULL,
   v_reasons_for_failure            VARCHAR2 DEFAULT NULL
);

   FUNCTION agency_query (
      v_acc_id       VARCHAR2,
      v_name         VARCHAR2 DEFAULT NULL,
      v_pol_prp_no   VARCHAR2 DEFAULT NULL,
      v_acc_no       NUMBER DEFAULT NULL,
      v_dr_cr_no     VARCHAR2 DEFAULT NULL,
      v_trans_no     NUMBER DEFAULT NULL
   )
      RETURN fms_interfaces_pkg.type_client_types_ref_cursor;

   PROCEDURE create_gl_voucher (
      v_gltran_tran_no   NUMBER,
      v_description      VARCHAR2,
      v_user_name        VARCHAR2,
      v_agent_code       NUMBER,
      v_uw_or_clm        VARCHAR2 := 'U',
      v_pol_batch_no     NUMBER DEFAULT NULL,
      v_other_ref        VARCHAR2 DEFAULT NULL
   );

   --Procedure process_claim_pymt(v_clmrg_claim_no varchar2,v_clmrg_uw_year number,v_user_name varchar2);
   PROCEDURE process_claim_pymt (
      v_clmrg_claim_no   VARCHAR2,
      v_trans_no         NUMBER,
      v_user_name        VARCHAR2,
      v_pay_method       VARCHAR2 DEFAULT 'CHQ'
   );

   PROCEDURE process_clm_creditnote (
      v_clmrg_claim_no        VARCHAR2,
      v_trans_no              NUMBER,
      v_user_name             VARCHAR2,
      v_auth_date        IN   DATE DEFAULT TRUNC (SYSDATE)
   );

   PROCEDURE process_exes_ref_pymt (
      v_clmrg_claim_no   VARCHAR2,
      v_trans_no         NUMBER,
      v_user_name        VARCHAR2
   );

   FUNCTION module_enabled (vmodule IN VARCHAR2)
      RETURN BOOLEAN;

   FUNCTION interface_enabled (
      v_itfc_desc          VARCHAR2,
      v_post_past_period   VARCHAR2 DEFAULT 'Y'
   )
      RETURN VARCHAR2;

   FUNCTION contract_status (v_con_code VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION sl_control_acc (
      v_sys        VARCHAR2,
      v_acc_type   VARCHAR2,
      v_sl_trans   VARCHAR2 DEFAULT NULL
   )
      RETURN VARCHAR2;

   PROCEDURE cancel_gis_rct (
      v_rct_code                NUMBER,
      v_rct_rec                 fms_interfaces_pkg.type_receipts_table,
      v_tran_mapping   IN OUT   fms_interfaces_pkg.tran_mapping_type,
      v_rct_type                VARCHAR2,
      v_user_name               VARCHAR2,
      v_mtran_ref_no            VARCHAR2 DEFAULT NULL
   );

   FUNCTION trans_voucher (v_code VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION get_chq_status (
      v_vchrno      IN   NUMBER,
      v_claim_no    IN   VARCHAR2,
      v_pymt_type   IN   VARCHAR2
   )
      RETURN VARCHAR2;

   PROCEDURE cancel_chq_payment (v_trans_no IN NUMBER);

   PROCEDURE clm_chq_contra_vchr (
      v_clmrg_claim_no   VARCHAR2,
      v_trans_no         NUMBER,
      v_user_name        VARCHAR2
   );

   FUNCTION account_enabled (
      v_bbr_code    NUMBER,
      v_raise_err   VARCHAR2 DEFAULT 'Y'
   )
      RETURN VARCHAR2;

   FUNCTION bnk_account (naccno NUMBER, ntype NUMBER)
      RETURN VARCHAR2;

   FUNCTION bnk_bbr_code (naccno NUMBER, ntype NUMBER)
      RETURN NUMBER;

   PROCEDURE prc_com_pymt (
      v_cop_code     VARCHAR2,
      v_trans_no     NUMBER,
      v_user_name    VARCHAR2,
      v_pay_method   VARCHAR2 DEFAULT 'CHQ'
   );

   PROCEDURE post_xol (
      v_trans_no         NUMBER,
      v_user_name        VARCHAR2,
      v_auth_date   IN   DATE DEFAULT TRUNC (SYSDATE)
   );

   PROCEDURE post_update (
      v_cqr_ref      IN   VARCHAR2,
      v_cqr_ref2     IN   VARCHAR2,
      v_cqr_chq_no   IN   VARCHAR2,
      v_cqr_chq_dt   IN   DATE,
      v_user_name    IN   VARCHAR2,
      v_pmt_type     IN   VARCHAR2,
      v_cqr_amount   IN   NUMBER,
      v_status       IN   VARCHAR2 DEFAULT NULL,
      v_reverse      IN   VARCHAR2 DEFAULT 'N'
   );

   PROCEDURE treaty_auth (
      v_as_code   IN       NUMBER,
      v_user      IN       VARCHAR,
      v_error     OUT      VARCHAR2
   );

    PROCEDURE process_svy_pymt25042016 (
      v_pofe_no      VARCHAR2,
      v_trans_no     NUMBER,
      v_user_name    VARCHAR2,
      v_pay_method   VARCHAR2 DEFAULT 'CHQ',
      v_sur_val      VARCHAR2 DEFAULT 'SUR'
   );

   PROCEDURE process_survey_pymt (
      v_pofe_no      VARCHAR2,
      v_trans_no     NUMBER,
      v_user_name    VARCHAR2,
      v_pay_method   VARCHAR2 DEFAULT 'CHQ',
      v_sur_val      VARCHAR2 DEFAULT 'SUR'
   );


   FUNCTION mobile_no (naccno NUMBER, ntype NUMBER)
      RETURN VARCHAR2;

   FUNCTION payee_id (naccno NUMBER, ntype NUMBER)
      RETURN VARCHAR2;

   FUNCTION mobile_service_provider (v_mobile_no IN VARCHAR2)
      RETURN NUMBER;

   PROCEDURE post_fms_jvs (
      v_jv_ref_no         IN       VARCHAR2,
      v_jv_other_ref_no   IN       VARCHAR2,
      v_jv_date           IN       DATE,
      v_jv_acc            IN       VARCHAR2,
      v_jv_acc_type       IN       VARCHAR2,
      v_jv_cur_code       IN       NUMBER,
      v_jv_brn_code       IN       NUMBER,
      v_jv_narrations     IN       VARCHAR2,
      v_user              IN       VARCHAR2,
      v_jv_amt            IN       NUMBER,
      v_mtran_no          OUT      NUMBER
   );

--  PROCEDURE process_survey_pymt (
--      v_pofe_no   VARCHAR2,
--      v_trans_no         NUMBER,
--      v_user_name        VARCHAR2,
--      v_pay_method       VARCHAR2 DEFAULT 'CHQ',
--      v_desc VARCHAR2
   --);
   PROCEDURE post_xol_premadj (
      v_trans_no         NUMBER,
      v_user_name        VARCHAR2,
      v_auth_date   IN   DATE DEFAULT TRUNC (SYSDATE)
   );

   PROCEDURE process_trvl_pymt (
      v_trans_no     NUMBER,
      v_user_name    VARCHAR2,
      v_pay_method   VARCHAR2 DEFAULT 'CHQ',
      v_desc         VARCHAR2
   );

   PROCEDURE prc_coin_pymt (
      v_coinp_code   VARCHAR2,
      v_trans_no     NUMBER,
      v_user_name    VARCHAR2,
      v_pay_method   VARCHAR2 DEFAULT 'CHQ'
   );

   PROCEDURE process_pool_pymt (
      v_prprd_code   NUMBER,
      v_user_name    VARCHAR2,
      v_pay_method   VARCHAR2 DEFAULT 'CHQ'
   );

   PROCEDURE prc_com_pymt (
      v_copdt_code   NUMBER,
      v_user_name    VARCHAR2,
      v_pay_method   VARCHAR2                                -- DEFAULT 'CHQ'
   );

   PROCEDURE update_refunds (
      v_cqr_ref      IN   VARCHAR2,
      v_cqr_ref2     IN   VARCHAR2,
      v_cqr_chq_no   IN   VARCHAR2,
      v_cqr_chq_dt   IN   DATE,
      v_user_name    IN   VARCHAR2,
      v_cqr_amount   IN   NUMBER
   );

   PROCEDURE update_cancl_refunds (
      v_cqr_ref      IN   VARCHAR2,
      v_cqr_ref2     IN   VARCHAR2,
      v_cqr_chq_no   IN   VARCHAR2,
      v_cqr_chq_dt   IN   DATE,
      v_user_name    IN   VARCHAR2,
      v_cqr_amount   IN   NUMBER,
      v_status       IN   VARCHAR2
   );

   PROCEDURE auth_mdp_payment (v_xp_code IN NUMBER, v_user_name IN VARCHAR2);

   PROCEDURE contra_claim_pymnt (
      v_voucher_no   IN   VARCHAR2,
      v_claim_no     IN   VARCHAR2,
      v_user         IN   VARCHAR2
   );

   PROCEDURE get_gl_acct_code (
      v_trnt_type             IN       VARCHAR2,
      v_scl_code              IN       NUMBER,
      v_app_lvl               IN       VARCHAR2,
      v_btr_trans_code        IN       VARCHAR2,
      v_frgn_or_local         IN       VARCHAR2,
      ---F for foreign and L for Local
      v_trnt_code             OUT      VARCHAR2,
      v_trnt_gl_code          OUT      VARCHAR2,
      v_trnt_contra_gl_code   OUT      VARCHAR2,
      v_trnt_code_in IN VARCHAR2 DEFAULT NULL
   );

     -- PROCEDURE process_mdp_payment (v_xp_code IN NUMBER, v_user_name IN VARCHAR2, v_premType IN VARCHAR2);
     PROCEDURE process_mdp_payment (v_xp_code IN NUMBER, v_user_name IN VARCHAR2, v_premType IN VARCHAR2);

   PROCEDURE update_mdp (
      v_cqr_ref      IN   VARCHAR2,
      v_cqr_ref2     IN   VARCHAR2,
      v_cqr_chq_no   IN   VARCHAR2,
      v_cqr_chq_dt   IN   DATE,
      v_user_name    IN   VARCHAR2,
      v_cqr_amount   IN   NUMBER
   );

   PROCEDURE authorisegispayments (v_ref IN VARCHAR2, v_user_code IN NUMBER);

   FUNCTION getpolicybatchno (v_drcr_no VARCHAR2)
      RETURN NUMBER;

   FUNCTION check_if_transmital_full (v_pol_batch_no NUMBER)
      RETURN VARCHAR2;

   PROCEDURE prc_servproviders_pymts (
      v_cptv_code    VARCHAR2,
      v_user_name    VARCHAR2,
      v_pay_method   VARCHAR2 DEFAULT 'EFT'
   );

   PROCEDURE update_certificates (
      v_cqr_ref      IN   VARCHAR2,
      v_cqr_ref2     IN   VARCHAR2,
      v_cqr_chq_no   IN   VARCHAR2,
      v_cqr_chq_dt   IN   DATE,
      v_user_name    IN   VARCHAR2,
      v_cqr_amount   IN   NUMBER
   );

   PROCEDURE update_undo_certificates (
      v_cqr_ref      IN   VARCHAR2,
      v_cqr_ref2     IN   VARCHAR2,
      v_cqr_chq_no   IN   VARCHAR2,
      v_cqr_chq_dt   IN   DATE,
      v_user_name    IN   VARCHAR2,
      v_cqr_amount   IN   NUMBER
   );

   PROCEDURE process_claim_pymt_file (
      v_clp_code     IN   NUMBER,
      v_user_name         VARCHAR2,
      v_pay_method        VARCHAR2 DEFAULT 'CHQ'
   );

   PROCEDURE update_whtax (
      v_cqr_ref      IN   VARCHAR2,
      v_cqr_ref2     IN   VARCHAR2,
      v_cqr_chq_no   IN   VARCHAR2,
      v_cqr_chq_dt   IN   DATE,
      v_user_name    IN   VARCHAR2,
      v_cqr_amount   IN   NUMBER
   );

   PROCEDURE update_undo_whtax (
      v_cqr_ref      IN   VARCHAR2,
      v_cqr_ref2     IN   VARCHAR2,
      v_cqr_chq_no   IN   VARCHAR2,
      v_cqr_chq_dt   IN   DATE,
      v_user_name    IN   VARCHAR2,
      v_cqr_amount   IN   NUMBER
   );

   PROCEDURE process_tax_pyments (
      v_vap_code     NUMBER,
      v_user_name    VARCHAR2,
      v_spr_code     NUMBER,
      v_pay_method   VARCHAR2 DEFAULT 'CHQ',
      v_type         VARCHAR2
   );

   PROCEDURE update_coin (
      v_cqr_ref      IN   VARCHAR2,
      v_cqr_ref2     IN   VARCHAR2,
      v_cqr_chq_no   IN   VARCHAR2,
      v_cqr_chq_dt   IN   DATE,
      v_user_name    IN   VARCHAR2,
      v_cqr_amount   IN   NUMBER
   );

   PROCEDURE update_cancl_coin (
      v_cqr_ref      IN   VARCHAR2,
      v_cqr_ref2     IN   VARCHAR2,
      v_cqr_chq_no   IN   VARCHAR2,
      v_cqr_chq_dt   IN   DATE,
      v_user_name    IN   VARCHAR2,
      v_cqr_amount   IN   NUMBER
   );

   PROCEDURE process_clm_fee_pymt (
      v_clmrg_claim_no   VARCHAR2,
      v_trans_no         NUMBER,
      v_user_name        VARCHAR2,
      v_pay_method       VARCHAR2 DEFAULT 'EFT',
      v_from_dt          DATE,
      v_to_dt            DATE
   );

   PROCEDURE update_commissions (
      v_cqr_ref      IN   VARCHAR2,
      v_cqr_ref2     IN   VARCHAR2,
      v_cqr_chq_no   IN   VARCHAR2,
      v_cqr_chq_dt   IN   DATE,
      v_user_name    IN   VARCHAR2,
      v_cqr_amount   IN   NUMBER
   );

   PROCEDURE update_undo_commissions (
      v_cqr_ref      IN   VARCHAR2,
      v_cqr_ref2     IN   VARCHAR2,
      v_cqr_chq_no   IN   VARCHAR2,
      v_cqr_chq_dt   IN   DATE,
      v_user_name    IN   VARCHAR2,
      v_cqr_amount   IN   NUMBER
   );

   PROCEDURE prc_wthtax_pymt (
      v_withtp_code   VARCHAR2,
      v_user_name     VARCHAR2,
      v_pay_method    VARCHAR2 DEFAULT 'CHQ'
   );

   FUNCTION cash_trans_alloc (v_rct_code NUMBER)
      RETURN VARCHAR2;

   FUNCTION validate_transmittal (v_barcode_no IN VARCHAR2)
      RETURN NUMBER;

   PROCEDURE update_transmittal_rct (v_pol_batch_no   IN NUMBER,
                                     v_rct_amt        IN NUMBER,
                                     v_cancel_rct     IN VARCHAR2,
                                     v_rct_type       IN VARCHAR2);

   PROCEDURE update_canc_mdp (
      v_cqr_ref      IN   VARCHAR2,
      v_cqr_ref2     IN   VARCHAR2,
      v_cqr_chq_no   IN   VARCHAR2,
      v_cqr_chq_dt   IN   DATE,
      v_user_name    IN   VARCHAR2,
      v_cqr_amount   IN   NUMBER
   );
   PROCEDURE update_tax_remmittance (
   v_cqr_ref      IN   VARCHAR2,
   v_cqr_ref2     IN   VARCHAR2,
   v_cqr_chq_no   IN   VARCHAR2,
   v_cqr_chq_dt   IN   DATE,
   v_user_name    IN   VARCHAR2,
   v_cqr_amount   IN   NUMBER
);
PROCEDURE prc_cashback_pymt (
      v_CASHP_CODE   VARCHAR2,
      v_trans_no     NUMBER,
      v_user_name    VARCHAR2,
      v_pay_method   VARCHAR2 DEFAULT 'CHQ'
   );
PROCEDURE process_survey_cheque_payment (
  v_pofe_no      VARCHAR2,
  v_trans_no     NUMBER,
  v_user_name    VARCHAR2,
  v_pay_method   VARCHAR2 DEFAULT 'CHQ',
  v_sur_val      VARCHAR2 DEFAULT 'SUR'
);
PROCEDURE process_survey_eftrtgs_payment (
  v_pofe_no      VARCHAR2,
  v_trans_no     NUMBER,
  v_user_name    VARCHAR2,
  v_pay_method   VARCHAR2 DEFAULT 'EFT',
  v_sur_val      VARCHAR2 DEFAULT 'SUR'
);
PROCEDURE process_survey_mobile_payment (
  v_pofe_no      VARCHAR2,
  v_trans_no     NUMBER,
  v_user_name    VARCHAR2,
  v_pay_method   VARCHAR2 DEFAULT 'MOB',
  v_sur_val      VARCHAR2 DEFAULT 'SUR'
);
PROCEDURE process_survey_credit_payment (
  v_pofe_no      VARCHAR2,
  v_trans_no     NUMBER,
  v_user_name    VARCHAR2,
  v_pay_method   VARCHAR2 DEFAULT 'CR',
  v_sur_val      VARCHAR2 DEFAULT 'SUR'
);

PROCEDURE post_service_credit_payments (
  v_pofe_no      IN       VARCHAR2,
  v_trans_no     IN       NUMBER,
  v_user_name             VARCHAR2,
  v_rein_trans   IN       VARCHAR2 DEFAULT 'N'
);

PROCEDURE process_survey_journal_payment (
  v_pofe_no      VARCHAR2,
  v_trans_no     NUMBER,
  v_user_name    VARCHAR2,
  v_pay_method   VARCHAR2 DEFAULT 'JE',
  v_sur_val      VARCHAR2 DEFAULT 'SUR'
);
   PROCEDURE post_survey_jvs_payments (
      v_pofe_no      VARCHAR2,
      v_trans_no     NUMBER,
      v_user_name    VARCHAR2,
      v_pay_method   VARCHAR2 DEFAULT 'JE',
      v_sur_val      VARCHAR2 DEFAULT 'SUR'
   );
   
   PROCEDURE claim_xol_pymt_postings (
   v_clmrg_claim_no   VARCHAR2,
   v_trans_no         NUMBER,
   v_user_name        VARCHAR2
);

     PROCEDURE process_clm_pymt_xol (
      v_clmrg_claim_no        VARCHAR2,
      v_trans_no              NUMBER,
      v_user_name             VARCHAR2,
      v_auth_date        IN   DATE DEFAULT TRUNC (SYSDATE)
   );
   
    PROCEDURE cancel_mdp_chq_payment (v_trans_no IN NUMBER,v_username in varchar2);
    procedure rejectmdptransfromfms(v_trans_no in number);
   
END;
 
/
