<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/buy/list.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/backoffice.js"></script>
<style>
	.search-container {
		display: flex;
		align-items: center; /* 세로 가운데 정렬 */
		
	}
	
	.search-container select,
	.search-container input {
		height: 30px;
	}
	#modalOverlay {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: transparent;
		display: none;
		z-index: 9998;
		font-family: 돋움, Dotum, sans-serif !important;
	}
	
	#resultModal {
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		background-color: white;
		padding: 20px;
		width: 300px;
		border-radius: 4px;
		box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
		display: flex;
		flex-direction: column;
		align-items: center;
		text-align: center; /* 텍스트 가운데 정렬 */
		font-family: 돋움, Dotum, sans-serif !important;
		display: none;
		z-index: 9999;
	}
	
	#buttonContainer {
		width: 100%;
		text-align: center; /* 버튼을 가로 중앙 정렬 */
		margin-top: 15px;
	}
	
	#closeModalBtn {
		cursor: pointer;
	}
</style>
	<script>
	function consolegoList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/console/center/board/list.web";
		frmMain.submit();
	}
	
	function updateDeliveryStatus() {
		
		var seqBuyMstElements = document.getElementsByName("seq_buy_mst");
		var seqBuyMstArray = [];
		
		for (var i = 0; i < seqBuyMstElements.length; i++) {
			seqBuyMstArray.push(seqBuyMstElements[i].value);
		}
		
		var myData = {
			seq_buy_mst: seqBuyMstArray
		};
		
		if (confirm("해당 페이지의 상품을 배송 준비 상태로 변경하시겠습니까?")) {
			
			$.ajax({
				type: "POST",
				url: "/console/buy/updateDeliveryStatus.json",
				dataType: "json",
				contentType: "application/json; charset=UTF-8",
				data: JSON.stringify(myData),
				success: function(res) {
					
					$("#modalMessage").text(res.message);
					$("#modalOverlay").show();
					$("#resultModal").show();
				},
			});
		}
	}
	
	$(document).on('click', '#closeModalBtn', function() {
		
		$('#modalOverlay').hide();
		$('#resultModal').hide();
	});
	
	function validateSearch() {
		
		var searchKey = document.getElementById("_searchKey").value;
		var searchKeyState = document.getElementById("_searchKeyState").value;
		var searchKeyPay = document.getElementById("_searchKeyPay").value;
		var searchKeyDelivery = document.getElementById("_searchKeyDelivery").value;
		
		console.log("searchKey:", searchKey);
		console.log("searchKeyState:", searchKeyState);
		console.log("searchKeyPay:", searchKeyPay);
		console.log("searchKeyDelivery:", searchKeyDelivery);
		/*
		if (!searchKey) {
			alert("검색어를 입력하세요");
			return false;
		}
		
		if (!searchWordState && !searchWordPay && !searchWordDelivery) {
			alert("옵션을 선택하세요.");
			return false;
		}
		
		return true;
		*/
		var frmMain = document.getElementById("frmMain");
		
		frmMain.searchKey.setAttribute("value", searchKey);
		frmMain.cd_state.setAttribute("value", searchKeyState);
		frmMain.cd_state_pay.setAttribute("value", searchKeyPay);
		frmMain.cd_state_delivery.setAttribute("value", searchKeyDelivery);
		
		frmMain.action="/console/buy/list.web";
		frmMain.submit();
	}
	
	function goView(seq_buy_mst, mbr_nm) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("seq_buy_mst").value = seq_buy_mst;
		document.getElementById("mbr_nm").value = mbr_nm;
		
		frmMain.action="/console/buy/view.web";
		frmMain.submit();
	}
	
	function goModifyState(seq_buy_mst , position) {
		
		if (confirm("상태를 변경하시겠습니까?")) {
			
			var frmMain = document.getElementById("frmMain");
			
			cd_state			= document.getElementById("select_1_" + position).options[document.getElementById("select_1_" + position).selectedIndex].value;
			cd_state_delivery	= document.getElementById("select_3_" + position).options[document.getElementById("select_3_" + position).selectedIndex].value;
			
			// console.log("cd_state value:", cd_state);
			
			document.getElementById("seq_buy_mst").value = seq_buy_mst;
			// select_1의 선택된 value
			document.getElementById("cd_state").value = cd_state;
			// select_3의 선택된 value
			document.getElementById("cd_state_delivery").value = cd_state_delivery;
			
			frmMain.action="/console/buy/modifyProc.web";
			frmMain.submit();
		}
	}
	
	function reload() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.searchKey.setAttribute("value", "");
		frmMain.searchWord.setAttribute("value", "");
		frmMain.cd_state.setAttribute("value", "");
		frmMain.cd_state_pay.setAttribute("value", "");
		frmMain.cd_state_delivery.setAttribute("value", "");
		
		frmMain.action="/console/buy/list.web";
		frmMain.submit();
	}
	
	function goPage(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = value;
		frmMain.action="/console/buy/list.web";
		frmMain.submit();
	}
	
	function updateDeliveryStatusAll() {
	
		if (confirm("전체 상품을 배송 준비 상태로 변경하시겠습니까?")) {
		var frmMain = document.getElementById("frmMain");

		frmMain.action="/console/buy/updateDeliveryStatusAll.web";
		frmMain.submit();
		}
	}
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST">
<input type="hidden" name="seq_buy_mst"			id="seq_buy_mst" value="0"/>
<input type="hidden" name="cd_state"			id="cd_state" value="${paging.cd_state}"/>
<input type="hidden" name="cd_state_pay"		id="cd_state_pay" />
<input type="hidden" name="cd_state_delivery"	id="cd_state_delivery" />
<input type="hidden" name="searchKey"			id="searchKey" />
<input type="hidden" name="currentPage"			id="currentPage" value="${paging.currentPage}" />	
<input type="hidden" name="cd_bbs_type" 		id="cd_bbs_type" value="${paging.cd_bbs_type}" />
<input type="hidden" name="mbr_nm" 				id="mbr_nm" value="" />

	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header" style="display: flex; align-items: center; margin-left: 215px;">
		<h1>
		주문 관리
		</h1>
	</section>

	<!-- Main content -->
	<section class="content" style="display: flex; justify-content: center; align-items: center;">
	
		
		<!-- /.col -->
		<div class="col-md-9">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">주문 목록</h3>&nbsp;&nbsp;&nbsp;
					<div class="box-tools pull-right">
						<div class="has-feedback">
							<div style="display: flex; align-items: center; ">&nbsp;&nbsp;
							<div class="search-container">
								<select id="_searchKey">
									<option value="email"<c:if test="${paging.searchKey == 'email'}"> selected</c:if>>이메일</option>
									<option value="mbr_nm"<c:if test="${paging.searchKey == 'mbr_nm'}"> selected</c:if>>성명</option>
								</select>
								<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}" />
								&nbsp;&nbsp;
								구매 상태&nbsp;
								<select id="_searchKeyState">
									<option value="all" <c:if test="${paging.cd_state == 'all'}">selected</c:if>>전체</option>
									<option value="NULL"<c:if test="${paging.cd_state == 'NULL'}"> selected</c:if>>결제중단</option>
									<option value="1" <c:if test="${paging.cd_state == '1'}">selected</c:if>>결제완료</option>
									<option value="2" <c:if test="${paging.cd_state == '2'}">selected</c:if>>취소</option>
									<option value="3" <c:if test="${paging.cd_state == '3'}">selected</c:if>>교환</option>
									<option value="4" <c:if test="${paging.cd_state == '4'}">selected</c:if>>환불</option>
								</select>
								&nbsp;&nbsp;
								결제 상태&nbsp;
								<select id="_searchKeyPay">
									<option value="all" <c:if test="${paging.cd_state_pay == 'all'}">selected</c:if>>전체</option>
									<option value="NULL"<c:if test="${paging.cd_state_pay == 'NULL'}"> selected</c:if>>결제중단</option>
									<option value="N" <c:if test="${paging.cd_state_pay == 'N'}">selected</c:if>>실패</option>
									<option value="Y" <c:if test="${paging.cd_state_pay == 'Y'}">selected</c:if>>성공</option>
									<option value="C" <c:if test="${paging.cd_state_pay == 'C'}">selected</c:if>>취소</option>
								</select>
								&nbsp;&nbsp;
								배송 상태&nbsp;
								<select id="_searchKeyDelivery">
									<option value="all" <c:if test="${paging.cd_state_delivery == 'all'}">selected</c:if>>전체</option>
									<option value="NULL"<c:if test="${paging.cd_state_delivery == 'NULL'}"> selected</c:if>>결제중단</option>
									<option value="C" <c:if test="${paging.cd_state_delivery == 'C'}">selected</c:if>>판매 확인중</option>
									<option value="P" <c:if test="${paging.cd_state_delivery == 'P'}">selected</c:if>>배송 준비중</option>
									<option value="D" <c:if test="${paging.cd_state_delivery == 'D'}">selected</c:if>>배송중</option>
									<option value="Y" <c:if test="${paging.cd_state_delivery == 'Y'}">selected</c:if>>배송완료</option>
								</select>
								&nbsp;&nbsp;
								<input type="submit" onclick="validateSearch()" value="검색"/>	
							</div>	
							</div>
						</div>
					</div>
			<!-- /.box-tools -->
				</div>
			<!-- /.box-header -->
			<div class="box-body no-padding">
				<div class="table-responsive mailbox-messages">
					<table class="table table-hover table-striped">
						<tbody>
							<tr>
							<th style="width: 5%;text-align: center;">NO</th>
							<th style="text-align: center;">이메일(아이디)</th>
							<th style="width: 7%; text-align: center;">성명</th>
							<th style="width: 7%;text-align: center;">주문 번호</th>
							<th style="width: 25%;text-align: center;">구매상품 정보</th>
							<th style="width: 8%;text-align: center;">주문일</th>
							<th style="width: 10%;text-align: center;">구매상품 상태</th>
							<th style="width: 10%;text-align: center;">결제 상태</th>
							<th style="width: 15%;text-align: center;" colspan="2">배송 상태</th>
							</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="10">등록된 구매자(회원)가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list" varStatus="status">
							<tr>
								<td style="text-align: center;">
									${list.rnum}
									<input type="hidden" name="seq_buy_mst" value="${list.seq_buy_mst}"/>
								</td>
								<td class="txtRight" style="text-align: center;">
									<a href="javascript:goView(${list.seq_buy_mst}, '${list.mbr_nm}');">
										<bravomylifeTag:masking text="${list.email}" letter="*" count="13" mode="right" />
									</a>
								</td>
								<td style="text-align: center;">
								<bravomylifeTag:masking text="${list.mbr_nm}" letter="*" count="1" mode="left" />
								</td>
								<td style="text-align: center;">
									${list.seq_buy_mst}
								</td>
								<td style="text-align: center;">
									${list.buy_info}
								</td>
								<td style="text-align: center;">
									${list.dt_reg}
								</td>
								<!-- 주문 목록에서 각 주문의 상태(주문 상태, 결제 상태, 배송 상태)를 관리자가 선택할 수 있도록 -->
								<td style="text-align: center;">
									<select id="select_1_${status.index}" style="background:#F0F0F0">
										<option value="NULL"<c:if test="${list.cd_state == NULL}"> selected</c:if>>결제중단</option>
										<option value="1"<c:if test="${list.cd_state == '1'}"> selected</c:if>>결제완료</option>
										<option value="2"<c:if test="${list.cd_state == '2'}"> selected</c:if>>취소</option>
										<option value="3"<c:if test="${list.cd_state == '3'}"> selected</c:if>>교환</option>
										<option value="4"<c:if test="${list.cd_state == '4'}"> selected</c:if>>환불</option>
									</select>
								</td>
								<td style="text-align: center;">
									<select style="background:#F0F0F0" disabled>
										<option value="NULL"<c:if test="${list.cd_state_pay == NULL}"> selected</c:if>>결제중단</option>
										<option value="N"<c:if test="${list.cd_state_pay == 'N'}"> selected</c:if>>실패</option>
										<option value="Y"<c:if test="${list.cd_state_pay == 'Y'}"> selected</c:if>>성공</option>
										<option value="C"<c:if test="${list.cd_state_pay == 'C'}"> selected</c:if>>취소</option>
									</select>
								</td>
								<td style="text-align: center;">
									<select id="select_3_${status.index}" style="background:#F0F0F0">
										<option value="NULL"<c:if test="${list.cd_state_delivery == NULL}"> selected</c:if>>결제중단</option>
										<option value="C"<c:if test="${list.cd_state_delivery == 'C'}"> selected</c:if>>판매 확인중</option>
										<option value="P"<c:if test="${list.cd_state_delivery == 'P'}"> selected</c:if>>배송 준비중</option>
										<option value="D"<c:if test="${list.cd_state_delivery == 'D'}"> selected</c:if>>배송중</option>
										<option value="Y"<c:if test="${list.cd_state_delivery == 'Y'}"> selected</c:if>>배송완료</option>
									</select>
								</td>
								<td style="text-align: center;">
									<button onclick="goModifyState(${list.seq_buy_mst}, ${status.index});">변경</button>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
					</c:choose>
				</tbody>
				</table>
				<!-- /.table -->
				
				</div>
				<!-- /.mail-box-messages -->
			</div>
			<!-- /.box-body -->
			<div class="box-footer no-padding">
				<div class="mailbox-controls">
				<!-- /.btn-group -->
				<button type="button" class="btn btn-default btn-sm" onclick="reload();"><i class="fa fa-refresh"></i></button>
				&nbsp;&nbsp;
				<button type="button" onclick="updateDeliveryStatus()">현재 페이지 배송 상태 변경</button>
				<button type="button" onclick="updateDeliveryStatusAll()" style="margin-left:10px">전체 상품 배송 상태 변경</button>
					<span style="float: right;margin-right: 10px;margin-top: 5px;justify-content: center; ">전체 ${paging.totalLine}개 [${paging.currentPage}/${paging.totalPage} 페이지]</span>
				<div class="pull-right">
				<div class="btn-group">
					<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPage" />
				</div>
				<!-- /.btn-group -->
				</div>
				<!-- /.pull-right -->
				</div>
			</div>
			</div>
		  <!-- /. box -->
		</div>
	<!-- /.col -->
	
	<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<div id="modalOverlay"></div>
<div id="resultModal">
	<div id="modalMessage" style="font-weight: bold;"></div>
	<div id="buttonContainer">
		<button id="closeModalBtn">닫기</button>
	</div>
</div>
<!-- /Maincontent -->

	<%@ include file="/include/backoffice/footer.jsp" %>

	<%@ include file="/include/backoffice/sideBar.jsp" %>

	<%@ include file="/include/backoffice/js.jsp" %>
</form>
</body>
</html>
