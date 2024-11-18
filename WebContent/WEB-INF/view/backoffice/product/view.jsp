<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/product/view.jsp" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script>
	
		function consolegoList(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.cd_bbs_type.setAttribute("value", value);
			frmMain.action = "/console/center/board/list.web";
			frmMain.submit();
		}
	
		function stop(value) {
			var frmMain = document.getElementById("frmMain");
			
			frmMain.action="/console/product/stop.web";
			frmMain.submit();
		}
		
		function re(value) {
			var frmMain = document.getElementById("frmMain");
			
			frmMain.action="/console/product/re.web";
			frmMain.submit();
		}
		
		function out(value) {
			var frmMain = document.getElementById("frmMain");
			
			frmMain.action="/console/product/out.web";
			frmMain.submit();
		}
		
		function modifyForm(value) {
			var frmMain = document.getElementById("frmMain");
			
			frmMain.action="/console/product/modifyForm.web";
			frmMain.submit();
		}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST">
<input type="hidden" id="seq_sle"		name="seq_sle"			value="${productDto.seq_sle}"/>
<input type="hidden" id="cd_state_sale"	name="cd_state_sale"	value="${productDto.cd_state_sale}"/>
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" 		value="${paging.cd_bbs_type}" />
<input type="hidden" name="cd_state"	id="cd_state" 			value="0"/>
	
	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
<div class="content-wrapper">
	<section class="content-header" style="display: flex; align-items: center; margin-left: 215px;">
		<h1>상품 상세 정보</h1>
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
									${productDto.sle_nm}
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >상품 상세 이미지</th>
								<td>
									<img src="/img/product/${productDto.desces}" height="200"/>
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >상품 이미지</th>
								<td>
									<img src="/img/product/${productDto.img}" height="200"/>
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >판매 가격</th>
								<td>
									<fmt:formatNumber value="${productDto.price_sale}" type="number" />원
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >상품 원가</th>
								<td>
									<fmt:formatNumber value="${productDto.origin_sale}" type="number" />원
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >카테고리 대분류</th>
								<td>
									<select id="cd_ctg_b" name="cd_ctg_b" disabled>
										<option value="1"<c:if test="${productDto.cd_ctg_b == '1'}"> selected</c:if>>기능별</option>
										<option value="2"<c:if test="${productDto.cd_ctg_b == '2'}"> selected</c:if>>성분별</option>
										<option value="3"<c:if test="${productDto.cd_ctg_b == '3'}"> selected</c:if>>대상별</option>
									</select>
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >카테고리 중분류</th>
								<td>
									<c:choose>
										<c:when test="${productDto.cd_ctg_b == '1'}">
											<select id="cd_ctg_b_1" name="cd_ctg_b_1" disabled>
												<option value="1" <c:if test="${productDto.cd_ctg_m == '1'}"> selected</c:if>>혈당/혈행/혈압</option>
												<option value="2" <c:if test="${productDto.cd_ctg_m == '2'}"> selected</c:if>>항산화/면역력</option>
												<option value="3" <c:if test="${productDto.cd_ctg_m == '3'}"> selected</c:if>>염증/항염</option>
												<option value="4" <c:if test="${productDto.cd_ctg_m == '4'}"> selected</c:if>>관절/뼈/치아</option>
												<option value="5" <c:if test="${productDto.cd_ctg_m == '5'}"> selected</c:if>>피로회복</option>
												<option value="6" <c:if test="${productDto.cd_ctg_m == '6'}"> selected</c:if>>눈 건강</option>
												<option value="7" <c:if test="${productDto.cd_ctg_m == '7'}"> selected</c:if>>장 건강</option>
												<option value="8" <c:if test="${productDto.cd_ctg_m == '8'}"> selected</c:if>>두뇌/기억력</option>
												<option value="9" <c:if test="${productDto.cd_ctg_m == '9'}"> selected</c:if>>위/간/갑상선</option>
											</select>
										</c:when>
										
										<c:when test="${productDto.cd_ctg_b == '2'}">
											<select id="cd_ctg_b_2" name="cd_ctg_b_2" disabled>
												<option value="1" <c:if test="${productDto.cd_ctg_m == '1'}"> selected</c:if>>폴리코사놀</option>
												<option value="2" <c:if test="${productDto.cd_ctg_m == '2'}"> selected</c:if>>오메가-3</option>
												<option value="3" <c:if test="${productDto.cd_ctg_m == '3'}"> selected</c:if>>비타민/미네랄</option>
												<option value="4" <c:if test="${productDto.cd_ctg_m == '4'}"> selected</c:if>>유산균</option>
												<option value="5" <c:if test="${productDto.cd_ctg_m == '5'}"> selected</c:if>>글루코사민/MSM</option>
												<option value="6" <c:if test="${productDto.cd_ctg_m == '6'}"> selected</c:if>>루테인</option>
												<option value="7" <c:if test="${productDto.cd_ctg_m == '7'}"> selected</c:if>>코큐텐</option>
												<option value="8" <c:if test="${productDto.cd_ctg_m == '8'}"> selected</c:if>>아르기닌</option>
												<option value="9" <c:if test="${productDto.cd_ctg_m == '9'}"> selected</c:if>>밀크씨슬</option>
											</select>
										</c:when>
										
										<c:when test="${productDto.cd_ctg_b == '3'}">
											<select id="cd_ctg_b_3" name="cd_ctg_b_3" disabled>
												<option value="1" <c:if test="${productDto.cd_ctg_m == '1'}"> selected</c:if>>남성</option>
												<option value="2" <c:if test="${productDto.cd_ctg_m == '2'}"> selected</c:if>>여성</option>
											</select>
										</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
							<th>판매 상태</th>
								<td>
									<select id="cd_state_sale" name="cd_state_sale" disabled>
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
									${productDto.count_stock}
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >포인트 적립률</th>
								<td>
									${productDto.point_stack}
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >삭제 처리 여부</th>
								<td>
									${productDto.flg_delete}
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >판매 시작 일시</th>
								<td>
									<input type="text" id="dt_sale_start" name="dt_sale_start" value="${productDto.dt_sale_start}" readonly/>
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >판매 종료 일시</th>
								<td>
									<input type="text" id="dt_sale_end" name="dt_sale_end" value="${productDto.dt_sale_end}" readonly/>
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >할인율</th>
								<td>
									${productDto.discount}
								</td>
							</tr>
							<tr>
								<th style="width: 150px;" >마진률</th>
								<td>
									${productDto.margin_rate}
								</td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="mailbox-controls">
					<div class="btn-group" style="display: flex; justify-content: center; gap: 10px;">
						<input type="button" value="판매중지" class="btn btn-primary" style="width: 150px" onclick="javascript:stop();"/>
						<input type="button" value="판매 재개" class="btn btn-primary" style="width: 150px"onclick="javascript:re();" />
						<input type="button" value="품절" class="btn btn-primary" style="width: 150px" onclick="javascript:out();" />
						<input type="button" value="수정" class="btn btn-primary" style="width: 150px" onclick="javascript:modifyForm();" />
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
