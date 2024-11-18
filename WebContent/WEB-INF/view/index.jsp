<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/index.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag" uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<style>
	.categories__item {
	position: relative;
	background-size: cover;
	background-position: center;

	}
	
	.categories__item::before {
		content: "";
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(255, 255, 255, 0.3); /* 반투명 흰색 덧씌우기 */
		z-index: 1;
	}
	
	.categories__text {
		position: relative;
		z-index: 2; /* 텍스트를 덮어씌운 반투명 레이어 위에 표시 */
	}
	
	.categories__text_2 {
		position: relative;
		z-index: 2; /* 텍스트를 덮어씌운 반투명 레이어 위에 표시 */
	}
	
	.categories__text_3 {
		position: relative;
		z-index: 2; /* 텍스트를 덮어씌운 반투명 레이어 위에 표시 */
	}
	
	.categories__text_4 {
		position: relative;
		z-index: 2; /* 텍스트를 덮어씌운 반투명 레이어 위에 표시 */
	}
		
	
	</style>
	<script>
	function goWriteForm(value, value2, value3) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.cd_ctg_m.setAttribute("value", value2);
		frmMain.cd_ctg_b.setAttribute("value", value3);
		frmMain.action="/front/buy/writeForm.web";
		frmMain.submit();
	}
	
	function goTypeT(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.type.setAttribute("value", value);
			frmMain.action = "/front/sale/total_list.web";
			frmMain.submit();
		}
	
	function goTypeTx(value) {
			
		var first_cd_ctgDesktop		= document.getElementById("first_cd_ctg").value;
		var second_cd_ctgDesktop	= document.getElementById("second_cd_ctg").value;
		
		var first_cd_ctgAndroid		= document.getElementById("first_cd_ctg_android").value;
		var second_cd_ctgAndroid	= document.getElementById("second_cd_ctg_android").value;
		
		var first_cd_ctg;
		var second_cd_ctg
		
		if (value == 'pc') {
			
			first_cd_ctg	= 	first_cd_ctgDesktop
			second_cd_ctg	= 	second_cd_ctgDesktop
		}
		else if (value == 'mobile') {	
			first_cd_ctg	= 	first_cd_ctgAndroid
			second_cd_ctg	= 	second_cd_ctgAndroid
		}	
		
		var searchWordDesktop = document.getElementById("_searchWord_desktop").value;
		var searchWordAndroid = document.getElementById("_searchWord_android").value;
		
		var _searchWord;
		
		if (value == 'pc') {
			_searchWord = searchWordDesktop;
		}
		else if (value == 'mobile') {
			_searchWord = searchWordAndroid;
		}
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_ctg_b.setAttribute("value", first_cd_ctg);
		frmMain.cd_ctg_m.setAttribute("value", second_cd_ctg);
		frmMain.searchWord.setAttribute("value", _searchWord);
		
		frmMain.type.setAttribute("value", value);
		frmMain.action = "/front/sale/total_list.web";
		frmMain.submit();
	}
	
	function goTypeF(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", value);
		frmMain.action = "/front/sale/function_list.web";
		frmMain.submit();
	}
	
	function goTypeI(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", value);
		frmMain.action = "/front/sale/ingredient_list.web";
		frmMain.submit();
	}
	
	function goTypeG(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", value);
		frmMain.action = "/front/sale/gender_list.web";
		frmMain.submit();
	}
			
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/front/center/board/list.web";
		frmMain.submit();
	}
	
	function goEvent() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/popup/event.web";
		frmMain.submit();
	}
	
	function goArs() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/popup/ars.web";
		frmMain.submit();
	}

	</script>
<!-- Google Font -->
<%@ include file="/include/common/webfont.jsp" %>

<!-- Css Styles -->
<%@ include file="/include/common/css.jsp" %>

<style>
/*
	.categories__text.special-background {
	background-color: rgba(255, 255, 255, 0.5);
	padding: 10px;
	display: inline-block;
}

.categories__text.special-background h1,
.categories__text.special-background p {
	color: black;
}
*/
</style>
</head>

