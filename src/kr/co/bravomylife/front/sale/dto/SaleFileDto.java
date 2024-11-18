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

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class SaleFileDto {

	private int seq_sle					= 0;
	private int seq_review				= 0;
	private int seq_mbr					= 0;
	private int seq_buy_dtl				= 0;
	private String file_save			= "";
	private String file_orig			= "";
	private String fileNameOriginal		= "";
	private String fileNameSave			= "";
	private Long fileSize				= 0L;
	private int seq_review_img			= 0;
	private Integer review_imgs			= null;
	private String flg_del				= "";
	private Integer review_imgIn		= null;
	
	
	public Integer getReview_imgIn() {
		return review_imgIn;
	}
	public void setReview_imgIn(Integer review_imgIn) {
		this.review_imgIn = review_imgIn;
	}
	public Integer getReview_imgs() {
		return review_imgs;
	}
	public void setReview_imgs(Integer review_imgs) {
		this.review_imgs = review_imgs;
	}
	public String getFlg_del() {
		return flg_del;
	}
	public void setFlg_del(String flg_del) {
		this.flg_del = flg_del;
	}
	public int getSeq_review_img() {
		return seq_review_img;
	}
	public void setSeq_review_img(int seq_review_img) {
		this.seq_review_img = seq_review_img;
	}
	public int getSeq_buy_dtl() {
		return seq_buy_dtl;
	}
	public void setSeq_buy_dtl(int seq_buy_dtl) {
		this.seq_buy_dtl = seq_buy_dtl;
	}
	public int getSeq_sle() {
		return seq_sle;
	}
	public void setSeq_sle(int seq_sle) {
		this.seq_sle = seq_sle;
	}
	public int getSeq_review() {
		return seq_review;
	}
	public void setSeq_review(int seq_review) {
		this.seq_review = seq_review;
	}
	public int getSeq_mbr() {
		return seq_mbr;
	}
	public void setSeq_mbr(int seq_mbr) {
		this.seq_mbr = seq_mbr;
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
	public String getFileNameOriginal() {
		return fileNameOriginal;
	}
	public void setFileNameOriginal(String fileNameOriginal) {
		this.fileNameOriginal = fileNameOriginal;
	}
	public String getFileNameSave() {
		return fileNameSave;
	}
	public void setFileNameSave(String fileNameSave) {
		this.fileNameSave = fileNameSave;
	}
	public Long getFileSize() {
		return fileSize;
	}
	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}
}