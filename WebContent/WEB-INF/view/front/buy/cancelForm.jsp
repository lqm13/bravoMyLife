<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/cancelForm.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
<style>
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
	width: 600px;
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
	background: white;
	color: #346aff !important;
	border: 1px solid #346aff;
	padding: 4px 12px;
	border-radius: 4px;
	font-weight: 600;
	font-size: 14px;
	font-family: 돋움, Dotum, sans-serif !important;
	font-weight: normal;
}
</style>
	<script>
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/front/center/board/list.web";
		frmMain.submit();
	}
	</script>
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>
	
	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>
<body>
<form id="frmMain" method="POST" class="checkout__form">
<input type="hidden" 	id="seq_buy_mst"		value="${cancel.seq_buy_mst}"/>
<input type="hidden" 	id="seq_pay"			value="${cancel.seq_pay}"/>
<input type="hidden" 	id="deal_num"			value="${cancel.deal_num}"/>
<input type="hidden" 	name="type"				id="type"/>
<input type="hidden" 	name="searchWord"		id="searchWord" />
<input type="hidden" 	name="cd_ctg_m"			id="cd_ctg_m"/>
<input type="hidden" 	name="cd_ctg_b"			id="cd_ctg_b"/>
<input type="hidden" 	name="cd_bbs_type"		id="cd_bbs_type"/>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
		<%@ include file="/include/front/mygnb.jsp" %>
	<!-- Breadcrumb End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad" >
		<div class="container">
			<div class="row"style="display: flex; justify-content: center; align-items: center;">
				<div class="col-lg-8">
					<c:if test="${cancel.cd_state == 1}">
						<h5 style="font-family: 'Noto Sans KR', sans-serif !important; padding-left: 24px !important; font-size :30px; border-bottom: 0px !important; padding-bottom: 0px !important;">주문 취소</h5>
					</c:if>
					<c:if test="${cancel.cd_state == 2}">
						<h5 style="font-family: 'Noto Sans KR', sans-serif !important; padding-left: 24px !important; font-size :30px; border-bottom: 0px !important; padding-bottom: 0px !important;"><span style="font-weight:normal !important; font-size: 20px !important;">${cancel.dt_upt}의</span > 주문 취소가 <span style="font-weight:normal !important; font-size: 20px !important;">${cancel.dt_reg}에</span> 처리중입니다.</h5>
					</c:if>
					<c:if test="${cancel.cd_state == 3}">
						<h5 style="font-family: 'Noto Sans KR', sans-serif !important; padding-left: 24px !important; font-size :30px; border-bottom: 0px !important; padding-bottom: 0px !important;"><span style="font-weight:normal !important; font-size: 20px !important;">${cancel.dt_upt}의</span > 교환 신청이 <span style="font-weight:normal !important; font-size: 20px !important;">${cancel.dt_reg}에</span> 처리중입니다.</h5>
					</c:if>
					<c:if test="${cancel.cd_state == 4}">
						<h5 style="font-family: 'Noto Sans KR', sans-serif !important; padding-left: 24px !important; font-size :30px; border-bottom: 0px !important; padding-bottom: 0px !important;"><span style="font-weight:normal !important; font-size: 20px !important;">${cancel.dt_upt}의</span > 환불 신청이 <span style="font-weight:normal !important; font-size: 20px !important;">${cancel.dt_reg}에</span> 처리중입니다.</h5>
					</c:if>
					<div class="cancle-layout">	
						<div class="cancle-top" style=" margin-bottom: 24px !important;">
							<div class="cancle-body" style="font-weight: bold !important;">
								상품정보
							</div>
							<div class="cancle-middle">
								<div style="margin-bottom: 8px !important;">
								<c:forEach var="cancelList" items="${cancelList}">
								<c:forEach var="cancelDatas" items="${cancelList.buyDatas}">
									<div style="display: flex !important; flex-direction: row !important;">
										<div style="position: relative !important; width: 64px !important; margin-right: 16px !important;">
											<img style="width: 64px !important; height: 64px !important;" src="/img/product/${cancelDatas.img}">
										</div>
										<div style="flex: 1 1 0% !important; display: flex !important; user-select: none !important; overflow: hidden !important; align-items: normal !important;">
											<div style="display: flex !important; flex-direction: column !important;">
												<div style="display: flex !important; padding-bottom: 8px !important; line-height: 1.25rem !important;">
													${cancelDatas.sle_nm}
												</div>
												<div style="color: rgb(85, 85, 85) !important; padding-bottom: 0px !important;">
												<fmt:formatNumber value="${cancelDatas.price}" type="number" />원 ${cancelDatas.count}개
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								</c:forEach>
								</div>
							</div>
						</div>
						<span class="cancle-subSpan">환불 정보를 확인해주세요</span>
						<div class="cancle-top" style="margin-bottom: 24px !important;">
							<div class="cancle-body" style="font-weight: bold !important;">
								환불안내
							</div>
							<div class="cancle-middle" style="margin-bottom: 8px !important;">
								<div style="display: flex !important; flex-direction: row !important; width: 100%; justify-content: space-between !important;">
									<div style="display: flex !important; flex-direction: column !important;">
										<div class="cancle-footer" style="margin-bottom: 8px !important;">
											<div style="box-sizing: border-box !important; display: flex !important; margin: 0 !important; padding: 0 !important;">
												상품금액
											</div>
										</div>
									</div>
									<div style="display: flex !important; flex-direction: column !important; text-align: right !important;">
										<div class="cancle-footer" style="margin-bottom: 8px !important;">
											<div style="font-weight: bold !important; font-weight: bold;box-sizing: border-box !important; display: flex !important; margin: 0 !important; padding: 0 !important;">
												<fmt:formatNumber value="${cancel.buy_price}" type="number" /> 원
											</div>
										</div>
									</div>
								</div>
								<div style="display: flex !important; flex-direction: row !important; width: 100%; justify-content: space-between !important;">
									<div style="display: flex !important; flex-direction: column !important;">
										<div class="cancle-footer" style="margin-bottom: 8px !important;">
											<div style="box-sizing: border-box !important; display: flex !important; margin: 0 !important; padding: 0 !important;">
												배송비
											</div>
										</div>
									</div>
									<div style="display: flex !important; flex-direction: column !important; text-align: right !important;">
										<div class="cancle-footer" style="margin-bottom: 8px !important;">
											<div style="font-weight: bold !important; box-sizing: border-box !important; display: flex !important; margin: 0 !important; padding: 0 !important;">
												-2500 원
											</div>
										</div>
									</div>
								</div>
								<div class="cancle-line"></div>
								<div class="cancle-bottom">
									<div style="display: flex !important; flex-direction: row !important; width: 100%; justify-content: space-between !important;">
										<div style="display: flex !important; flex-direction: column !important;">
											<div class="cancle-footer" style="margin-bottom: 8px !important;">
												<div style="font-weight: bold !important; box-sizing: border-box !important; display: flex !important; margin: 0 !important; padding: 0 !important;">
													환불 예상금액
												</div>
											</div>
										</div>
										<div style="display: flex !important; flex-direction: column !important; text-align: right !important;">
											<div class="cancle-footer" style="margin-bottom: 8px !important;">
												<div style="font-weight: bold !important; color: red !important; box-sizing: border-box !important; display: flex !important; margin: 0 !important; padding: 0 !important;">
													<fmt:formatNumber value="${cancel.total_price_sum}" type="number" /> 원
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div style="display: flex; gap: 20px; justify-content: flex-end;">
						<c:choose>
							<c:when test="${cancel.cd_state == 1}">
								<div style="margin-bottom: 24px; text-align: right;">
									<button type="button" onclick="cancelOrder('2')" class="cancle-button">주문 취소</button>
								</div>
								<div style="margin-bottom: 24px; text-align: right;">
									<button type="button" onclick="cancelOrder('3')" class="cancle-button" style="background: white !important; color: #346aff !important; border: 1px solid #346aff;">교환 신청</button>
								</div>
								<div style="margin-bottom: 24px; text-align: right;">
									<button type="button" onclick="cancelOrder('4')" class="cancle-button" style="background: white !important; color: #346aff !important; border: 1px solid #346aff;">환불 신청</button>
								</div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div id="modalOverlay"></div>
	<div id="resultModal">
		<div id="modalMessage" style="font-weight: bold;"></div>
		<div id="buttonContainer">
			<button type="button" id="closeModalBtn">닫기</button>
		</div>
	</div>
