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
 * File			: ProductDto.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241017153255][whslsl88#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.product.dto;

/**
 * @version 1.0.0
 * @author whslsl88#gmail.com
 * 
 * @since 2024-10-17
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class ProductDto {
	
	private int rnum				= 0;
	private int seq_sle			= 0;
	private String sle_nm			= "";	// 판매 상품명
	private String img				= "";	// 판매 상품 이미
	private int price_sale			= 0;	// 판매 상품 가격
	private String desces			= "";	// 판매 상품 상세설명(이미지)
	private String cd_ctg_b			= "";	// 중분류
	private String cd_ctg_m			= "";	// 대분류
	private String cd_state_sale	= "";	// 판매 상품 상태
	private String prd_type			= "";	// 판매 상품 섭취 타입
	private int count_stock		= 0;	// 재고
	private String corp_nm			= "";	// 판매 상품 브랜드
	private String flg_delete		= "";	// 삭제 처리 여부'N'
	private String dt_sale_start	= "";	// 판매 시작일
	private String dt_sale_end		= "";	// 판매 종료일
	private int discount			= 0;	// 할인율
	private String dt_reg			= "";	// 등록일
	private int register			= 0;	// 등록자(관리자)
	private int point_stack		= 0;	// 포인트 적립률
	private String dt_upt			= "";	// 수정일
	private int updater			= 0;	// 수정자
	private int origin_sale		= 0;	// 상품 원가
	private int margin_rate		= 0;	// 마진률
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getPrice_sale() {
		return price_sale;
	}
	public void setPrice_sale(int price_sale) {
		this.price_sale = price_sale;
	}
	public String getDesces() {
		return desces;
	}
	public void setDesces(String desces) {
		this.desces = desces;
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
	public String getCd_state_sale() {
		return cd_state_sale;
	}
	public void setCd_state_sale(String cd_state_sale) {
		this.cd_state_sale = cd_state_sale;
	}
	public String getPrd_type() {
		return prd_type;
	}
	public void setPrd_type(String prd_type) {
		this.prd_type = prd_type;
	}
	public int getCount_stock() {
		return count_stock;
	}
	public void setCount_stock(int count_stock) {
		this.count_stock = count_stock;
	}
	public String getCorp_nm() {
		return corp_nm;
	}
	public void setCorp_nm(String corp_nm) {
		this.corp_nm = corp_nm;
	}
	public String getFlg_delete() {
		return flg_delete;
	}
	public void setFlg_delete(String flg_delete) {
		this.flg_delete = flg_delete;
	}
	public String getDt_sale_start() {
		return dt_sale_start;
	}
	public void setDt_sale_start(String dt_sale_start) {
		this.dt_sale_start = dt_sale_start;
	}
	public String getDt_sale_end() {
		return dt_sale_end;
	}
	public void setDt_sale_end(String dt_sale_end) {
		this.dt_sale_end = dt_sale_end;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
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
	public int getPoint_stack() {
		return point_stack;
	}
	public void setPoint_stack(int point_stack) {
		this.point_stack = point_stack;
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
	public int getOrigin_sale() {
		return origin_sale;
	}
	public void setOrigin_sale(int origin_sale) {
		this.origin_sale = origin_sale;
	}
	public int getMargin_rate() {
		return margin_rate;
	}
	public void setMargin_rate(int margin_rate) {
		this.margin_rate = margin_rate;
	}
}