<body>
<form id="frmMain" method="POST">
<input type="hidden" name="corp_nm"			id="corp_nm" />
<input type="hidden" name="prd_type"		id="prd_type" />
<input type="hidden" name="filter"			id="filter" />
<input type="hidden" name="cd_ctg_m"		id="cd_ctg_m" />
<input type="hidden" name="cd_ctg_b"		id="cd_ctg_b" />
<input type="hidden" name="seq_sle"			id="seq_sle" value="0"/>
<input type="hidden" name="type"			id="type"/>
<input type="hidden" name="cd_bbs_type"		id="cd_bbs_type" value="0"/>
<input type="hidden" name="searchWord"		id="searchWord" />
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->

	<!-- Banner Section Begin -->
	<section class="banner set-bg" data-setbg="img/banner/banner9.png">
		<div class="container">
			<div class="row" >
				<div class="col-xl-7 col-lg-8 ">
					<div class="banner__slider owl-carousel">
						<div class="banner__item">
							<div class="banner__text">
								<span>겨울맞이 특별 할인 - 최대 50% OFF! </span>
								<h1>이벤트</h1>
								<a href="javascript:goEvent()">바로가기</a>
							</div>
						</div>
						<div class="banner__item">
							<div class="banner__text">
								<span>건강 목표 달성! 나만의 맞춤 영양제로 건강을 지키세요</span>
								<h1>맞춤 건강 관리</h1>
								<a href="javascript:goHealth()">바로가기</a>
							</div>
						</div>
						<div class="banner__item">
							<div class="banner__text">
								<span>인터넷 주문이 어려우시다면? <br> ※휴대폰에서만 주문가능※</span>
								<h1>ARS 전화주문</h1>
								<a href="javascript:goArs()">바로가기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Banner Section End -->

	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container-fluid" style="padding-right: 0px !important; padding-left: 0px !important;">
		<div class="col-lg-12">
			<div class="row"style="margin-right: -30px;">
				<div class="col-lg-7 c p-0" style="height: 40vh; overflow: hidden;">
					<div class="categories__item categories__large__item set-bg"
						data-setbg="img/categories/home9.jpg" style="height: 100%;">
						<div class="categories__text" style="text-align: left; position: absolute; bottom: -20;">
							<div class="categories__text special-background" >
								<h1 style="font-weight: bold; color: black; font-size: 30px;">나만의 맞춤 건강 추천</h1>
								<p style="font-weight: bold; font-size: 18px; ">건강 설문을 진행하고 나에게 맞는 영양제를 추천받아 보세요!</p>
								<a href="javascript:goSurvey()" style="font-size: 18px;">바로가기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-5 c p-0" style="height: 40vh;">
							<div class="categories__item set-bg"
								data-setbg="img/categories/home4.jpg" style="height: 100%;">
								<div class="categories__text" style="text-align: left; position: absolute; bottom: -20;">
									<div class="categories__text special-background" >
										<h4 style="font-weight: bold; font-size: 27px;">안심 조회 서비스</h4>
										<p style="font-weight: bold; font-size: 18px;">구매하고 싶은 영양제가 인증 허가를 받은 <br> 안심상품인지 확인하세요</p>
										<a href="javascript:goSearch()" style="font-size: 18px;">바로가기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>		
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-4 col-md-6 col-sm-6 p-0" >
							<div class="categories__item set-bg" style=" padding-left: 0px;height: 320px;align-items: start;display: flex;flex-direction: column;"
								data-setbg="img/categories/func9.png">
								<div class="categories__text" style="margin-top: 70px; margin-left: auto;margin-right: auto;">
									<h4 style="margin-bottom: 15px;">기능별 건강기능식품 조회</h4>
								</div>
								<div class="categories__text_2" style="margin-left: auto;margin-right: auto;">
									<p style="font-weight: bold;">지금 당신에게 필요한 맞춤형 건강 솔루션은?</p>
									<a class="red-line" href="javascript:goTypeF('', '', '', '', '', '');">바로가기</a>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-6 col-sm-6 p-0">
							<div class="categories__item set-bg" style=" padding-left: 0px;height: 320px;align-items: start;display: flex;flex-direction: column;"								
								data-setbg="img/categories/func10.png">
								<div class="categories__text" style="margin-top: 70px;margin-left: auto;margin-right: auto;">
									<h4 style="margin-bottom: 15px;">성분별 건강기능식품 조회</h4>
								</div>
								<div class="categories__text_3" style="margin-left: auto;margin-right: auto;">
									<p style="font-weight: bold;">필요한 영양소를 한눈에! 성분별 영양제 가이드</p>
									<a class="red-line" href="javascript:goTypeI('', '', '', '', '', '');">바로가기</a>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6 col-sm-6 p-0">
							<div class="categories__item set-bg" style=" padding-left: 0px;height: 320px;align-items: start;display: flex;flex-direction: column;"								
								data-setbg="img/categories/func11.png">
								<div class="categories__text" style="margin-top: 70px;margin-left: auto;margin-right: auto;">
									<h4 style="margin-bottom: 15px;">대상별 건강기능식품 조회</h4>
								</div>
								<div class="categories__text_4" style="margin-left: auto;margin-right: auto;">
									<p style="font-weight: bold;">남성과 여성, 당신의 몸에 맞춘 영양제 건강의 시작</p>
									<a class="red-line" href="javascript:goTypeG('', '', '', '', '', '');">바로가기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
	</section>
	<!-- Categories Section End -->
	<br>
	<br>
	<br>
	<br>
	<!-- Product Section Begin -->
	<section class="product" style="width: 70%; margin-left: auto; margin-right: auto;">
		<div class="container-fluid p-0" style="display: flex; justify-content: center;">
			<div class="container" style="margin: 0px !important; max-width: 1350px !important;">
				<div class="row">
					<div class="col-lg-12" style="padding: 0;">
						<div class="product__details__tab" style="width: 100% !important; padding-top: 0px !important;">
							<ul class="nav nav-tabs" role="tablist" style="margin-bottom: 30px !important; border: 1px solid #d9d9d9 !important; display: flex !important; justify-content: space-between !important;">
								<li class="nav-item" style="background-color: #e9cdae;; margin-bottom: 0px !important; padding-top: 10px !important; padding-bottom: 10px !important; flex: 1 !important; text-align: center !important; align-items: center !important; justify-content: center !important; margin-right: 0px !important; border-right: 1px solid #d9d9d9 !important;">
									<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab" style="font-weight: normal !important; background-color: #e9cdae;; color: black; display: inline-block !important;" >추천 인기상품</a>
								</li>
								<li class="nav-item" style="margin-bottom: 0px !important; background-color: #f9f9f9; padding-top: 10px !important; padding-bottom: 10px !important; flex: 1 !important; text-align: center !important; align-items: center !important; justify-content: center !important;">
									<a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab" style="font-weight: normal !important; color: black; display: inline-block !important;">추천 신상품</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tabs-1" role="tabpanel">
									<div class="row property__gallery" style="display: flex; justify-content: center;">
									<c:forEach var="list" items="${list}">
										<div class="col-lg-2 col-md-6" style="padding: 0px !important; flex: 0 0 16.6% !important;">
											<div class="product__item">
												<a href="javascript:goWriteForm('${list.seq_sle}', '${list.cd_ctg_m}', '${list.cd_ctg_b}');" style="display: flex; justify-content: center; align-items: center;">
													<div style="height: 200px; width: 200px;" class="product__item__pic set-bg" data-setbg="/img/product/${list.img}">
													<c:if test="${list.flg_best != null && list.flg_best == 'Y'}">
														<div class="label new">인기상품</div>
													</c:if>
													</div>
												</a>
												<div class="product__item__text" style="padding-left: 15px !important; padding-right: 15px !important;">
												<h6 style="line-height: 1.5em; min-height: 3em; font-weight: 400 !important; margin: 0px !important;"><a style="font-size: 15px;">${list.sle_nm}</a></h6>
													<div class="rating">
														<c:if test="${list.star == 0}">
															<i class="fa fa-star" style="color: #e0e0e0;"></i>
															<i class="fa fa-star" style="color: #e0e0e0;"></i>
															<i class="fa fa-star" style="color: #e0e0e0;"></i>
															<i class="fa fa-star" style="color: #e0e0e0;"></i>
															<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${list.total_count}개 상품평</span>
														</c:if>
														<c:if test="${list.star == 1}">
															<i class="fa fa-star"></i>
															<i class="fa fa-star" style="color: #e0e0e0;"></i>
															<i class="fa fa-star" style="color: #e0e0e0;"></i>
															<i class="fa fa-star" style="color: #e0e0e0;"></i>
															<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${list.total_count}개 상품평</span>
														</c:if>
														<c:if test="${list.star == 2}">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star" style="color: #e0e0e0;"></i>
															<i class="fa fa-star" style="color: #e0e0e0;"></i>
															<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${list.total_count}개 상품평</span>
														</c:if>
														<c:if test="${list.star == 3}">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star" style="color: #e0e0e0;"></i>
															<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${list.total_count}개 상품평</span>
														</c:if>
														<c:if test="${list.star == 4}">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${list.total_count}개 상품평</span>
														</c:if>
														<c:if test="${list.star == 5}">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i><span class="rate">${list.total_count}개 상품평</span>
														</c:if>
													</div>
													<c:choose>
													<c:when test="${list.discount == null || list.discount == 0}">
														<div class="product__price">
															<span style="text-decoration: none; font-size: 1.3em; color: black;">
																<fmt:formatNumber value="${list.price_sale}" type="number" />
															</span>원
														</div>
													</c:when>
														<c:otherwise>
															<div class="product__price" style="display: flex; align-items: center; justify-content: center;">
																<span style="margin-left:0px !important; font-size: 16px !important;">
																	<fmt:formatNumber value="${list.price_sale}" type="number" />
																</span>
																<span class="discount-rate" style="padding-top: 1px !important; margin-left:4px !important; margin-top:2px !important; font-size: 13px !important; text-decoration: none;">
																	${list.discount}%
																</span>
																<span style="text-decoration: none; color: black; font-size: 1.3em; margin-left: 7px;">
																	<fmt:formatNumber value="${list.discount_sale}" type="number" />
																</span>원
															</div>
														</c:otherwise>
													</c:choose>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
							<div class="row property__gallery" style="display: flex; justify-content: center;">
							<c:forEach var="subList" items="${subList}">
					<div class="col-lg-2 col-md-6" style="padding: 0px !important; flex: 0 0 16.6% !important;">
						<div class="product__item">
							<a href="javascript:goWriteForm('${subList.seq_sle}', '${subList.cd_ctg_m}', '${subList.cd_ctg_b}');" style="display: flex; justify-content: center; align-items: center;">
								<div style="height: 200px; width: 200px;" class="product__item__pic set-bg" data-setbg="/img/product/${subList.img}">
								<c:if test="${subList.flg_best != null && subList.flg_best == 'Y'}">
									<div class="label new">인기상품</div>
								</c:if>
								</div>
							</a>
							<div class="product__item__text" style="padding-left: 15px !important; padding-right: 15px !important;">
								<h6 style="line-height: 1.5em; min-height: 3em; font-weight: 400 !important; margin: 0px !important;"><a style="font-size: 15px;">${subList.sle_nm}</a></h6>
									<div class="rating">
										<c:if test="${subList.star == 0}">
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${subList.total_count}개 상품평</span>
										</c:if>
										<c:if test="${subList.star == 1}">
											<i class="fa fa-star"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${subList.total_count}개 상품평</span>
										</c:if>
										<c:if test="${subList.star == 2}">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${subList.total_count}개 상품평</span>
										</c:if>
										<c:if test="${subList.star == 3}">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${subList.total_count}개 상품평</span>
										</c:if>
										<c:if test="${subList.star == 4}">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${subList.total_count}개 상품평</span>
										</c:if>
										<c:if test="${subList.star == 5}">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i><span class="rate">${subList.total_count}개 상품평</span>
										</c:if>
									</div>
								<c:choose>
									<c:when test="${subList.discount == null || subList.discount == 0}">
										<div class="product__price">
											<span style="text-decoration: none; font-size: 1.3em; color: black;">
												<fmt:formatNumber value="${subList.price_sale}" type="number" />
											</span>원
										</div>
									</c:when>
									<c:otherwise>
										<div class="product__price" style="display: flex; align-items: center; justify-content: center;">
											<span style="margin-left:0px !important; font-size: 16px !important;">
												<fmt:formatNumber value="${subList.price_sale}" type="number" />
											</span>
											<span class="discount-rate" style="padding-top: 1px !important; margin-left:4px !important; margin-top:2px !important; font-size: 13px !important; text-decoration: none;">
												${subList.discount}%
											</span>
											<span style="text-decoration: none; color: black; font-size: 1.3em; margin-left: 7px;">
												<fmt:formatNumber value="${subList.discount_sale}" type="number" />
											</span>원
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		
		</div>
	</section>
	<!-- Product Section End -->

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
	$(document).ready(function() {
	
	$('<style>.nav::before { display: none; }</style>').appendTo('head');
	$('<style>.nav::after { display: none; }</style>').appendTo('head');
	});

	document.addEventListener("DOMContentLoaded", function() {
		
		var navLinks = document.querySelectorAll(".nav-link");
		var navItems = document.querySelectorAll(".nav-item");
		var currentIndex = 1;
		var autoSwitchInterval;
		var autoSwitchDelay = 10000;
		
		var observer = new MutationObserver(function(mutations) {
			
			mutations.forEach(function(mutation) {
				
				if (mutation.type === "attributes" && mutation.attributeName === "class") {
					
					var target = mutation.target;
					
					if (target.classList.contains("active")) {
						
						target.style.backgroundColor = "#e9cdae";
						target.style.color = "black";
						target.parentElement.style.backgroundColor = "#e9cdae";
					} else {
						
						target.style.backgroundColor = "#f9f9f9";
						target.style.color = "black";
						target.parentElement.style.backgroundColor = "#f9f9f9";
					}
				}
			});
		});
		navLinks.forEach(function(navLink) {
			
			observer.observe(navLink, { attributes: true });
		});
		
		function toggleActive(element) {
			
			document.querySelectorAll('.nav-item').forEach(item => {
				
				item.style.backgroundColor = '#f9f9f9';
				var link = item.querySelector('.nav-link');
				if (link) {
					
					link.classList.remove('active');
					link.style.color = 'black';
				}
			});
			element.style.backgroundColor = '#72baf5';
			var link = element.querySelector('.nav-link');
			if (link) {
				
				link.classList.add('active');
				link.style.color = 'white';
			}
		}
	});
</script>
</form>
</body>
</html>