<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/deliveryView.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<style>
	.order-info {
		flex: 0 0 auto;
	}
	
	.order-details {
		display: flex;
		flex-direction: column;
		gap: 10px;
	}
	
	@media (max-width: 768px) {
		.order-info {
			width: 100%;
			margin-bottom: 15px;
			text-align: left;
		}
		.order-details {
			width: 100%;
			display: flex;
			flex-direction: column;
			gap: 10px;
		}
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
<input type="hidden" name="type"			id="type"/>
<input type="hidden" name="searchWord"		id="searchWord" />
<input type="hidden" name="cd_ctg_m"		id="cd_ctg_m"/>
<input type="hidden" name="cd_ctg_b"		id="cd_ctg_b"/>
<input type="hidden" name="cd_bbs_type"		id="cd_bbs_type"/>
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
					<h5 style="font-size :30px; border-bottom: 0px !important; padding-bottom: 0px !important;">배송 조회</h5>
					<div class="delivery_div_head" style="border-radius: 2px !important; padding: 22px 0px 17px !important;">
						<div style="font-size: 28px !important;">
						${memberDto.dt_reg} <span style="font-size: 18px !important;"> 주문하신</span>
						</div>
						<c:if test="${memberDto.cd_state_mst == '3'}">
							<div style="margin-top: 8px !important; font-size: 18px !important;">
								고객님의 상품이 <span style="font-size: 28px !important;">교환 확인중</span>입니다.
							</div>
						</c:if>
						<c:if test="${memberDto.cd_state_mst != '3'}">
							<c:if test="${memberDto.cd_state_delivery == 'C'}">
								<div style="margin-top: 8px !important; font-size: 18px !important;">
									고객님의 상품이 <span style="font-size: 28px !important;">판매 확인중</span>입니다.
								</div>
							</c:if>
							<c:if test="${memberDto.cd_state_delivery == 'P'}">
								<div style="margin-top: 8px !important; font-size: 18px !important;">
									고객님의 상품이 <span style="font-size: 28px !important;">배송 준비중</span>입니다.
								</div>
							</c:if>
							<c:if test="${memberDto.cd_state_delivery == 'D'}">
								<div style="margin-top: 8px !important; font-size: 18px !important;">
									고객님의 상품이 <span style="font-size: 28px !important;">배송중</span>입니다.
								</div>
							</c:if>
							<c:if test="${memberDto.cd_state_delivery == 'Y'}">
								<div style="margin-top: 8px !important; font-size: 18px !important;">
									고객님의 상품이 <span style="font-size: 28px !important;">배송 완료</span> 되었습니다.
								</div>
							</c:if>
						</c:if>
					</div>
					<div class="delivery_div_head" style="background: white !important; padding: 15px 10px 10px !important; border-radius: 2px !important;">
						<div style="display: flex; flex-wrap: wrap; align-items: flex-start; text-align: left; padding-bottom: 25px; padding-top: 15px;">
							<div class="order-info">
								<span style="margin-right: 30px;">주문 정보</span>
							</div>
							<div class="order-details">
								<c:forEach var="buyDelivery" items="${buyDelivery}">
									<c:forEach var="buyDatas" items="${buyDelivery.buyDatas}">
										<div style="display: flex; align-items: center;">
											<div>${buyDatas.sle_nm}</div>
											<span style="margin-left: 15px; white-space: nowrap;">${buyDatas.count}개</span>
										</div>
									</c:forEach>
								</c:forEach>
							</div>
						</div>
						<div style="text-align: left;">
							<span style="margin-right: 30px !important;">받는 사람</span>${memberDto.mbr_nm}
						</div>
						<div style="text-align: left;">
							<span style="margin-right: 30px !important;">받는 주소</span>${memberDto.post}<span style="padding-left: 10px !important;">${memberDto.addr1}</span>
						</div>
						<div style="text-align: left;">
							<span style="margin-right: 30px !important;">상세 주소</span>${memberDto.addr2}
						</div>
						<div style="text-align: left; padding-top: 15px !important;">
							<c:if test="${memberDto.delivery_request == ''}">
							<span style="margin-right: 30px !important;">요청 사항</span>-
							</c:if>
							<c:if test="${memberDto.delivery_request != ''}">
							<span style="margin-right: 30px !important;">요청 사항</span>${memberDto.delivery_request}
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
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
</script>
</form>
</body>
</html>