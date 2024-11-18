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
 * File			: SaloDto.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241001112543][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.sale.dto;

import java.util.List;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class SaleDto {

	private int rnum				= 0;
	private int star				= 0;
	private int seq_mbr				= 0;	// 회원 일련번호
	private int seq_like			= 0;	// 찜 일련번호(판매 상세 페이지에서 사용)
	private String sle_nm			= "";	// 판매 상품명
	private Integer seq_sle			= 0;	// 판매 상품 일련번호
	private String img				= "";	// 판매 상품 이미지
	private int price_sale			= 0;	// 판매 상품 원가
	private String desces			= "";	// 판매 상품 상세설명(이미지)
	private String cd_ctg_b			= "";	// 중분류
	private String cd_ctg_m			= "";	// 대분류
	private String cd_state_sale	= "";	// 판매 상품 상태
	private int rate_star			= 0;	// 상품 평점 1~5
	private int count				= 0;	// 평점 개수
	private int average_rate		= 0;	// 평점과 개수의 평점 평균
	private String prd_type			= "";	// 판매 상품 섭취 타입
	private int count_stock			= 0;	// 재고
	private String corp_nm			= "";	// 판매 상품 브랜드
	private String flg_delete		= "";	// 삭제 처리 여부
	private String dt_sale_atart	= "";	// 판매 시작일
	private String dt_sale_end		= "";	// 판매 종료일
	private int discount			= 0;	// 할인율
	private String dt_reg			= "";	// 등록일
	private int register			= 0;	// 등록자(관리자)
	private String dt_upt			= "";	// 수정일
	private int updater				= 0;	// 수정자
	private int discount_sale		= 0;	// 판매가(원가에서 할인율%을 뺀 가격)
	private String flg_best			= "";	// 인기 판매 상품 여부
	private String flg_like			= "";	// 찜 여부
	private int point_stack			= 0;	// 포인트 적립률
	private int point_value			= 0;	// 판매가에서 포인트 적립률%을 계산한 실제 포인트
	private String rate_review		= "";	// 상품 리뷰 내용
	private String mbr_nm			= "";	// 회원 이름
	private int seq_review			= 0;	// 리뷰 일련번호
	private String file_save		= "";
	private String file_orig		= "";
	private String extension		= "";
	private int review_count		= 0;
	private int total_count			= 0;
	private int seq_rate			= 0;
	private int mbr_rate_star		= 0;
	private List<ImageData> imgs		= null;	
	private String flg_review		= "";
	private int seq_buy_dtl			= 0;
	private int list_count			= 0;
	private int writeReview_count	= 0;
	private int seq_review_img		= 0;
	private int point				= 0;
	private String earliest_date	= "";
	private String latest_date		= "";
	private int sle_count			= 0;
	private int total_point			= 0;
	
	
	private String searchKey		= "";
	private String searchWord		= "";
	
	
	public int getTotal_point() {
		return total_point;
	}
	public void setTotal_point(int total_point) {
		this.total_point = total_point;
	}
	public int getSle_count() {
		return sle_count;
	}
	public void setSle_count(int sle_count) {
		this.sle_count = sle_count;
	}
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getSeq_review_img() {
		return seq_review_img;
	}
	public void setSeq_review_img(int seq_review_img) {
		this.seq_review_img = seq_review_img;
	}
	public int getWriteReview_count() {
		return writeReview_count;
	}
	public void setWriteReview_count(int writeReview_count) {
		this.writeReview_count = writeReview_count;
	}
	public int getList_count() {
		return list_count;
	}
	public void setList_count(int list_count) {
		this.list_count = list_count;
	}
	public int getSeq_buy_dtl() {
		return seq_buy_dtl;
	}
	public void setSeq_buy_dtl(int seq_buy_dtl) {
		this.seq_buy_dtl = seq_buy_dtl;
	}
	public String getFlg_review() {
		return flg_review;
	}
	public void setFlg_review(String flg_review) {
		this.flg_review = flg_review;
	}
	public List<ImageData> getImgs() {
		return imgs;
	}
	public void setImgs(List<ImageData> imgs) {
		this.imgs = imgs;
	}
	public int getMbr_rate_star() {
		return mbr_rate_star;
	}
	public void setMbr_rate_star(int mbr_rate_star) {
		this.mbr_rate_star = mbr_rate_star;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getSeq_rate() {
		return seq_rate;
	}
	public void setSeq_rate(int seq_rate) {
		this.seq_rate = seq_rate;
	}
	public int getTotal_count() {
		return total_count;
	}
	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public String getFile_save() {
		return file_save;
	}
	public void setFile_save(String file_save) {
		this.file_save = file_save;
	}
	public String getFile_orig() {
		return file_orig;
	}
	public void setFile_orig(String file_orig) {
		this.file_orig = file_orig;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public int getSeq_like() {
		return seq_like;
	}
	public void setSeq_like(int seq_like) {
		this.seq_like = seq_like;
	}
	public int getSeq_review() {
		return seq_review;
	}
	public void setSeq_review(int seq_review) {
		this.seq_review = seq_review;
	}
	public int getPoint_value() {
		return point_value;
	}
	public void setPoint_value(int point_value) {
		this.point_value = point_value;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getSeq_mbr() {
		return seq_mbr;
	}
	public void setSeq_mbr(int seq_mbr) {
		this.seq_mbr = seq_mbr;
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
	public int getRate_star() {
		return rate_star;
	}
	public void setRate_star(int rate_star) {
		this.rate_star = rate_star;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getAverage_rate() {
		return average_rate;
	}
	public void setAverage_rate(int average_rate) {
		this.average_rate = average_rate;
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
	public String getDt_sale_atart() {
		return dt_sale_atart;
	}
	public void setDt_sale_atart(String dt_sale_atart) {
		this.dt_sale_atart = dt_sale_atart;
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
	public int getDiscount_sale() {
		return discount_sale;
	}
	public void setDiscount_sale(int discount_sale) {
		this.discount_sale = discount_sale;
	}
	public String getFlg_best() {
		return flg_best;
	}
	public void setFlg_best(String flg_best) {
		this.flg_best = flg_best;
	}
	public String getFlg_like() {
		return flg_like;
	}
	public void setFlg_like(String flg_like) {
		this.flg_like = flg_like;
	}
	public int getPoint_stack() {
		return point_stack;
	}
	public void setPoint_stack(int point_stack) {
		this.point_stack = point_stack;
	}
	public String getRate_review() {
		return rate_review;
	}
	public void setRate_review(String rate_review) {
		this.rate_review = rate_review;
	}
	public String getMbr_nm() {
		return mbr_nm;
	}
	public void setMbr_nm(String mbr_nm) {
		this.mbr_nm = mbr_nm;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
}