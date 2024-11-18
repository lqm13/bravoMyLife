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
 *				: [20241003231514][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.buy.dto;

import java.util.List;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-03
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class BuyMasterDto {
	
	private int rnum						= 0;
	private int seq_buy_mst					= 0;
	private int seq_mbr						= 0;
	private String buy_info					= "";
	private int buy_count					= 0;
	private int buy_price					= 0;
	private String flg_delete				= "";
	private String cd_state_pay				= ""; //결제상태코드:결제전(NULL), 실패(N), 성공(Y), 취소(C)
	private String cd_state_delivery		= ""; //배송상태코드:등록(NULL), 확인중(C), 배송준비중(P), 배송중(D), 배송완료(Y)
	private String dt_reg					= "";
	private int register					= 0;
	private String dt_upt					= "";
	private int updater						= 0;
	private int total_point					= 0;
	private int use_point					= 0;
	private int seq_mbr_addr				= 0;
	private String delivery_request			= "";
	private List<BuyDataDto> buyDatas		= null;
	private int seq_sle						= 0;
	private String cd_ctg_m					= "";
	private String cd_ctg_b					= "";
	private String cd_state					= "";
	private String earliest_date			= "";
	private String latest_date				= "";
	private int mst_count					= 0;
	private int total_use_point				= 0;
	
	
	private int cd_state_total_2			= 0;
	private int cd_state_total_3			= 0;
	private int cd_state_total_4			= 0;
	private int delivery_total_c			= 0;
	private int delivery_total_p			= 0;
	private int delivery_total_d			= 0;
	private int delivery_total_y			= 0;
	
	
	public String getEarliest_date() {
		return earliest_date;
	}
	public void setEarliest_date(String earliest_date) {
		this.earliest_date = earliest_date;
	}
	public String getLatest_date() {
		return latest_date;
	}
	public void setLatest_date(String latest_date) {
		this.latest_date = latest_date;
	}
	public int getMst_count() {
		return mst_count;
	}
	public void setMst_count(int mst_count) {
		this.mst_count = mst_count;
	}
	public int getTotal_use_point() {
		return total_use_point;
	}
	public void setTotal_use_point(int total_use_point) {
		this.total_use_point = total_use_point;
	}
	public String getCd_state() {
		return cd_state;
	}
	public void setCd_state(String cd_state) {
		this.cd_state = cd_state;
	}
	public int getCd_state_total_2() {
		return cd_state_total_2;
	}
	public void setCd_state_total_2(int cd_state_total_2) {
		this.cd_state_total_2 = cd_state_total_2;
	}
	public int getCd_state_total_3() {
		return cd_state_total_3;
	}
	public void setCd_state_total_3(int cd_state_total_3) {
		this.cd_state_total_3 = cd_state_total_3;
	}
	public int getCd_state_total_4() {
		return cd_state_total_4;
	}
	public void setCd_state_total_4(int cd_state_total_4) {
		this.cd_state_total_4 = cd_state_total_4;
	}
	public int getDelivery_total_c() {
		return delivery_total_c;
	}
	public void setDelivery_total_c(int delivery_total_c) {
		this.delivery_total_c = delivery_total_c;
	}
	public int getDelivery_total_p() {
		return delivery_total_p;
	}
	public void setDelivery_total_p(int delivery_total_p) {
		this.delivery_total_p = delivery_total_p;
	}
	public int getDelivery_total_d() {
		return delivery_total_d;
	}
	public void setDelivery_total_d(int delivery_total_d) {
		this.delivery_total_d = delivery_total_d;
	}
	public int getDelivery_total_y() {
		return delivery_total_y;
	}
	public void setDelivery_total_y(int delivery_total_y) {
		this.delivery_total_y = delivery_total_y;
	}
	public String getCd_ctg_m() {
		return cd_ctg_m;
	}
	public void setCd_ctg_m(String cd_ctg_m) {
		this.cd_ctg_m = cd_ctg_m;
	}
	public String getCd_ctg_b() {
		return cd_ctg_b;
	}
	public void setCd_ctg_b(String cd_ctg_b) {
		this.cd_ctg_b = cd_ctg_b;
	}
	public int getSeq_sle() {
		return seq_sle;
	}
	public void setSeq_sle(int seq_sle) {
		this.seq_sle = seq_sle;
	}
	public List<BuyDataDto> getBuyDatas() {
		return buyDatas;
	}
	public void setBuyDatas(List<BuyDataDto> buyDatas) {
		this.buyDatas = buyDatas;
	}
	public String getDelivery_request() {
		return delivery_request;
	}
	public void setDelivery_request(String delivery_request) {
		this.delivery_request = delivery_request;
	}
	public int getSeq_mbr_addr() {
		return seq_mbr_addr;
	}
	public void setSeq_mbr_addr(int seq_mbr_addr) {
		this.seq_mbr_addr = seq_mbr_addr;
	}
	public int getUse_point() {
		return use_point;
	}
	public void setUse_point(int use_point) {
		this.use_point = use_point;
	}
	public int getTotal_point() {
		return total_point;
	}
	public void setTotal_point(int total_point) {
		this.total_point = total_point;
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
	public String getFlg_delete() {
		return flg_delete;
	}
	public void setFlg_delete(String flg_delete) {
		this.flg_delete = flg_delete;
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
}