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
 * File			: MemberDto.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241001104637][whslsl88#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.member.dto;

/**
 * @version 1.0.0
 * @author whslsl88#gmail.com
 * 
 * @since 2024-10-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class MemberDto {

	private int	seq_mbr			= 0;
	private String 	email		= "";
	private String	passwd		= "";
	private String flg_sur		= "";
	private int	cd_state		= 0;
	private String	mbr_nm		= "";
	private String 	age			= "";
	private String	gender		= "";
	private String	phone		= "";
	private String	post		= "";
	private String	addr1		= "";
	private String	addr2		= "";
	private String	flg_sms		= "";
	private String	flg_email	= "";
	private String	dt_sms		= "";
	private String	dt_email	= "";
	private String	last_ip		= "";
	private String	last_dt		= "";
	private String	dt_reg		= "";
	private String	dt_upt		= "";
	private String	cause		= "";
	private int	register		= 0;
	private int	updater			= 0;
	private int point			= 0;
	private int total_point		= 0;
	private int current_basket	= 0;
	private int delivery_count	= 0;
	private int seq_mbr_addr	= 0;
	private String flg_default	= "";
	private String img			= "";
	private String sle_nm		= "";
	private Integer seq_sle		= 0;
	private int count			= 0;
	private int seq_buy_dtl		= 0;
	private int seq_buy_mst		= 0;
	private String dt_delivery	= "";
	private String cd_state_delivery	= "";
	private String delivery_request		= "";
	private String cd_state_mst			= "";
	
	
	public String getCd_state_mst() {
		return cd_state_mst;
	}
	public void setCd_state_mst(String cd_state_mst) {
		this.cd_state_mst = cd_state_mst;
	}
	public String getDelivery_request() {
		return delivery_request;
	}
	public void setDelivery_request(String delivery_request) {
		this.delivery_request = delivery_request;
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
	public String getSle_nm() {
		return sle_nm;
	}
	public void setSle_nm(String sle_nm) {
		this.sle_nm = sle_nm;
	}
	public Integer getSeq_sle() {
		return seq_sle;
	}
	public void setSeq_sle(Integer seq_sle) {
		this.seq_sle = seq_sle;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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
	public String getDt_delivery() {
		return dt_delivery;
	}
	public void setDt_delivery(String dt_delivery) {
		this.dt_delivery = dt_delivery;
	}
	public String getFlg_default() {
		return flg_default;
	}
	public void setFlg_default(String flg_default) {
		this.flg_default = flg_default;
	}
	public int getSeq_mbr_addr() {
		return seq_mbr_addr;
	}
	public void setSeq_mbr_addr(int seq_mbr_addr) {
		this.seq_mbr_addr = seq_mbr_addr;
	}
	public int getDelivery_count() {
		return delivery_count;
	}
	public void setDelivery_count(int delivery_count) {
		this.delivery_count = delivery_count;
	}
	public int getCurrent_basket() {
		return current_basket;
	}
	public void setCurrent_basket(int current_basket) {
		this.current_basket = current_basket;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getTotal_point() {
		return total_point;
	}
	public void setTotal_point(int total_point) {
		this.total_point = total_point;
	}
	public String getCause() {
		return cause;
	}
	public void setCause(String cause) {
		this.cause = cause;
	}
	public int getSeq_mbr() {
		return seq_mbr;
	}
	public void setSeq_mbr(int seq_mbr) {
		this.seq_mbr = seq_mbr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getFlg_sur() {
		return flg_sur;
	}
	public void setFlg_sur(String flg_sur) {
		this.flg_sur = flg_sur;
	}
	public int getCd_state() {
		return cd_state;
	}
	public void setCd_state(int cd_state) {
		this.cd_state = cd_state;
	}
	public String getMbr_nm() {
		return mbr_nm;
	}
	public void setMbr_nm(String mbr_nm) {
		this.mbr_nm = mbr_nm;
	}
	
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getFlg_sms() {
		return flg_sms;
	}
	public void setFlg_sms(String flg_sms) {
		this.flg_sms = flg_sms;
	}
	public String getFlg_email() {
		return flg_email;
	}
	public void setFlg_email(String flg_email) {
		this.flg_email = flg_email;
	}
	public String getDt_sms() {
		return dt_sms;
	}
	public void setDt_sms(String dt_sms) {
		this.dt_sms = dt_sms;
	}
	public String getDt_email() {
		return dt_email;
	}
	public void setDt_email(String dt_email) {
		this.dt_email = dt_email;
	}
	public String getLast_ip() {
		return last_ip;
	}
	public void setLast_ip(String last_ip) {
		this.last_ip = last_ip;
	}
	public String getLast_dt() {
		return last_dt;
	}
	public void setLast_dt(String last_dt) {
		this.last_dt = last_dt;
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
	public int getRegister() {
		return register;
	}
	public void setRegister(int register) {
		this.register = register;
	}
	public int getUpdater() {
		return updater;
	}
	public void setUpdater(int updater) {
		this.updater = updater;
	}	
}