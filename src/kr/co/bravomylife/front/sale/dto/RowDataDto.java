/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: RowDataDto.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241025133935][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.sale.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-25
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class RowDataDto {
	
	@JsonProperty("PRDLST_REPORT_NO")
	private String prdlst_report_no;
	
	@JsonProperty("SHAP")
	private String shap;
	
	@JsonProperty("PRMS_DT")
	private String prms_dt;
	
	@JsonProperty("LAST_UPDT_DTM")
	private String last_updt_dtm;
	
	@JsonProperty("PRDT_SHAP_CD_NM")
	private String prdt_shap_cd_nm;
	
	@JsonProperty("LCNS_NO")
	private String lcns_no;
	
	@JsonProperty("CRET_DTM")
	private String cret_dtm;
	
	@JsonProperty("PRDLST_NM")
	private String prdlst_nm;
	
	@JsonProperty("IFTKN_ATNT_MATR_CN")
	private String iftkn_atnt_matr_cn;
	
	@JsonProperty("BSSH_NM")
	private String bssh_nm;
	
	@JsonProperty("STDR_STND")
	private String stdr_stnd;
	
	@JsonProperty("DISPOS")
	private String dispos;
	
	@JsonProperty("PRIMARY_FNCLTY")
	private String primary_fnclty;
	
	@JsonProperty("POG_DAYCNT")
	private String pog_daycnt;
	
	@JsonProperty("CSTDY_MTHD")
	private String cstdy_mthd;
	
	@JsonProperty("NTK_MTHD")
	private String ntk_mthd;
	
	@JsonProperty("RAWMTRL_NM")
	private String rawmtrl_nm;
	
	
	public String getPrdlst_report_no() {
		return prdlst_report_no;
	}
	public void setPrdlst_report_no(String prdlst_report_no) {
		this.prdlst_report_no = prdlst_report_no;
	}
	public String getShap() {
		return shap;
	}
	public void setShap(String shap) {
		this.shap = shap;
	}
	public String getPrms_dt() {
		return prms_dt;
	}
	public void setPrms_dt(String prms_dt) {
		this.prms_dt = prms_dt;
	}
	public String getLast_updt_dtm() {
		return last_updt_dtm;
	}
	public void setLast_updt_dtm(String last_updt_dtm) {
		this.last_updt_dtm = last_updt_dtm;
	}
	public String getPrdt_shap_cd_nm() {
		return prdt_shap_cd_nm;
	}
	public void setPrdt_shap_cd_nm(String prdt_shap_cd_nm) {
		this.prdt_shap_cd_nm = prdt_shap_cd_nm;
	}
	public String getLcns_no() {
		return lcns_no;
	}
	public void setLcns_no(String lcns_no) {
		this.lcns_no = lcns_no;
	}
	public String getCret_dtm() {
		return cret_dtm;
	}
	public void setCret_dtm(String cret_dtm) {
		this.cret_dtm = cret_dtm;
	}
	public String getPrdlst_nm() {
		return prdlst_nm;
	}
	public void setPrdlst_nm(String prdlst_nm) {
		this.prdlst_nm = prdlst_nm;
	}
	public String getIftkn_atnt_matr_cn() {
		return iftkn_atnt_matr_cn;
	}
	public void setIftkn_atnt_matr_cn(String iftkn_atnt_matr_cn) {
		this.iftkn_atnt_matr_cn = iftkn_atnt_matr_cn;
	}
	public String getBssh_nm() {
		return bssh_nm;
	}
	public void setBssh_nm(String bssh_nm) {
		this.bssh_nm = bssh_nm;
	}
	public String getStdr_stnd() {
		return stdr_stnd;
	}
	public void setStdr_stnd(String stdr_stnd) {
		this.stdr_stnd = stdr_stnd;
	}
	public String getDispos() {
		return dispos;
	}
	public void setDispos(String dispos) {
		this.dispos = dispos;
	}
	public String getPrimary_fnclty() {
		return primary_fnclty;
	}
	public void setPrimary_fnclty(String primary_fnclty) {
		this.primary_fnclty = primary_fnclty;
	}
	public String getPog_daycnt() {
		return pog_daycnt;
	}
	public void setPog_daycnt(String pog_daycnt) {
		this.pog_daycnt = pog_daycnt;
	}
	public String getCstdy_mthd() {
		return cstdy_mthd;
	}
	public void setCstdy_mthd(String cstdy_mthd) {
		this.cstdy_mthd = cstdy_mthd;
	}
	public String getNtk_mthd() {
		return ntk_mthd;
	}
	public void setNtk_mthd(String ntk_mthd) {
		this.ntk_mthd = ntk_mthd;
	}
	public String getRawmtrl_nm() {
		return rawmtrl_nm;
	}
	public void setRawmtrl_nm(String rawmtrl_nm) {
		this.rawmtrl_nm = rawmtrl_nm;
	}
}
