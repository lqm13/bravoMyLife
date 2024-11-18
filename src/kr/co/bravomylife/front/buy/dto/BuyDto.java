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
 * File			: BuyDto.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241003231441][cydgate4957@gmail.com][CREATE: Initial Release]
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
public class BuyDto {
	
	private int seq_buy_mst					= 0;
	private int seq_mbr						= 0;
	private String buy_info					= "";
	private int buy_count					= 0;
	private int buy_price					= 0;
	private String flg_delete				= "";
	private String cd_state_pay				= "";
	private String cd_state_delivery		= "";
	private String dt_reg					= "";
	private int register					= 0;
	private String dt_upt					= "";
	private int updater						= 0;
	private int seq_mbr_addr				= 0;
	private int seq_sle						= 0;
	private int seq_buy_dtl					= 0;
	private String sle_nm					= "";
	private int count						= 0;
	private int price						= 0;
	private List<BuyDataDto> buyDatas		= null;
	private String img						= "";
	private String cd_state					= "";
	private int total_price					= 0;
	private int seq_pay						= 0;
	private String deal_num					= "";
	private int total_price_sum				= 0;
	
	
	public int getTotal_price_sum() {
		return total_price_sum;
	}
	public void setTotal_price_sum(int total_price_sum) {
		this.total_price_sum = total_price_sum;
	}
	public String getDeal_num() {
		return deal_num;
	}
	public void setDeal_num(String deal_num) {
		this.deal_num = deal_num;
	}
	public int getSeq_pay() {
		return seq_pay;
	}
	public void setSeq_pay(int seq_pay) {
		this.seq_pay = seq_pay;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getCd_state() {
		return cd_state;
	}
	public void setCd_state(String cd_state) {
		this.cd_state = cd_state;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public List<BuyDataDto> getBuyDatas() {
		return buyDatas;
	}
	public void setBuyDatas(List<BuyDataDto> buyDatas) {
		this.buyDatas = buyDatas;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSeq_sle() {
		return seq_sle;
	}
	public void setSeq_sle(int seq_sle) {
		this.seq_sle = seq_sle;
	}
	public int getSeq_buy_dtl() {
		return seq_buy_dtl;
	}
	public void setSeq_buy_dtl(int seq_buy_dtl) {
		this.seq_buy_dtl = seq_buy_dtl;
	}
	public String getSle_nm() {
		return sle_nm;
	}
	public void setSle_nm(String sle_nm) {
		this.sle_nm = sle_nm;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getSeq_mbr_addr() {
		return seq_mbr_addr;
	}
	public void setSeq_mbr_addr(int seq_mbr_addr) {
		this.seq_mbr_addr = seq_mbr_addr;
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