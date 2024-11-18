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
 * File			: ImageData.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241023140532][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.sale.dto;

import java.util.ArrayList;
import java.util.List;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-23
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class ImageData {
	
	private String file_save				= "";
	private int seq_review_img				= 0;
	private List<Integer> review_imgs = new ArrayList<>();
	private List<String> flg_del = new ArrayList<>();
	private List<Integer> review_imgIn = new ArrayList<>();
	
	
	public String getFile_save() {
		return file_save;
	}
	public void setFile_save(String file_save) {
		this.file_save = file_save;
	}
	public int getSeq_review_img() {
		return seq_review_img;
	}
	public void setSeq_review_img(int seq_review_img) {
		this.seq_review_img = seq_review_img;
	}
	public List<Integer> getReview_imgs() {
		return review_imgs;
	}
	public void setReview_imgs(List<Integer> review_imgs) {
		this.review_imgs = review_imgs;
	}
	public List<String> getFlg_del() {
		return flg_del;
	}
	public void setFlg_del(List<String> flg_del) {
		this.flg_del = flg_del;
	}
	public List<Integer> getReview_imgIn() {
		return review_imgIn;
	}
	public void setReview_imgIn(List<Integer> review_imgIn) {
		this.review_imgIn = review_imgIn;
	}
}