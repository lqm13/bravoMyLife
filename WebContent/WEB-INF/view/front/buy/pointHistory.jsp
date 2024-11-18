<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/pointHistory.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
	
	function goWriteForm(value, value2, value3) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.cd_ctg_m.setAttribute("value", value2);
		frmMain.cd_ctg_b.setAttribute("value", value3);
		frmMain.action="/front/buy/writeForm.web";
		frmMain.submit();
	}
	
	function goPages(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.currentPage.setAttribute("value", value);
		frmMain.action="/front/buy/pointHistory.web";
		frmMain.submit();
	}
	
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
<form id="frmMain" method="POST">
<input type="hidden" name="seq_sle"			id="seq_sle" value="0"/>
<input type="hidden" name="type"			id="type"/>
<input type="hidden" name="searchWord"		id="searchWord" />
<input type="hidden" name="cd_ctg_m"		id="cd_ctg_m"/>
<input type="hidden" name="cd_ctg_b"		id="cd_ctg_b"/>
<input type="hidden" name="cd_bbs_type"		id="cd_bbs_type" value = "0"/>
<input type="hidden" name="currentPage"		id="currentPage"	value="${paging.currentPage}"/>
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
	<section class="checkout spad" style="min-height: calc(100vh - 1px);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12" style="padding: 0;">
					<div class="col-lg-6 col-md-6 col-sm-6" style="margin-bottom: 100px !important; padding: 0px !important; max-width: 100% !important; flex: 0 0 100% !important; border-bottom: none;">
						<c:choose>
							<c:when test="${empty pCount || pCount == 0}">
							<div class="cart__total__procced" style="padding-left: 15px !important; text-align: right; display: flex; justify-content: center; align-items: center;">
								<div style="text-align: center;">
									<p style="margin-top: 0px !important; margin-bottom: 0px !important;">
										<span style="font-size: 16px; text-align: center !important; font-family: 'Noto Sans KR', sans-serif !important;">
											포인트 이력이 없습니다.
										</span>
									</p>
								</div>
							</c:when>
							<c:otherwise>
							<div class="cart__total__procced" style="padding-left: 15px !important; text-align: right; display: flex; justify-content: space-between; align-items: center;">
								<div style="text-align: left;">
										<p style="margin-top: 0px !important; margin-bottom: 0px !important;">
											<span style="font-size: 16px;">
												고객님께서는 <span id="totalItems" style="font-size: 24px; font-weight: 600 !important;">${eDate} </span>일  ~  
												<span id="totalPriceFinal" style="font-size: 24px; font-weight: 600 !important;"> ${lDate}</span>일 동안 
											</span>
											<span style="font-size: 16px;">
												총 <span id="totalItems" style="font-size: 24px;">${pCount}</span>개 상품에서
														<img src="/img/cartbtn/totalPoint.png" style="padding-left: 10px; padding-right: 10px; vertical-align: -4px;">
													<span id="totalPriceFinal" style="font-size: 24px; font-weight: 600 !important; color: #346aff !important;"><fmt:formatNumber value="${tPoint}" type="number" /></span> 포인트를 적립했습니다.
											</span>
										</p>
								</div>
							</c:otherwise>
						</c:choose>
						</div>
					</div>
					<h6 class="lowgnb-title" style="padding-bottom: 5px; text-align: left; font-size: 30px;">포인트 이력</h6>
					<div class="mypage-header">
						<h6 class="cart-title" style="font-size:15px">*이미지를 클릭하면 상품으로 이동합니다.</h6>
					</div>
					<div class="shop__cart__table" style="border: 1px solid #dbdbdb; border-radius: 4px;margin-bottom:100px">
						<table id="productBasket" class="cart-table">
							<thead style="border-bottom: 1px solid #dbdbdb !important;">
								<tr style="border-color: #707070 !important;">
									<th class="cart-th" style="width: 10%">
									<th class="cart-th" >주문정보</th>
									<th class="cart-th" style="width: 15%">수량</th>
									<th class="cart-th" style="width: 15%">개별포인트</th>
									<th class="cart-th" style="width: 15%">합계포인트</th>
									<th class="cart-th" style="width: 10%">적립일</th>
								</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${empty list}">
									<tr style="text-align: center; border-bottom: 1px solid #707070;">
										<td colspan="6"> 포인트 이력이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="list" items="${list}" >
										<tr style="border: 0;">
											<td class="cart-td" style="text-align: center; vertical-align: middle;">
												<div class="cart-div" style="width: 80px; height: 80px; overflow: hidden; display: inline-block;">
													<a href="javascript:goWriteForm('${list.seq_sle}', '${list.cd_ctg_m}', '${list.cd_ctg_b}');">
														<img class="cart-img" src="/img/product/${list.img}" class="cart-img">
													</a>
												</div>
											</td>
											<td class="cart-td" style="text-align: center !important;">
												${list.sle_nm}
											</td>
											<td class="cart-td">
												${list.count} 개
											</td>
											<td class="cart-td">
												<span style="color: #346aff !important;"><fmt:formatNumber value="${list.point}" type="number" /></span> 포인트
											</td>
											<td class="cart-td">
												<span style="color: #346aff !important; font-size: 18px !important; font-weight: bold !important;"><fmt:formatNumber value="${list.point_value}" type="number" /></span> 포인트
											</td>
											<td class="cart-td">
												${list.dt_reg}
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
					</div>
					<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;">
						<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPages" />
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