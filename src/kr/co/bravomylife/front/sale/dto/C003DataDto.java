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

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-23
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class C003DataDto {
	
	@JsonProperty("total_count")
	private int total_count;
	
	@JsonProperty("row")
	private RowDataDto[] row;
	
	@JsonProperty("RESULT")
	private ResultDto result;
	
	
	public int getTotal_count() {
		return total_count;
	}
	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}
	public RowDataDto[] getRow() {
		return row;
	}
	public void setRow(RowDataDto[] row) {
		this.row = row;
	}
	public ResultDto getResult() {
		return result;
	}
	public void setResult(ResultDto result) {
		this.result = result;
	}
}