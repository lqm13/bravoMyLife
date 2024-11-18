<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/writeForm.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
<style>
.modal {
	display: none;
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.8);
	display: flex;
	align-items: center;
	justify-content: center;
}

.modal-content {
	margin: auto;
	display: block;
	 width: 100%;
	max-width: 700px;
	position: relative;
	max-height: 80%;
	object-fit: contain;
}

.close {
	position: absolute;
	top: -10px;
	right: -10px;
	color: white;
	font-size: 35px;
	font-weight: bold;
	cursor: pointer;
	background-color: rgba(0, 0, 0, 0.5);
	padding: 5px 10px;
	border-radius: 50%;
}

@media only screen and (max-width: 700px) {
	.modal-content {
		width: 100%;
		max-height: 80%;
	}
}
</style>
	<%@ include file="/include/common/header.jsp" %>
	<script type="text/javascript" src="/js/package/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/package/tinymce.js"></script>
	<script>
	<c:if test="${empty sessionScope.SEQ_MBR}">
	var isLogin = false;
	</c:if>
	
	<c:if test="${not empty sessionScope.SEQ_MBR}">
	var isLogin = true;
	</c:if>
	
	function setLike(value) {
		
		if (!isLogin) {
			alert("로그인이 필요합니다.");
			return;
		}
		
		var seq_sle	= document.getElementById("seq_sle").value;
		var myData = { flg_like: value, seq_sle: seq_sle };
		
		$.ajax({
			type: "POST",
			url: "/front/sale/setLike.json",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(myData),
			success: function(res) {
				
				if (res.flg_like === 'Y') {
					$('.like-button').attr({
						'style': 'padding: 5px !important; border-radius: 50% !important; background-color: #ca1515 !important; transition: background-color 1s ease !important;',
						'href': 'javascript:delLike(\'N\');'
					});
					$('.icon_heart_alt').attr(
							'style', 'color: white !important;'
					);
					
					var likeButtonOffset = $('.like-button').offset();
					$('#setlike-alert').css({
						
						'top': (likeButtonOffset.top - $('#setlike-alert').outerHeight() - 20) + 'px',
						'left': likeButtonOffset.left + 'px'
					}).fadeIn(400).delay(1500).fadeOut(400);
				}
			},
		});
	}
	
	function delLike(value) {
		
		if (!isLogin) {
			alert("로그인이 필요합니다.");
			return;
		}
		
		var seq_sle	= document.getElementById("seq_sle").value;
		var myData = { flg_like: value, seq_sle: seq_sle };
		
		$.ajax({
			type: "POST",
			url: "/front/sale/delLike.json",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(myData),
			success: function(res) {
				
				if (res.flg_like === 'N') {
					
					$('.like-button').attr({
						
						'style': 'background-color: white !important; transition: background-color 0.5s ease !important;',
						'href': 'javascript:setLike(\'Y\');'
					});
					$('.icon_heart_alt').attr(
						'style', 'font-size: 18px !important; color: #666666 !important; display: flex !important; align-items: center !important; justify-content: center !important; transform: translateY(14px) !important;'
					);
					
					var likeButtonOffset = $('.like-button').offset();
					$('#dellike-alert').css({
						
						'top': (likeButtonOffset.top - $('#dellike-alert').outerHeight() - 20) + 'px',
						'left': likeButtonOffset.left + 'px'
					}).fadeIn(400).delay(1500).fadeOut(400);
				}
			},
		});
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
	
	function goTypeT(value, value2, value3, value4, value5, selectOrValue) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = "1";
		frmMain.type.setAttribute("value", value);
		frmMain.filter.setAttribute("value", value2);
		frmMain.corp_nm.setAttribute("value", value3);
		frmMain.prd_type.setAttribute("value", value4);
		frmMain.cd_ctg_m.setAttribute("value", value5);
		frmMain.cd_ctg_b.setAttribute("value", '');
		
		/*
		if (selectOrValue instanceof HTMLElement && selectOrValue.tagName === 'SELECT') {
			frmMain.elements["linePerPage"].value = selectOrValue.value;
		} else {
			frmMain.elements["linePerPage"].value = selectOrValue;
		}
		*/
		
		frmMain.action = "/front/sale/total_list.web";
		frmMain.submit();
	}
	
	function goTypeF(value, value2, value3, value4, value5, selectOrValue) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = "1";
		frmMain.type.setAttribute("value", value);
		frmMain.filter.setAttribute("value", value2);
		frmMain.corp_nm.setAttribute("value", value3);
		frmMain.prd_type.setAttribute("value", value4);
		frmMain.cd_ctg_m.setAttribute("value", value5);
		
		/*
		if (selectOrValue instanceof HTMLElement && selectOrValue.tagName === 'SELECT') {
			frmMain.elements["linePerPage"].value = selectOrValue.value;
		} else {
			frmMain.elements["linePerPage"].value = selectOrValue;
		}
		*/
		
		frmMain.action = "/front/sale/function_list.web";
		frmMain.submit();
	}
	
	function goTypeI(value, value2, value3, value4, value5, selectOrValue) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = "1";
		frmMain.type.setAttribute("value", value);
		frmMain.filter.setAttribute("value", value2);
		frmMain.corp_nm.setAttribute("value", value3);
		frmMain.prd_type.setAttribute("value", value4);
		frmMain.cd_ctg_m.setAttribute("value", value5);
		
		/*
		if (selectOrValue instanceof HTMLElement && selectOrValue.tagName === 'SELECT') {
			frmMain.elements["linePerPage"].value = selectOrValue.value;
		} else {
			frmMain.elements["linePerPage"].value = selectOrValue;
		}
		*/
		
		frmMain.action = "/front/sale/ingredient_list.web";
		frmMain.submit();
	}
	
	function goTypeG(value, value2, value3, value4, value5, selectOrValue) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = "1";
		frmMain.type.setAttribute("value", value);
		frmMain.filter.setAttribute("value", value2);
		frmMain.corp_nm.setAttribute("value", value3);
		frmMain.prd_type.setAttribute("value", value4);
		frmMain.cd_ctg_m.setAttribute("value", value5);
		
		/*
		if (selectOrValue instanceof HTMLElement && selectOrValue.tagName === 'SELECT') {
			frmMain.elements["linePerPage"].value = selectOrValue.value;
		} else {
			frmMain.elements["linePerPage"].value = selectOrValue;
		}
		*/
		
		frmMain.action = "/front/sale/gender_list.web";
		frmMain.submit();
	}
	
	function goWriteForm(value, value2, value3) {
		
		var saleFrmMain = document.getElementById("saleFrmMain");
		
		saleFrmMain.saleSeq_sle.setAttribute("value", value);
		saleFrmMain.saleCd_ctg_m.setAttribute("value", value2);
		saleFrmMain.saleCd_ctg_b.setAttribute("value", value3);
		
		saleFrmMain.action="/front/buy/writeForm.web";
		
		saleFrmMain.submit();
	}
	
	function setBasketOne(value, value2, value3,value4, value5, value6, value7, value8, value9) {
		
		if (!isLogin) {
			alert("로그인이 필요합니다.");
			return;
		}
		
		var basketFrmMain = document.getElementById("basketFrmMain");
		
		var count = document.getElementById("count").value;
		
		basketFrmMain.sle_nm.setAttribute("value", value);
		basketFrmMain.discount_sale.setAttribute("value", value2);
		basketFrmMain.basketCount.setAttribute("value", count);
		basketFrmMain.img.setAttribute("value", value3);
		basketFrmMain.point_stack.setAttribute("value", value4);
		basketFrmMain.basketCd_ctg_m.setAttribute("value", value5);
		basketFrmMain.basketCd_ctg_b.setAttribute("value", value6);
		basketFrmMain.price_sale.setAttribute("value", value7);
		basketFrmMain.discount.setAttribute("value", value8);
		basketFrmMain.basketSeq_sle.setAttribute("value", value9);
		
		basketFrmMain.action = "/front/basket/setBasket.web";
		basketFrmMain.target = "frmBlank";
		basketFrmMain.submit();
	}
	
	function checkOut() {
		
		if (!isLogin) {
			alert("로그인이 필요합니다.");
			return;
		}
		
		var frmMain = document.getElementById("frmMain");
		frmMain.action = "/front/pay/index.web";
		frmMain.target = "";
		frmMain.submit();
	}
		
	function reviewListPage() {
		
		if (!isLogin) {
			alert("로그인이 필요합니다.");
			return;
		}

		frmMain.action = "/front/buy/reviewListPage.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goPages(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.currentPage.setAttribute("value", value);
		frmMain.action="/front/buy/writeForm.web";
		frmMain.submit();
	}
	
	function writeForm(value, value2, value3, value4) {
		
		if (!isLogin) {
			alert("로그인이 필요합니다.");
			return;
		}
		
		var subFrmMain = document.getElementById("subFrmMain");
		
		subFrmMain.subCd_bbs_type.setAttribute("value", value);
		subFrmMain.subSeq_sle.setAttribute("value", value2);
		subFrmMain.subCd_ctg_b.setAttribute("value", value3);
		subFrmMain.subCd_ctg_m.setAttribute("value", value4);
		
		subFrmMain.action = "/front/center/board/myPageNotice/writeForm.web";
		subFrmMain.submit();
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
<form id="basketFrmMain" method="POST">
<input type="hidden" name="basketList[0].point_stack"	id="point_stack"	value="${saleDto.point_stack}"/>
<input type="hidden" name="basketList[0].discount_sale"	id="discount_sale"	value="${saleDto.discount_sale}"/>
<input type="hidden" name="basketList[0].img"			id="img"			value="${saleDto.img}"/>
<input type="hidden" name="basketList[0].seq_sle"		id="basketSeq_sle"		value="${saleDto.seq_sle}"/>
<input type="hidden" name="basketList[0].sle_nm"		id="sle_nm"			value="${saleDto.sle_nm}"/>
<input type="hidden" name="basketList[0].cd_ctg_m"		id="basketCd_ctg_m"		value="${saleDto.cd_ctg_m}"/>
<input type="hidden" name="basketList[0].cd_ctg_b"		id="basketCd_ctg_b"		value="${saleDto.cd_ctg_b}"/>
<input type="hidden" name="basketList[0].price_sale"	id="price_sale"		value="${saleDto.price_sale}"/>
<input type="hidden" name="basketList[0].discount"		id="discount"		value="${saleDto.discount}"/>
<input type="hidden" name="basketList[0].count"			id="basketCount"/>
</form>
<form id="subFrmMain" method="POST">
<input type="hidden" name="cd_bbs_type"					id="subCd_bbs_type"/>
<input type="hidden" name="seq_sle"						id="subSeq_sle"/>
<input type="hidden" name="cd_ctg_m"					id="subCd_ctg_m"/>
<input type="hidden" name="cd_ctg_b"					id="subCd_ctg_b"/>
</form>
<form id="saleFrmMain" method="POST">
<input type="hidden" name="seq_sle"						id="saleSeq_sle"/>
<input type="hidden" name="cd_ctg_m"					id="saleCd_ctg_m"/>
<input type="hidden" name="cd_ctg_b"					id="saleCd_ctg_b"/>
</form>
<form id="frmMain" method="POST">
<input type="hidden" name="corp_nm"						id="corp_nm"/>
<input type="hidden" name="seq_sle"						id="seq_sle"		value="${saleDto.seq_sle}"/>
<input type="hidden" name="prd_type"					id="prd_type"/>
<input type="hidden" name="filter"						id="filter">
<input type="hidden" name="type"						id="type"/>
<input type="hidden" name="searchWord"					id="searchWord" />
<input type="hidden" name="cd_ctg_m"					id="cd_ctg_m"/>
<input type="hidden" name="cd_ctg_b"					id="cd_ctg_b"/>
<input type="hidden" name="currentPage"					id="currentPage"	value="${paging.currentPage}"/>
<input type="hidden" name="buyList[0].img"									value="${saleDto.img}"/>
<input type="hidden" name="buyList[0].seq_sle"								value="${saleDto.seq_sle}"/>
<input type="hidden" name="buyList[0].cd_ctg_m"								value="${saleDto.cd_ctg_m}"/>
<input type="hidden" name="buyList[0].cd_ctg_b"								value="${saleDto.cd_ctg_b}"/>
<input type="hidden" name="cd_bbs_type"					id="cd_bbs_type"	value="0"/>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<!-- 페이지의 상단에 보이는 로고 및 로그인 / 회원가입 코드 -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->
	
	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row" style="justify-content: center;">
				<div class="col-lg-6" style="display: flex; justify-content: center; align-items: center;">
					<div class="product__details__pic">
						<img data-hash="product-1" class="product__big__img" src="/img/product/${saleDto.img}" alt="판매상품 이미지" style="width: 450px; height: 450px; cursor: pointer" onclick="window.open(this.src)">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="product__details__text">
						<h6 class="pd-main">${saleDto.sle_nm}</h6>
						<input type="hidden" name="buyList[0].sle_nm" value="${saleDto.sle_nm}" />
						<div class="product__details__widget">
							<div class="rating">
								<c:if test="${saleDto.star == 0}">
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${saleDto.total_count}개 상품평</span>
								</c:if>
								<c:if test="${saleDto.star == 1}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${saleDto.total_count}개 상품평</span>
								</c:if>
								<c:if test="${saleDto.star == 2}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${saleDto.total_count}개 상품평</span>
								</c:if>
								<c:if test="${saleDto.star == 3}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${saleDto.total_count}개 상품평</span>
								</c:if>
								<c:if test="${saleDto.star == 4}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star" style="color: #e0e0e0;"></i><span class="rate">${saleDto.total_count}개 상품평</span>
								</c:if>
								<c:if test="${saleDto.star == 5}">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i><span class="rate">${saleDto.total_count}개 상품평</span>
								</c:if>
							</div>
							<ul class="pd-ul">
							<c:choose>
								<c:when test="${saleDto.discount == null || saleDto.discount == 0}">
								<li>
									<div>
									<span class="pd-title">가격</span>
										<label for="stockin" class="pd-label">
											<span class="pd-text" style="font-weight: bold !important;"><fmt:formatNumber value="${saleDto.price_sale}" type="number" /></span>
											<span class="pd-text">원</span>
											<input type="hidden" name="buyList[0].price"value="${saleDto.price_sale}" />
										</label>
									</div>
								</li>
								</c:when>
								<c:otherwise>
								<li>
									<div>
									<span class="pd-title">가격</span>
										<label for="stockin" class="pd-label">
											<span class="pd-text" style="font-weight: bold !important; color: #b1b0b0 !important; text-decoration: line-through !important;"><fmt:formatNumber value="${saleDto.price_sale}" type="number" /></span>
											<span class="pd-text">원</span>
										</label>
									</div>
								</li>
								<li>
									<div>
									<span class="pd-title">판매가</span>
										<label for="stockin" class="pd-label">
											<span class="pd-text" style="color: #ff4c2e !important; font-weight: bold !important;"><fmt:formatNumber value="${saleDto.discount_sale}" type="number" /></span>
											<span class="pd-text">원</span>
											<input type="hidden" name="buyList[0].price"value="${saleDto.discount_sale}" />
											<span class="discount-rate" style="padding-top: 1px !important; font-size: 13px !important; display: inline-block; width: auto;">${saleDto.discount}% 할인</span>
										</label>
									</div>
								</li>
								</c:otherwise>
								</c:choose>
								<li>
									<div>
									<span class="pd-title">적립 포인트</span>
										<label for="stockin" class="pd-label">
											<span class="pd-text" style="font-weight: bold !important;">${saleDto.point_value}</span>
											<span class="pd-text">적립</span>
											<span class="discount-rate" style="background: #346aff !important; padding-left: 5px !important; padding-right: 3px !important; padding-top: 1px !important; font-size: 13px !important; display: inline-block; width: auto;">${saleDto.point_stack}% 적립</span>
											<input type="hidden" name="buyList[0].point" value="${saleDto.point_value}" />
										</label>
									</div>
								</li>
								<li>
									<div>
									<span class="pd-title">브랜드</span>
										<label for="stockin" class="pd-label">
											${saleDto.corp_nm}
										</label>
									</div>
								</li>
								<li>
									<div>
									<span class="pd-title">제품타입</span>
										<label for="stockin" class="pd-label">
											${saleDto.prd_type}
										</label>
									</div>
								</li>
								<li>
									<div>
									<span class="pd-title">수량</span>
										<label for="stockin" class="pd-label">
											${saleDto.count_stock}
										</label>
									</div>
								</li>
								<li>
									<div>
									<span class="pd-title">등록일${saleDto.flg_like}</span>
										<label for="stockin" class="pd-label">
											${saleDto.dt_reg}
										</label>
									</div>
								</li>
							</ul>
						</div>
						</br>
						<div class="product__details__button" >
						<div class="pro-qty" style="padding: 0px; display: flex !important; align-items: center !important; justify-content: center !important; gap: 10px !important; height: 51px !important;">
							<input type="text" value="1" name="buyList[0].count" id="count" size="3" style="text-align: center !important; font-size: 14px !important; width: 40px; display: inline-block !important;">
						</div>
							<div class="buttons-container" style="display: flex; gap: 10px;">
								<a href="javascript:setBasketOne('${saleDto.sle_nm}', '${saleDto.discount_sale}', '${saleDto.img}', '${saleDto.point_stack}', '${saleDto.cd_ctg_m}', '${saleDto.cd_ctg_b}', '${saleDto.price_sale}', '${saleDto.discount}', '${saleDto.seq_sle}');" class="cart-btn cart-btn-bsk" style="white-space: nowrap; display: inline-block !important; margin: 0px !important; background: white; color: #346aff !important; border: 1px solid #346aff">
									<span class="icon_bag_alt"></span> 장바구니 담기
								</a>
								<a href="javascript:checkOut();" class="cart-btn cart-btn-buy" style="display: inline-block !important; margin: 0px !important;">
									바로구매
								</a>
								<ul style="list-style: none !important; padding: 0 !important; margin: 0 !important; display: flex !important; align-items: center !important; gap: 10px !important;">
									<c:choose>
										<c:when test="${saleDto.flg_like == 'Y'}">
											<li>
												<a class="like-button" href="javascript:delLike('N');" style="background-color: #ca1515 !important; padding: 5px !important; border-radius: 50% !important;">
													<span class="icon_heart_alt" style="color: white !important;"></span>
												</a>
											</li>
										</c:when>
										<c:otherwise>
											<li>
												<a class="like-button" href="javascript:setLike('Y');"  style="padding: 5px !important; border-radius: 50% !important;">
													<span class="icon_heart_alt"></span>
												</a>
											</li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12 text-center">
					<div class="related__title">
						<h5 class="pd-h5">이런 상품은 어떠세요?</h5><h5 class=pd-subh5>지금 보고 계시는 상품과 관련된 상품들입니다.</h5>
					</div>
				</div>
				<c:forEach var="list" items="${list}">
					<div class="col-lg-2 col-md-6" style="padding: 0px !important;">
						<div class="product__item">
							<a href="javascript:goWriteForm('${list.seq_sle}', '${list.cd_ctg_m}', '${list.cd_ctg_b}');" style="display: flex; justify-content: center; align-items: center;">
								<div style="height: 200px; width: 200px;" class="product__item__pic set-bg" data-setbg="/img/product/${list.img}">
								<c:if test="${list.flg_best != null && list.flg_best == 'Y'}">
									<div class="label new">인기상품</div>
								</c:if>
								</div>
							</a>
							<div class="product__item__text">
								<h6 style="line-height: 1.5em; min-height: 3em; padding-left: 15px !important; padding-right: 15px !important;"><a style="font-size: 15px;">${list.sle_nm}</a></h6>
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
				<div class="col-lg-12" style="padding: 0;">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">상품상세정보</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">상품후기 (${reviewCount.review_count})</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">상품 Q&A</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div style="display: flex; justify-content: center; align-items: center; height: 100%;">
									<img src="/img/product/${saleDto.desces}" alt="">
								</div>
							</div>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
									<div style="text-align: right;">
										<c:if test="${saleDto.flg_review == 'N'}">
											<a href="javascript:reviewListPage();" class="cart-btn" style="font-size: 12px !important; font-weight: normal !important; cursor: pointer; background: #2c2c2c; color: white !important; border: 1px solid #2c2c2c; margin: 0; padding: 5px 10px 5px !important;">
												상품후기 쓰기
											</a>
										</c:if>
										<c:if test="${saleDto.flg_review == 'Y'}">
											<a href="javascript:reviewListPage();" class="cart-btn" style="font-size: 12px !important; font-weight: normal !important; cursor: pointer; background: #2c2c2c; color: white !important; border: 1px solid #2c2c2c; margin: 0; padding: 5px 10px 5px !important;">
												리뷰관리
											</a>
											<h6 class="cart-title" style="padding-top: 5px !important; padding-bottom: 0px !important; margin-bottom: 0px !important; font-weight: normal !important; text-align: right !important;">*작성 및 수정할 수 있는 상품후기가 있습니다. 리뷰관리로 이동합니다.</h6>
										</c:if>
									</div>
								<div class="row">
									<div class="col-lg-12 col-md-12" >
									<c:choose>
										<c:when test="${empty reviewList}">
											<div class="col-lg-12 col-md-12 d-flex justify-content-center align-items-center" style="height: 400px;">
												<p>등록된 상품후기가 없습니다.</p>
											</div>
										</c:when>
											<c:otherwise>
												<c:forEach var="review" items="${reviewList}">
												<div class="review-form" style="display: flex; flex-direction: column; border-top: 0px !important; margin: 0px !important; width: 100% !important; padding-bottom: 25px !important; margin-bottom: 20px !important">
													<div class="review-title" style="border-bottom: 0px !important; border-top: 0px !important; padding-left: 0px !important; padding-top: 0px !important">
														<div>
															<span class="reviewsub" style="font-weight: bold !important; font-size: 14px !important;"><bravomylifeTag:masking text="${review.mbr_nm}" letter="*" count="1" mode="left" /></span>
														</div>
														<div>
															<div class="product-name" style="padding: 0px !important; display: flex; align-items: center;">
																<div class="rating" style="display: flex; align-items: center;">
																	<c:if test="${review.mbr_rate_star == 1}">
																		<i class="fa fa-star-middle"></i>
																		<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																		<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																		<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																		<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																	</c:if>
																	<c:if test="${review.mbr_rate_star == 2}">
																		<i class="fa fa-star-middle"></i>
																		<i class="fa fa-star-middle"></i>
																		<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																		<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																		<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																	</c:if>
																	<c:if test="${review.mbr_rate_star == 3}">
																		<i class="fa fa-star-middle"></i>
																		<i class="fa fa-star-middle"></i>
																		<i class="fa fa-star-middle"></i>
																		<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																		<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																	</c:if>
																	<c:if test="${review.mbr_rate_star == 4}">
																		<i class="fa fa-star-middle"></i>
																		<i class="fa fa-star-middle"></i>
																		<i class="fa fa-star-middle"></i>
																		<i class="fa fa-star-middle"></i>
																		<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																	</c:if>
																	<c:if test="${review.mbr_rate_star == 5}">
																		<i class="fa fa-star-middle"></i>
																		<i class="fa fa-star-middle"></i>
																		<i class="fa fa-star-middle"></i>
																		<i class="fa fa-star-middle"></i>
																		<i class="fa fa-star-middle"></i>
																	</c:if>
																</div>
															<div style="margin-left: 5px; display: flex;">
																<span class="reviewsub" style="padding-top: 5px; font-size: 12px !important;">
																	${review.dt_reg}
																</span>
															</div>
																	</div>
																</div>
																<div>
																	<span class="reviewsub" style="font-size: 12px !important;">${review.sle_nm}, ${review.count}개</span>
																</div>
															</div>
															<div class="review-name" style="border-bottom: 0px !important; padding-left: 0px !important; border-top: 0px !important; margin-top: 5px !important">
															<c:choose>
																<c:when test="${empty review.imgs}">
																	<div class="photoreview" style="display: inline-block; padding-bottom: 20px !important; padding-left: 0px !important; padding-top: 0px !important; width: auto !important;">
																		<h6 class="cart-title" style="padding-bottom: 0px !important; margin-bottom: 0px !important; font-weight: normal !important;">*등록된 상품후기 이미지가 없습니다.</h6>
																	</div>
																</c:when>
																<c:otherwise>
																	<c:forEach var="imgs" items="${review.imgs}">
																		<div class="photoreview" style="display: inline-block; padding-right: 5px !important; padding-left: 0px !important; padding-top: 0px !important; width: auto !important;">
																			<img src="/img/review/${imgs.file_save}" class="img-thumbnail" style="padding: 0px !important; width: 70px; height: 80px; object-fit: cover;">
																		</div>
																	</c:forEach>	
																</c:otherwise>
															</c:choose>
															</div>
															<div class="review-name" style="display: block !important; padding-left: 0px !important; border-top: 0px !important; border-bottom: 0px !important;">
																<div class="reviewsub">
																	${review.rate_review}
																</div>
															</div>
														</div>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;">
											<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPages" />
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane" id="tabs-2" role="tabpanel">
								<div style="display: flex; flex-direction: column; align-items: center;">
									<h4  style="font-size:25px; margin-top: 50px;margin-bottom: 50px;">*1대1 문의 개시판으로 이동합니다.</h4>
									<a href="javascript:writeForm('3','${saleDto.seq_sle}','${saleDto.cd_ctg_b}','${saleDto.cd_ctg_m}');" class="cart-btn" style="display: inline-block; margin: 0px; background: white; color: #346aff; border: 1px solid #346aff; margin-bottom: 10px;">
										1대1 문의 이동
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<div id="dellike-alert" style="display: none; position: absolute; background-color: white; color: #333; padding: 10px 20px; border-radius: 5px; z-index: 9999; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); font-size: 16px; border: 1px solid #ddd;">
		찜에서 삭제했습니다.
	</div>
	<div id="setlike-alert" style="display: none; position: absolute; background-color: white; color: #333; padding: 10px 20px; border-radius: 5px; z-index: 9999; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); font-size: 16px; border: 1px solid #ddd;">
		찜에 등록되었습니다.
	</div>
	<div id="imageModal" class="modal">
		<span class="close">&times;</span>
		<img class="modal-content" id="modalImage">
	</div>
	</section>
	<!-- Product Details Section End -->

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
		
		var modal = $('#imageModal');
		var modalImg = $('#modalImage');
		
		$('.img-thumbnail').on('click', function() {
			
			var imgSrc = $(this).attr('src');
			modal.css('display', 'flex');
			modalImg.attr('src', imgSrc);
		});
		$('.close').on('click', function() {
			
			modal.css('display', 'none');
		});
		$(window).on('click', function(event) {
			
			if ($(event.target).is(modal)) {
				
				modal.css('display', 'none');
			}
		});
	});
</script>
</form>
<iframe name="frmBlank" id="frmBlank" width="0" height="0"></iframe>
</body>
</html>