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
 * Program		: com.github.ecommorce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: BoardDto.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241008113457][lcm991224#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.center.dto;

/**
 * @version 1.0.0
 * @author lcm991224#gmail.com
 * 
 * @since 2024-10-08
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class BoardDto {
	
	private int rnum			= 0;		// 글 순번
	private Integer seq_bbs			= 0;		// 글 일련번호
	private int seq_bbs_parent	= 0;		// 글 상위 일련번호
	private int seq_reply		= 0;		// 답변 일련번호
	private int cd_bbs_type		= 0;		// 게시판 종류: 공지사항(1), 자주 찾는 질문(2), 질의 응답(3)
	private String title		= "";		// 제목
	private int cd_ctg			= 0;		// 카테고리 코드
	private String ctg_nm		= "";		// 카테고리 명칭
	private String content		= "";		// 내용
	private String flg_delete	= "";		// 삭제 여부
	private String flg_top		= "";		// 최상위 여부
	private String flg_reply	= "";		// 답변 여부
	private int readed			= 0;		// 조회수
	private String file_save	= "";		// 저장 파일명
	private String file_orig	= "";		// 원본 파일명
	private String dt_reg		= "";		// 등록 일시
	private int register		= 0;		// 등록자
	private String dt_upt		= "";		// 수정 일시
	private int updater			= 0;		// 수정자
	
	private int count_flg_reply_null = 0;	//미답변 개수
	private int seq_bbs_question = 0;
	
	private String cd_ctg_b			= "";	// 중분류
	private String cd_ctg_m			= "";	// 대분류
	private Integer seq_sle			= 0;	// 판매 상품 일련번호
	
	private String mbr_nm			="";
	


	
	public Integer getSeq_bbs() {
		return seq_bbs;
	}
	public void setSeq_bbs(Integer seq_bbs) {
		this.seq_bbs = seq_bbs;
	}
	public String getMbr_nm() {
		return mbr_nm;
	}
	public void setMbr_nm(String mbr_nm) {
		this.mbr_nm = mbr_nm;
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
	public Integer getSeq_sle() {
		return seq_sle;
	}
	public void setSeq_sle(Integer seq_sle) {
		this.seq_sle = seq_sle;
	}
	public int getSeq_bbs_question() {
		return seq_bbs_question;
	}
	public void setSeq_bbs_question(int seq_bbs_question) {
		this.seq_bbs_question = seq_bbs_question;
	}
	public int getCount_flg_reply_null() {
		return count_flg_reply_null;
	}
	public void setCount_flg_reply_null(int count_flg_reply_null) {
		this.count_flg_reply_null = count_flg_reply_null;
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
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getSeq_bbs_parent() {
		return seq_bbs_parent;
	}
	public void setSeq_bbs_parent(int seq_bbs_parent) {
		this.seq_bbs_parent = seq_bbs_parent;
	}
	public int getSeq_reply() {
		return seq_reply;
	}
	public void setSeq_reply(int seq_reply) {
		this.seq_reply = seq_reply;
	}
	public int getCd_bbs_type() {
		return cd_bbs_type;
	}
	public void setCd_bbs_type(int cd_bbs_type) {
		this.cd_bbs_type = cd_bbs_type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCd_ctg() {
		return cd_ctg;
	}
	public void setCd_ctg(int cd_ctg) {
		this.cd_ctg = cd_ctg;
	}
	public String getCtg_nm() {
		return ctg_nm;
	}
	public void setCtg_nm(String ctg_nm) {
		this.ctg_nm = ctg_nm;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFlg_delete() {
		return flg_delete;
	}
	public void setFlg_delete(String flg_delete) {
		this.flg_delete = flg_delete;
	}
	public String getFlg_top() {
		return flg_top;
	}
	public void setFlg_top(String flg_top) {
		this.flg_top = flg_top;
	}
	public String getFlg_reply() {
		return flg_reply;
	}
	public void setFlg_reply(String flg_reply) {
		this.flg_reply = flg_reply;
	}
	public int getReaded() {
		return readed;
	}
	public void setReaded(int readed) {
		this.readed = readed;
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
