<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/product/modifyForm.jsp" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/5.10.2/tinymce.min.js"></script>
	<script>
		
	function consolegoList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/console/center/board/list.web";
		frmMain.submit();
	}
	
	// HTML Editor
	tinymce.init({selector:'textarea'});

	// [최초 또는 변경 시 코드 설정]
	var cd_ctg_b = "${productDto.cd_ctg_b}";
	var cd_ctg_m = "${productDto.cd_ctg_m}";
	
	window.onload = function() {
		var objStruct = new Array();
		
		objStruct.push({value:"1", text:"기능별"});
		objStruct.push({value:"2", text:"성분별"});
		objStruct.push({value:"3", text:"대상별"});
		
		// 대/중/소분류 선택박스(Select) 생성
		createSelect("span_cd_ctg_1", "cd_ctg_b", objStruct	, "선택", cd_ctg_b	, 100);
		createSelect("span_cd_ctg_2", "cd_ctg_m", null		, "선택", ""		, 100);
		setCategory2();
		
		document.getElementById("cd_ctg_b").onchange = function() {
			cd_ctg_b = this.value;
			setCategory2();
		}
	}
	
	function setCategory2(){
		
		var objStruct= new Array();
		
		// 기능별(01)
		if (cd_ctg_b == "1") {
			objStruct.push({value:"1", text:"혈당/혈행/혈압"});
			objStruct.push({value:"2", text:"항산화/면역력"});
			objStruct.push({value:"3", text:"염증/항염"});
			objStruct.push({value:"4", text:"관절/뼈/치아"});
			objStruct.push({value:"5", text:"피로회복"});
			objStruct.push({value:"6", text:"눈 건강"});
			objStruct.push({value:"7", text:"장 건강"});
			objStruct.push({value:"8", text:"두뇌/기억력"});
			objStruct.push({value:"9", text:"위/간/갑상선"});
		}
		// 성분별(02)
		else if (cd_ctg_b == "2") {
			objStruct.push({value:"1", text:"폴리코사놀"});
			objStruct.push({value:"2", text:"오메가-3"});
			objStruct.push({value:"3", text:"비타민/미네랄"});
			objStruct.push({value:"4", text:"유산균"});
			objStruct.push({value:"5", text:"글루코사민/MSM"});
			objStruct.push({value:"6", text:"루테인"});
			objStruct.push({value:"7", text:"코큐텐"});
			objStruct.push({value:"8", text:"아르기닌"});
			objStruct.push({value:"9", text:"밀크씨슬"});
		}
		// 대상별(03)
		else if (cd_ctg_b == "3") {
			objStruct.push({value:"1", text:"남성"});
			objStruct.push({value:"2", text:"여성"});
		}
		
		// 대분류 코드에 해당하는 중분류 옵션(Option) 생성(없으면 중분류 초기화)
		if (cd_ctg_b == "")	createOption("cd_ctg_m", null, "선택", "");
		else createOption("cd_ctg_m", objStruct, "선택", cd_ctg_m);
	}
	
	
	/**
	 * @author pluto#plutozone.com
	 * @since 2016-01-07
	 *
	 * <p>DESCRIPTION: 셀렉트 생성(Create Select)</p>
	 * <p>IMPORTANT:</p>
	 */
	function createSelect(objParentId, objID, objStruct, defaultValue, setValue, width) {
		var combobox		= document.createElement("select");
		combobox.id			= objID;
		combobox.name		= objID;
		
		if (width == undefined) width = "100";
		combobox.setAttribute("style", "width: " + width + "px; padding-top: 0px; padding-bottom: 0px;");
		
		var option		= null;
		if (defaultValue) {
			option = new Option(defaultValue, "");
			combobox.options[0] = option;
		}
		
		if (objStruct && objStruct.length > 0) {
			var j = 0;
			var optionCount = combobox.options.length;
			for (var i=optionCount; i < objStruct.length+optionCount; i++) {
				option = new Option(objStruct[j].text, objStruct[j].value);
				combobox.options[i] = option;
				
				j++;
			}
		}
		
		setSelect(combobox, setValue);
		document.getElementById(objParentId).appendChild(combobox);
	}

	/**
	 * @author pluto#plutozone.com
	 * @since 2016-01-07
	 *
	 * <p>DESCRIPTION: 옵션 생성(Create Option)</p>
	 * <p>IMPORTANT:</p>
	 */
	function createOption(objID, objStruct, defaultValue, setValue) {

		var combobox	= document.getElementById(objID);
		
		for (var i = 0; i < combobox.options.length; i++) {
			combobox.options.length = i;
		}
		
		var option		= null;
		if (defaultValue) {
			option = new Option(defaultValue, "");
			combobox.options[0] = option;
		}
			
		if (objStruct && objStruct.length > 0) {
			var j = 0;
			var optionCount = combobox.options.length;
			for (var i=optionCount; i < objStruct.length+optionCount; i++) {
				option = new Option(objStruct[j].text, objStruct[j].value);
				combobox.options[i] = option;
				j++;
			}
		}	
		setOption(combobox, setValue);
	}

	/**
	 * @author pluto#plutozone.com
	 * @since 2016-01-07
	 *
	 * <p>DESCRIPTION: 값 얻기(Get Value)</p>
	 * <p>IMPORTANT:</p>
	 */
	function getOptionValue(objThis) {
		if (!objThis) return "";
		return objThis.options[objThis.selectedIndex].value;
	}
	
	/**
	 * @author pluto#plutozone.com
	 * @since 2016-01-07
	 *
	 * <p>DESCRIPTION: 값 설정(Set Value)</p>
	 * <p>IMPORTANT:</p>
	 */
	function setSelect(objThis, value) {
		if (!objThis) return;
		
		for (var i = 0; i < objThis.options.length; i++) {
			if (objThis.options[i].value == value) {
				objThis.options.selectedIndex = i;
				break;
			}
		}
	}
	
	/**
	 * @author pluto#plutozone.com
	 * @since 2016-01-07
	 *
	 * <p>DESCRIPTION: 값 설정(Set Value)</p>
	 * <p>IMPORTANT:</p>
	 */
	function setOption(objThis, value) {
		if (!objThis) return;
		
		for (var i = 0; i < objThis.options.length; i++) {
			if (objThis.options[i].value == value) {
				objThis.options.selectedIndex = i;
				break;
			}
		}
	}
	
		function commaValue(input) {
			// 입력된 값에서 콤마를 제거
			let value = input.value.replace(/,/g, '');
			
			// 숫자 형식으로 변환
			let formattedValue = Number(value).toLocaleString();
			
			// 포맷된 값을 다시 입력 필드에 설정
			input.value = formattedValue;
		}
		
		$(function(){
			$('#dt_sale_start').datepicker({dateFormat:'yy-mm-dd'});
		})
		
			$(function(){
		$('#dt_sale_end').datepicker({dateFormat:'yy-mm-dd'});
		})
		
		function modifyProc(value) {
			var frmMain = document.getElementById("frmMain");
			
			if (document.getElementById("sle_nm").value == ""
					|| document.getElementById("origin_sale").value == "0"
					|| document.getElementById("cd_ctg_b").value == ""
					|| document.getElementById("cd_ctg_m").value == ""
					|| document.getElementById("cd_state_sale").value == ""
					|| document.getElementById("flg_delete").value == ""
					|| document.getElementById("dt_sale_start").value == ""
					|| document.getElementById("dt_sale_end").value == "") {
				alert("필수 항목을 입력하세요!");
				return;
			}
			document.getElementById("origin_sale").value = document.getElementById("origin_sale").value.replaceAll(",", "");
			
			frmMain.action="/console/product/modifyProc.web";
			frmMain.submit();
		}
		
		function goProductList() {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.action = "/console/product/list.web";
			frmMain.submit();
		}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST" enctype="multipart/form-data">
