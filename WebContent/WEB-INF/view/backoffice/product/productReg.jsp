<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/product/productReg.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	
	<%@ include file="/include/backoffice/mainSide.jsp" %>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script>

		function consolegoList(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.cd_bbs_type.setAttribute("value", value);
			frmMain.action = "/console/center/board/list.web";
			frmMain.submit();
		}
		function commaValue(input) {
			// 입력된 값에서 콤마를 제거
			let value = input.value.replace(/,/g, '');
			
			// 숫자 형식으로 변환
			let formattedValue = Number(value).toLocaleString();
			
			// 포맷된 값을 다시 입력 필드에 설정
			input.value = formattedValue;
		}
		
		$(function() {
			$('#dt_sale_start').datepicker({ dateFormat: 'yy-mm-dd' });
			$('#dt_sale_end').datepicker({ dateFormat: 'yy-mm-dd' });
		});
	
		function productRegProc() {
			
			var frmMain = document.getElementById("frmMain");
			
			if (document.getElementById("sle_nm").value == ""
					|| document.getElementById("img").value == ""
					|| document.getElementById("desces").value == ""
					|| document.getElementById("cd_ctg_b").value == "0"
					|| document.getElementById("cd_ctg_m").value == "0"
					|| document.getElementById("cd_state_sale").value == "0"
					|| document.getElementById("prd_type").value == "0"
					|| document.getElementById("count_stock").value == 0
					|| document.getElementById("corp_nm").value == ""
					|| document.getElementById("dt_sale_start").value == ""
					|| document.getElementById("dt_sale_end").value == "") {
				alert("필수 항목을 입력하세요!");
				return;
			}
			var discount = parseInt(document.getElementById("discount").value.trim());
			var point_stack = parseInt(document.getElementById("point_stack").value.trim());

			if (isNaN(discount) || discount < 0 || discount > 99) {
				alert("할인율은 0에서 99 사이의 숫자만 입력 가능합니다.");
				return;
			}

			if (isNaN(point_stack) || point_stack < 0 || point_stack > 99) {
				alert("포인트 적립률은 0에서 99 사이의 숫자만 입력 가능합니다.");
				return;
			}
			document.getElementById("origin_sale").value = document.getElementById("origin_sale").value.replaceAll(",", "");
			
			frmMain.action = "/backoffice/product/productRegProc.web";
			frmMain.submit();
			
		}
	
		function updateCategoryMinor() {
			var cd_ctg_b = document.getElementById("cd_ctg_b").value;
			var cd_ctg_m = document.getElementById("cd_ctg_m");
			
			// 기존 옵션 삭제
			cd_ctg_m.innerHTML = "";
	
			let options = [];
	
			if (cd_ctg_b === "1") { // 기능별
				options = [
					{ value: "1", text: "혈당/혈행/혈압" },
					{ value: "2", text: "항산화/면역력" },
					{ value: "3", text: "염증/항염" },
					{ value: "4", text: "관절/뼈/치아" },
					{ value: "5", text: "피로회복" },
					{ value: "6", text: "눈 건강" },
					{ value: "7", text: "장 건강" },
					{ value: "8", text: "두뇌/기억력" },
					{ value: "9", text: "위/간/갑상선" }
				];
			} else if (cd_ctg_b === "2") { // 성분별
				options = [
					{ value: "1", text: "폴리코사놀" },
					{ value: "2", text: "오메가-3" },
					{ value: "3", text: "비타민/미네랄" },
					{ value: "4", text: "유산균" },
					{ value: "5", text: "글루코사민/MSM" },
					{ value: "6", text: "루테인" },
					{ value: "7", text: "코큐텐" },
					{ value: "8", text: "아르기닌" },
					{ value: "9", text: "밀크씨슬" }
				];
			} else if (cd_ctg_b === "3") { // 대상별
				options = [
					{ value: "1", text: "남성" },
					{ value: "2", text: "여성" }
				];
			}
	
			// 새 옵션 추가
			options.forEach(option => {
				const newOption = document.createElement("option");
				newOption.value = option.value;
				newOption.textContent = option.text;
				cd_ctg_m.appendChild(newOption);
			});
		}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST" enctype="multipart/form-data">
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" value="${paging.cd_bbs_type}" />
<input type="hidden" name="cd_state" 	id="cd_state" value= ""/>


