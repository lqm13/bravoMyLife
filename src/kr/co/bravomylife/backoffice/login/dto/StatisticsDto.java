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
 * File			: StatisticsDto.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241101100940][whslsl88#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.login.dto;

/**
 * @version 1.0.0
 * @author whslsl88#gmail.com
 * 
 * @since 2024-11-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class StatisticsDto {
	
	private int seq_buy_dtl		= 0;
	private int seq_buy_mst		= 0;
	private int seq_sle			= 0;
	private int price				= 0;
	private int dt_reg				= 0;
	private Integer count			= 0;
	private Integer sale			= 0;
	private Integer cost			= 0;
	private Integer income			= 0;
	private Integer moon			= 0;
	
	private int total_cost			= 0;
	private int total_sale			= 0;
	private int total_income		= 0;
	
	private int year				= 0;
	private int total_use			= 0;
	private int total_income_point	= 0;
	
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDt_reg() {
		return dt_reg;
	}
	public void setDt_reg(int dt_reg) {
		this.dt_reg = dt_reg;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getSale() {
		return sale;
	}
	public void setSale(Integer sale) {
		this.sale = sale;
	}
	public Integer getCost() {
		return cost;
	}
	public void setCost(Integer cost) {
		this.cost = cost;
	}
	public Integer getIncome() {
		return income;
	}
	public void setIncome(Integer income) {
		this.income = income;
	}
	public Integer getMoon() {
		return moon;
	}
	public void setMoon(Integer moon) {
		this.moon = moon;
	}
	public int getTotal_cost() {
		return total_cost;
	}
	public void setTotal_cost(int total_cost) {
		this.total_cost = total_cost;
	}
	public int getTotal_sale() {
		return total_sale;
	}
	public void setTotal_sale(int total_sale) {
		this.total_sale = total_sale;
	}
	public int getTotal_income() {
		return total_income;
	}
	public void setTotal_income(int total_income) {
		this.total_income = total_income;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getTotal_use() {
		return total_use;
	}
	public void setTotal_use(int total_use) {
		this.total_use = total_use;
	}
	public int getTotal_income_point() {
		return total_income_point;
	}
	public void setTotal_income_point(int total_income_point) {
		this.total_income_point = total_income_point;
	}
	
}