<input type="hidden" name="seq_sle"		id="seq_sle"					value="${productDto.seq_sle}"/>
<input type="hidden" name="cd_bbs_type"	id="cd_bbs_type"				value="${paging.cd_bbs_type}" />
<input type="hidden" name="cd_state"	id="cd_state"					value="0"/>

	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
<div class="content-wrapper">
	<section class="content-header" style="display: flex; align-items: center; margin-left: 215px;">
		<h1>상품 정보 수정</h1>
	</section>
	<section class="content" style="display: flex; justify-content: center; align-items: center;">
		<div class="col-md-9" >
			<div class="box box-primary">
				<div class="box-body no-padding">
					<div class="table-responsive mailbox-messages">
						<table class="table table-hover table-striped">
							<tbody>
							<tr>
								<th style="width: 150px;" >판매 상품명</th>
								<td>
									<input type="text" name="sle_nm" id="sle_nm" value="${productDto.sle_nm}" required/>
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >상품 상세 이미지</th>
								<td>
									<img src="/img/product/${productDto.desces}" height="200"/>
									<input type="file" id="desces" name="files[1]" />
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >상품 이미지</th>
								<td>
									<img src="/img/product/${productDto.img}" height="200"/>
									<input type="file" id="img" name="files[0]" />
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >상품 원가</th>
								<td>
									<input type="text" id="origin_sale" name="origin_sale" value="<fmt:formatNumber value="${productDto.origin_sale}" type="number" />" style="width:100px; text-align:right" onkeyup="commaValue(this);" required/>원
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >카테고리 대분류</th>
								<td>
									<span id="span_cd_ctg_1"></span>
								</td>
							</tr>
							<tr>
								<th style="width: 150px;">카테고리 중분류</th>
								<td>
									<span id="span_cd_ctg_2"></span>
								</td>
							</tr>
							<tr>
							<th>판매 상태</th>
								<td>
									<select id="cd_state_sale" name="cd_state_sale">
										<option value="1"<c:if test="${productDto.cd_state_sale == '1'}"> selected</c:if>>대기</option>
										<option value="2"<c:if test="${productDto.cd_state_sale == '2'}"> selected</c:if>>판매</option>
										<option value="3"<c:if test="${productDto.cd_state_sale == '3'}"> selected</c:if>>중지</option>
										<option value="9"<c:if test="${productDto.cd_state_sale == '9'}"> selected</c:if>>품절</option>
									</select>
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >판매 상품 재고</th>
								<td>
									<input type="text" id="count_stock" name="count_stock" value="<fmt:formatNumber value="${productDto.count_stock}" type="number" />" style="width:100px; text-align:right" onkeyup="commaValue(this);" required/>개
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >포인트 적립률</th>
								<td>
									<input type="text" name="point_stack" id="point_stack" value="${productDto.point_stack}" style="width:100px; text-align:right" required/>%
							</tr>
							<tr>
								<th style="width: 150px;" >삭제 처리 여부</th>
								<td>
									<input type="text" name="flg_delete" id="flg_delete" value="${productDto.flg_delete}" style="width:100px; text-align:right" required/>
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >판매 시작 일시</th>
								<td>
									<input type="text" id="dt_sale_start" name="dt_sale_start" value="${productDto.dt_sale_start}" style="width:100px; text-align:right" required/>
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >판매 종료 일시</th>
								<td>
									<input type="text" id="dt_sale_end" name="dt_sale_end" value="${productDto.dt_sale_end}" style="width:100px; text-align:right" required/>
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >할인율</th>
								<td>
									<input type="text" id="discount" name="discount" value="${productDto.discount}" style="width:100px; text-align:right" required/>%
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >마진률</th>
								<td>
									<input type="text" id="margin_rate" name="margin_rate" value="${productDto.margin_rate}" style="width:100px; text-align:right" required/>%
								</td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="mailbox-controls">
					<div class="btn-group" style="display: flex; justify-content: center; gap: 10px;">
						<input type="button" value="수정" class="btn btn-primary" style="width: 150px" onclick="javascript:modifyProc();" />
						<input type="button" value="목록" class="btn btn-primary" style="width: 150px" onclick="javascript:goProductList();"/>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
	
<!-- /Maincontent -->

	<%@ include file="/include/backoffice/footer.jsp" %>

	<%@ include file="/include/backoffice/sideBar.jsp" %>

	<%@ include file="/include/backoffice/js.jsp" %>
</form>
</body>
</html>
