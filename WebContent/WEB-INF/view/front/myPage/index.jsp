<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/myPage/" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
	
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>
		
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/front.js"></script>
	<script type="text/javascript" src="/js/package/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/package/tinymce.js"></script>		
	<script>

	function goWriteForm(value, value2, value3) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.cd_ctg_m.setAttribute("value", value2);
		frmMain.cd_ctg_b.setAttribute("value", value3);
		frmMain.action="/front/buy/writeForm.web";
		frmMain.submit();
	}
	
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/front/center/board/list.web";
		frmMain.submit();
	}
	
	function goMyList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("cd_bbs_type").value = value;
		
		frmMain.action = "/front/center/board/myPageNotice/list.web";
		frmMain.submit();
	}
	</script>
</head>
<body>
<form id="frmMain" method="POST" class="checkout__form">
<input type="hidden" name="seq_sle"				id="seq_sle"			value="0"/>
<input type="hidden" name="cd_ctg_m"			id="cd_ctg_m"/>
<input type="hidden" name="cd_ctg_b"			id="cd_ctg_b"/>
<input type="hidden" name="cd_bbs_type"			id="cd_bbs_type"		value="0"/>
<input type="hidden" name="phone"				id="phone"/>
<input type="hidden" name="type"				id="type"/>
<input type="hidden" name="searchWord"			id="searchWord"/>

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
		<div class="row"style="display: flex; justify-content: center; align-items: center;">
			<div class="col-lg-12">
				<div class="mydiv1" id="myDiv1" style="width: 100%; display: flex; justify-content: space-between; align-items: center;margin-bottom:100px">
					<span class="styled-span" style="width: 60%; display: flex; justify-content: center; align-items: center;font-weight:700;">
					<span style="font-size: 30px; font-weight: 700; color: #341d08;">${memberDto.mbr_nm}</span>&nbsp;님 반갑습니다.</span>
					<span class="styled-span" style="width: 40%; display: flex; justify-content: center; align-items: center;font-weight:700;">포인트:&nbsp;
					<span style="font-size: 30px; font-weight: 700; color: #341d08;">${memberDto.total_point}</span></span>
				</div>	
				<div>
				<div>
					<h2 class="h2">진행 중인 주문</h2>
					<p class="sub-text">최근 30일 내에 진행중인 주문정보입니다.</p>
				</div>
					<div>
						<div class="order-step-box">
							<ol>
								<li>
									<p class="order-step-box-text">판매 확인중</p>
										<c:if test="${buyMasterDto.delivery_total_c == 0}">
											<div class="order-step-box-num">
												<span>${buyMasterDto.delivery_total_c}</span>
											</div>
										</c:if>
										<c:if test="${buyMasterDto.delivery_total_c != 0}">
											<div class="order-step-box-num-color">
												<span>${buyMasterDto.delivery_total_c}</span>
											</div>
										</c:if>
									<span class="fa fa-fw fa-arrow-right" style="display: block;position: absolute;top:40px;right: -30px;color:#717171;font-size: 40px;">&nbsp;
									</span>
								</li>
								<li>
									<p class="order-step-box-text">배송준비중</p>
										<c:if test="${buyMasterDto.delivery_total_p == 0}">
											<div class="order-step-box-num">
												<span>${buyMasterDto.delivery_total_p}</span>
											</div>
										</c:if>
										<c:if test="${buyMasterDto.delivery_total_p != 0}">
											<div class="order-step-box-num-color">
												<span>${buyMasterDto.delivery_total_p}</span>
											</div>
										</c:if>
									<span class="fa fa-fw fa-arrow-right" style="display: block;position: absolute;top:40px;right: -30px;color:#717171;font-size: 40px;">&nbsp;
									</span>
								</li>
								<li>
									<p class="order-step-box-text">배송중</p>
										<c:if test="${buyMasterDto.delivery_total_d == 0}">
											<div class="order-step-box-num">
												<span>${buyMasterDto.delivery_total_d}</span>
											</div>
										</c:if>
										<c:if test="${buyMasterDto.delivery_total_d != 0}">
											<div class="order-step-box-num-color">
												<span>${buyMasterDto.delivery_total_d}</span>
											</div>
										</c:if>
									<span class="fa fa-fw fa-arrow-right" style="display: block;position: absolute;top:40px;right: -30px;color:#717171;font-size: 40px;">&nbsp;
									</span>
								</li>
								<li>
									<p class="order-step-box-text">배송완료</p>
										<c:if test="${buyMasterDto.delivery_total_y == 0}">
											<div class="order-step-box-num">
												<span>${buyMasterDto.delivery_total_y}</span>
											</div>
										</c:if>
										<c:if test="${buyMasterDto.delivery_total_y != 0}">
											<div class="order-step-box-num-color">
												<span>${buyMasterDto.delivery_total_y}</span>
											</div>
										</c:if>
								</li>
							</ol>
							<div class="order-total-status">
								<div class="order-total-status-item">
									<span class="title">취소</span>
									<span class="num"><span>${buyMasterDto.cd_state_total_2}</span>건</span>
								</div>
								<div class="order-total-status-item">
									<span class="title">교환</span>
									<span class="num"><span>${buyMasterDto.cd_state_total_3}</span>건</span>
								</div>
								<div class="order-total-status-item">
									<span class="title">환불</span>
									<span class="num"><span>${buyMasterDto.cd_state_total_4}</span>건</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<br/>
<br/>
<br/>
<br/>
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
</form>
</body>
</html>