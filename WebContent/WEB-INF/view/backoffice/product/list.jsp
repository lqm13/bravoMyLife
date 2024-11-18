<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/product/list.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"					uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
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
	
		function goPages(value) {
				
				var frmMain = document.getElementById("frmMain");
				
				frmMain.currentPage.setAttribute("value", value);
				frmMain.action="/console/product/list.web";
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
		
		function goView(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.seq_sle.setAttribute("value", value);
			
			frmMain.action = "/console/product/view.web";
			frmMain.submit();
		}
		
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST">
<input type="hidden" name="currentPage"	id="currentPage" 	value="${paging.currentPage}" />
<input type="hidden" name="corp_nm" 	id="corp_nm" 		value="${paging.corp_nm}" />
<input type="hidden" name="cd_bbs_type"	id="cd_bbs_type" 	value="${paging.cd_bbs_type}" />
<input type="hidden" name="seq_sle" 	id="seq_sle" 		value="0" />
<input type="hidden" name="cd_state"	id="cd_state" 		value="0"/>
	
	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
<div class="content-wrapper">
	<section class="content-header" style="display: flex; align-items: center; margin-left: 215px;">
		<h1>상품 리스트</h1>
	</section>
	<section class="content" style="display: flex; justify-content: center; align-items: center;">
		<div class="col-md-9">
			<div class="box box-primary">
				<div class="box-body no-padding">
						<div style="display: flex; gap: 10px;">
							<div class="input-group input-group-sm" style="width: 150px;">
								<div class="form-group">
									<select class="form-control" id="searchKey" name="searchKey" style="height: 35px;">
										<option value="sle_nm">상품명</option>
										<option value="corp_nm">브랜드명</option>
										<option value="sle_nm_and_corp_nm">상품명 및 브랜드명</option>
									</select>
								</div>
							</div>
							<div class="input-group input-group-sm" style="width: 150px;">
								<div class="form-group">
									<select  class="form-control" id="cd_ctg_b" name="cd_ctg_b" onchange="updateCategoryMinor()" style="height: 35px;">
										<option value="0">카테고리 대분류</option>
										<option value="1">기능별</option>
										<option value="2">성분별</option>
										<option value="3">대상별</option>
									</select>
								</div>
							</div>
							<div class="input-group input-group-sm" style="width: 150px;">
								<div class="form-group">
									<select class="form-control" id="cd_ctg_m" name="cd_ctg_m" style="height: 35px;">
										<option value="0">카테고리 중분류</option>
									</select>
								</div>
							</div>
							<div class="input-group input-group-sm" style="width: 150px;">
								<div class="form-group">
									<select class="form-control" id="cd_state_sale" name="cd_state_sale" style="height: 35px;">
										<option value="0">상품 상태</option>
										<option value="1">대기</option>
										<option value="2">판매</option>
										<option value="9">중지</option>
										<option value="9">재고 소진</option>
									</select>
								</div>
							</div>
							<div class="input-group input-group-sm" style="width: 150px; display: flex; align-items: center  height: 30px;">
								<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}" class="form-control" placeholder="Search" style="flex: 1  height: 30px;">
								<div class="input-group-btn">
									<button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
								</div>
							</div>
						</div>
				</div>
				<div class="box-body table-responsive no-padding">
				<div class="brdInfo">전체 ${paging.totalLine}개[${paging.currentPage}/${paging.totalPage} 페이지]</div>
					<table class="table table-hover">
						<tr>
							<th>NO</th>
							<th>상품명</th>
							<th> 상품브랜드</th>
							<th>상품 상태</th>
							<th>상품 가격</th>
							<th>상품 등록일</th>
						</tr>
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td colspan="6" style="text-align: center; vertical-align: middle;">등록된 상품이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="list">
								<tr>		
									<td>
										${list.rnum}
									</td>
									<td>
										<a href="javascript:goView(${list.seq_sle});" style="color: black;">
											<bravomylifeTag:substring text="${fn:escapeXml(list.sle_nm)}" length="60" />
										</a>
									</td>
									<td>
										${list.corp_nm}
									</td>
									<td>
										<c:choose>
											<c:when test="${list.cd_state_sale == '1'}">
												대기
											</c:when>
											<c:when test="${list.cd_state_sale == '2'}">
												판매
											</c:when>
											<c:when test="${list.cd_state_sale == '3'}">
												판매중지
											</c:when>
											<c:when test="${list.cd_state_sale == '9'}">
												품절
											</c:when>
										</c:choose>
									</td>
									<td>
										<fmt:formatNumber value="${list.price_sale}" type="number" />원
									</td>
									<td>
										${list.dt_reg}
									</td>
								</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important; font-size: 20px; letter-spacing: 2px;">
					<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPages"/>
					</div>
					<br>
						<div class="btn-group" style="display: flex; justify-content: center; gap: 10px;">
						<a href="javascript:goProductReg()" class="btn btn-primary" style="width: 150px;">상품 등록</a>
						</div>
					<br>
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
