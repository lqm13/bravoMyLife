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
 * File			: BuyMasterDto.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241024170013][alstjsrla28#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.buy.dto;

/**
 * @version 1.0.0
 * @author alstjsrla28#gmail.com
 * 
 * @since 2024-10-24
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class BuyMasterDto {
	
	private int rnum					= 0;
	private int seq_buy_mst				= 0;
	private int seq_mbr					= 0;
	private String buy_info				= "";
	private int buy_count				= 0;
	private int buy_price				= 0;
	private int buy_point				= 0;
	private String flg_delete			= "";
	private String cd_state				= ""; 
	private String cd_state_pay			= ""; //결제상태코드:결제전(NULL), 실패(N), 성공(Y), 취소(C)
	private String cd_state_delivery	= ""; //배송상태코드:등록(NULL), 확인중(C), 배송준비중(P), 배송중(D), 배송완료(Y)
	private String dt_reg				= "";
	private int register				= 0;
	private String dt_upt				= "";
	private int updater					= 0;
	private int use_point				= 0;
	private String 	email		= "";
	private String	mbr_nm		= "";
	
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMbr_nm() {
		return mbr_nm;
	}
	public void setMbr_nm(String mbr_nm) {
		this.mbr_nm = mbr_nm;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getSeq_buy_mst() {
		return seq_buy_mst;
	}
	public void setSeq_buy_mst(int seq_buy_mst) {
		this.seq_buy_mst = seq_buy_mst;
	}
	public int getSeq_mbr() {
		return seq_mbr;
	}
	public void setSeq_mbr(int seq_mbr) {
		this.seq_mbr = seq_mbr;
	}
	public String getBuy_info() {
		return buy_info;
	}
	public void setBuy_info(String buy_info) {
		this.buy_info = buy_info;
	}
	public int getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}
	public int getBuy_price() {
		return buy_price;
	}
	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}
	public int getBuy_point() {
		return buy_point;
	}
	public void setBuy_point(int buy_point) {
		this.buy_point = buy_point;
	}
	public String getFlg_delete() {
		return flg_delete;
	}
	public void setFlg_delete(String flg_delete) {
		this.flg_delete = flg_delete;
	}
	public String getCd_state() {
		return cd_state;
	}
	public void setCd_state(String cd_state) {
		this.cd_state = cd_state;
	}
	public String getCd_state_pay() {
		return cd_state_pay;
	}
	public void setCd_state_pay(String cd_state_pay) {
		this.cd_state_pay = cd_state_pay;
	}
	public String getCd_state_delivery() {
		return cd_state_delivery;
	}
	public void setCd_state_delivery(String cd_state_delivery) {
		this.cd_state_delivery = cd_state_delivery;
	}
	public String getDt_reg() {
		return dt_reg;
	}
	public void setDt_reg(String dt_reg) {
		this.dt_reg = dt_reg;
	}
	public int getRegister() {
		return register;
	}
	public void setRegister(int register) {
		this.register = register;
	}
	public String getDt_upt() {
		return dt_upt;
	}
	public void setDt_upt(String dt_upt) {
		this.dt_upt = dt_upt;
	}
	public int getUpdater() {
		return updater;
	}
	public void setUpdater(int updater) {
		this.updater = updater;
	}
	public int getUse_point() {
		return use_point;
	}
	public void setUse_point(int use_point) {
		this.use_point = use_point;
	}

	
	
}
