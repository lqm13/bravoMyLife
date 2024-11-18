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
 * File			: BasketDto.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241009230007][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.basket.dto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-09
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class BasketDto {

	private int seq_bsk					= 0;
	private int seq_mbr					= 0;
	private int seq_sle					= 0;
	private String sle_nm				= "";
	private int price					= 0;
	private int count					= 0;
	private int point_stack				= 0;
	private int total_price				= 0;
	private int total_point				= 0;
	private int price_sale				= 0;
	private String img					= "";
	private String dt_reg				= "";
	private String dt_upt				= "";
	private String cd_ctg_m				= "";
	private String cd_ctg_b				= "";
	private String format_total_price	= "";
	private String format_total_point	= "";
	private int seq_sle_count			= 0;
	private int total_price_sum			= 0;
	private int total_point_sum			= 0;
	private int point_value				= 0;
	private int discount				= 0;
	private int discount_sale			= 0;
	
	
	public int getDiscount_sale() {
		return discount_sale;
	}
	public void setDiscount_sale(int discount_sale) {
		this.discount_sale = discount_sale;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getPrice_sale() {
		return price_sale;
	}
	public void setPrice_sale(int price_sale) {
		this.price_sale = price_sale;
	}
	public int getPoint_value() {
		return point_value;
	}
	public void setPoint_value(int point_value) {
		this.point_value = point_value;
	}
	public String getFormat_total_point() {
		return format_total_point;
	}
	public void setFormat_total_point(String format_total_point) {
		this.format_total_point = format_total_point;
	}
	public int getTotal_point_sum() {
		return total_point_sum;
	}
	public void setTotal_point_sum(int total_point_sum) {
		this.total_point_sum = total_point_sum;
	}
	public int getSeq_sle_count() {
		return seq_sle_count;
	}
	public void setSeq_sle_count(int seq_sle_count) {
		this.seq_sle_count = seq_sle_count;
	}
	public int getTotal_price_sum() {
		return total_price_sum;
	}
	public void setTotal_price_sum(int total_price_sum) {
		this.total_price_sum = total_price_sum;
	}
	public int getPoint_stack() {
		return point_stack;
	}
	public void setPoint_stack(int point_stack) {
		this.point_stack = point_stack;
	}
	public String getFormat_total_price() {
		return format_total_price;
	}
	public void setFormat_total_price(String format_total_price) {
		this.format_total_price = format_total_price;
	}
	public int getTotal_point() {
		return total_point;
	}
	public void setTotal_point(int total_point) {
		this.total_point = total_point;
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
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getSeq_bsk() {
		return seq_bsk;
	}
	public void setSeq_bsk(int seq_bsk) {
		this.seq_bsk = seq_bsk;
	}
	public int getSeq_mbr() {
		return seq_mbr;
	}
	public void setSeq_mbr(int seq_mbr) {
		this.seq_mbr = seq_mbr;
	}
	public int getSeq_sle() {
		return seq_sle;
	}
	public void setSeq_sle(int seq_sle) {
		this.seq_sle = seq_sle;
	}
	public String getSle_nm() {
		return sle_nm;
	}
	public void setSle_nm(String sle_nm) {
		this.sle_nm = sle_nm;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getDt_reg() {
		return dt_reg;
	}
	public void setDt_reg(String dt_reg) {
		this.dt_reg = dt_reg;
	}
	public String getDt_upt() {
		return dt_upt;
	}
	public void setDt_upt(String dt_upt) {
		this.dt_upt = dt_upt;
	}
}