<!-- Checkout Section end -->

	<!-- Instagram Begin -->
	<!-- 페이지 하단 이미지가 나열 되는 곳 data-setbg="/img/instagram/insta-1.jpg" 이 부분을 우리 상품 이미지로 -->
	<%@ include file="/include/common/footerpic.jsp" %>
	<!-- Instagram End -->
	<%@ include file="/include/common/footer.jsp" %>
	<!-- Footer Section Begin -->
	<%@ include file="/include/common/footer-copyright.jsp" %>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>	
<script>
var shouldCancelHistory = false;

function cancelOrder(value) {
	var cd_state = value;
	
	var myData = {
		deal_num: $("#deal_num").val(),
		seq_buy_mst: $("#seq_buy_mst").val(),
		seq_pay: $("#seq_pay").val(),
		cd_state: cd_state
	};
	
	$.ajax({
		type: "POST",
		url: "/front/pay/cancleOrder.json",
		dataType: "json",
		contentType: "application/json; charset=UTF-8",
		data: JSON.stringify(myData),
		success: function(res) {
			
			$("#modalMessage").text(res.message);
			$("#modalOverlay").show();
			$("#resultModal").show();
			
			if (res.code === "success") {
				shouldCancelHistory = true;
			} else {
				shouldCancelHistory = false;
			}
		},
	});
}
$(document).on('click', '#closeModalBtn', function() {
	$('#modalOverlay').hide();
	$('#resultModal').hide();
	
	if (shouldCancelHistory) {
		cancelHistory();
	}
});

function cancelHistory() {
	var frmMain = document.getElementById("frmMain");
	frmMain.action = "/front/buy/cancelhistory.web";
	frmMain.submit();
}
</script>
</form>
</body>
</html>