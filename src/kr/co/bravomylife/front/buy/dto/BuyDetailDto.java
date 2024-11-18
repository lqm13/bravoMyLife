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
 * File			: BuyDetailDto.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241003231502][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.buy.dto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-03
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class BuyDetailDto {
	
	private int seq_buy_dtl					= 0;
	private int seq_buy_mst					= 0;
	private int seq_sle						= 0;
	private String deal_num					= "";
	private int count						= 0;
	private int price						= 0;
	private String dt_reg					= "";
	private String dt_upt					= "";
	private int register					= 0;
	private String sle_nm					= "";
	private int point						= 0;
	private int total_price_sum				= 0;
	private int total_point_sum				= 0;
	private String format_total_price		= "";
	private String format_total_point		= "";
	private int seq_mbr						= 0;
	private int seq_best					= 0;
	private int seq_best_dtl				= 0;
	private int total_price					= 0;
	private int seq_pay						= 0;
	
	
	private int rnum						= 0;
	private String cd_state					= "";
	private String cd_state_pay				= "";
	private String cd_state_delivery		= "";
	private String img						= "";
	private int discount					= 0;
	private int discount_sale				= 0;
	private String cd_ctg_b					= "";
	private String cd_ctg_m					= "";
	private String flg_delete				= "";
	private int point_stack					= 0;
	private int price_sale					= 0;
	private int seq_mbr_addr			= 0;
	
	
	public String getDt_upt() {
		return dt_upt;
	}
	public void setDt_upt(String dt_upt) {
		this.dt_upt = dt_upt;
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
	public int getSeq_mbr_addr() {
		return seq_mbr_addr;
	}
	public void setSeq_mbr_addr(int seq_mbr_addr) {
		this.seq_mbr_addr = seq_mbr_addr;
	}
	public int getSeq_best() {
		return seq_best;
	}
	public void setSeq_best(int seq_best) {
		this.seq_best = seq_best;
	}
	public int getSeq_best_dtl() {
		return seq_best_dtl;
	}
	public void setSeq_best_dtl(int seq_best_dtl) {
		this.seq_best_dtl = seq_best_dtl;
	}
	public int getPrice_sale() {
		return price_sale;
	}
	public void setPrice_sale(int price_sale) {
		this.price_sale = price_sale;
	}
	public int getPoint_stack() {
		return point_stack;
	}
	public void setPoint_stack(int point_stack) {
		this.point_stack = point_stack;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getDiscount_sale() {
		return discount_sale;
	}
	public void setDiscount_sale(int discount_sale) {
		this.discount_sale = discount_sale;
	}
	public String getCd_ctg_b() {
		return cd_ctg_b;
	}
	public void setCd_ctg_b(String cd_ctg_b) {
		this.cd_ctg_b = cd_ctg_b;
	}
	public String getCd_ctg_m() {
		return cd_ctg_m;
	}
	public void setCd_ctg_m(String cd_ctg_m) {
		this.cd_ctg_m = cd_ctg_m;
	}
	public String getFlg_delete() {
		return flg_delete;
	}
	public void setFlg_delete(String flg_delete) {
		this.flg_delete = flg_delete;
	}
	public int getSeq_mbr() {
		return seq_mbr;
	}
	public void setSeq_mbr(int seq_mbr) {
		this.seq_mbr = seq_mbr;
	}
	public String getDeal_num() {
		return deal_num;
	}
	public void setDeal_num(String deal_num) {
		this.deal_num = deal_num;
	}
	public int getSeq_buy_dtl() {
		return seq_buy_dtl;
	}
	public void setSeq_buy_dtl(int seq_buy_dtl) {
		this.seq_buy_dtl = seq_buy_dtl;
	}
	public int getSeq_buy_mst() {
		return seq_buy_mst;
	}
	public void setSeq_buy_mst(int seq_buy_mst) {
		this.seq_buy_mst = seq_buy_mst;
	}
	public int getSeq_sle() {
		return seq_sle;
	}
	public void setSeq_sle(int seq_sle) {
		this.seq_sle = seq_sle;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
	public String getSle_nm() {
		return sle_nm;
	}
	public void setSle_nm(String sle_nm) {
		this.sle_nm = sle_nm;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getTotal_price_sum() {
		return total_price_sum;
	}
	public void setTotal_price_sum(int total_price_sum) {
		this.total_price_sum = total_price_sum;
	}
	public int getTotal_point_sum() {
		return total_point_sum;
	}
	public void setTotal_point_sum(int total_point_sum) {
		this.total_point_sum = total_point_sum;
	}
	public String getFormat_total_price() {
		return format_total_price;
	}
	public void setFormat_total_price(String format_total_price) {
		this.format_total_price = format_total_price;
	}
	public String getFormat_total_point() {
		return format_total_point;
	}
	public void setFormat_total_point(String format_total_point) {
		this.format_total_point = format_total_point;
	}
}