<!-- Main content -->
<div class="content-wrapper">
	<section class="content-header" style="display: flex; align-items: center; margin-left: 215px;">
		<h1>상품 등록</h1>
	</section>
	<section class="content" style="display: flex; justify-content: center; align-items: center;">
		<div class="col-md-9">
			<div class="box box-primary">
				<div class="box-body no-padding">
					<div class="table-responsive mailbox-messages">
						<table class="table table-hover table-striped">
							<tbody>
							<tr>
								<th style="width: 150px;" >판매 상품명</th>
								<td>
									<input type="text" id="sle_nm" name="sle_nm" class="form-control" required autocomplete="off">

								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >상품 원가</th>
								<td>
									<input type="text" class="form-control" id="origin_sale" name="origin_sale" onkeyup="commaValue(this);" required autocomplete="off">
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >판매 상품 이미지</th>
								<td>
									<input type="file" id="img" name="files[0]" required>
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >판매 상품 상세 이미지</th>
								<td>
									<input type="file" id="desces" name="files[1]" required>
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >카테고리 대분류</th>
								<td>
									<select class="form-control" id="cd_ctg_b" name="cd_ctg_b" onchange="updateCategoryMinor()" required>
										<option value="0">선택하세요</option>
										<option value="1">기능별</option>
										<option value="2">성분별</option>
										<option value="3">대상별</option>
									</select>
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >카테고리 중분류</th>
								<td>
									<select class="form-control" id="cd_ctg_m" name="cd_ctg_m" required>
										<option value="0">먼저 대분류를 선택하세요</option>
									</select>
								</td>
							</tr>
							<tr>
							<th>판매 상품 상태</th>
								<td>
									<select class="form-control" id="cd_state_sale" name="cd_state_sale" required>
										<option value="0">선택하세요</option>
										<option value="1">대기</option>
										<option value="2">판매</option>
										<option value="3">중지</option>
										<option value="9">재고소진</option>
									</select>
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >판매 상품 섭취 타입</th>
								<td>
									<select class="form-control" id="prd_type" name="prd_type" required>
										<option value="0">선택하세요</option>
										<option value="1">액상</option>
										<option value="2">정</option>
										<option value="3">캡슐</option>
										<option value="4">베지캡슐</option>
										<option value="5">젤리</option>
										<option value="6">분말</option>
										<option value="7">츄어블</option>
									</select>
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >판매 상품 재고</th>
								<td>
									<input type="text" id="count_stock" name="count_stock" class="form-control" onkeyup="commaValue(this);" required autocomplete="off">
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >판매 상품 브랜드</th>
								<td>
									<input type="text" id="corp_nm" name="corp_nm" class="form-control" required autocomplete="off">

								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >상품 판매 시작일</th>
								<td>
									<input type="text" id="dt_sale_start" name="dt_sale_start" required autocomplete="off">
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >상품 판매 종료일</th>
								<td>
									<input type="text" id="dt_sale_end" name="dt_sale_end" required autocomplete="off">

								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >할인율</th>
								<td>
									<input type="text" id="discount" name="discount" class="form-control" autocomplete="off" max="99">
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >마진률</th>
								<td>
									<input type="text" id="margin_rate" name="margin_rate" class="form-control" autocomplete="off" max="30">
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >포인트 적립률</th>
								<td>
									<input type="text" id="point_stack" name="point_stack" class="form-control"  autocomplete="off">
								</td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="mailbox-controls">
					<div class="btn-group" style="display: flex; justify-content: center; gap: 10px;">
						<input type="button" value="등록" class="btn btn-primary" style="width: 150px" onclick="javascript:productRegProc();"/>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<!-- /Maincontent -->

	<%@ include file="/include/backoffice/footer.jsp" %>
	
	<%@ include file="/include/backoffice/js.jsp" %>
</form>
</body>
</html>