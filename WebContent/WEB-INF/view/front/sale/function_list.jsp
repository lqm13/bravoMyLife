<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/sale/function_list.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/front/center/board/list.web";
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
	
	function goTypeT(value, value2, value3, value4, value5, selectOrValue) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = "1";
		frmMain.type.setAttribute("value", value);
		frmMain.filter.setAttribute("value", value2);
		frmMain.corp_nm.setAttribute("value", value3);
		frmMain.prd_type.setAttribute("value", value4);
		frmMain.cd_ctg_m.setAttribute("value", value5);
		frmMain.cd_ctg_b.setAttribute("value", '');
		
		if (selectOrValue instanceof HTMLElement && selectOrValue.tagName === 'SELECT') {
			frmMain.elements["linePerPage"].value = selectOrValue.value;
		} else {
			frmMain.elements["linePerPage"].value = selectOrValue;
		}
		
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
		
		if (selectOrValue instanceof HTMLElement && selectOrValue.tagName === 'SELECT') {
			frmMain.elements["linePerPage"].value = selectOrValue.value;
		} else {
			frmMain.elements["linePerPage"].value = selectOrValue;
		}
		
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
		
		if (selectOrValue instanceof HTMLElement && selectOrValue.tagName === 'SELECT') {
			frmMain.elements["linePerPage"].value = selectOrValue.value;
		} else {
			frmMain.elements["linePerPage"].value = selectOrValue;
		}
		
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
		
		if (selectOrValue instanceof HTMLElement && selectOrValue.tagName === 'SELECT') {
			frmMain.elements["linePerPage"].value = selectOrValue.value;
		} else {
			frmMain.elements["linePerPage"].value = selectOrValue;
		}
		
		frmMain.action = "/front/sale/gender_list.web";
		frmMain.submit();
	}

	function goPages(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.currentPage.setAttribute("value", value);
		frmMain.action="/front/sale/function_list.web";
		frmMain.submit();
	}
	
	function goWriteForm(value, value2, value3) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.cd_ctg_m.setAttribute("value", value2);
		frmMain.cd_ctg_b.setAttribute("value", value3);
		frmMain.action="/front/buy/writeForm.web";
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
<input type="hidden" name="seq_sle"			id="seq_sle"		value="0"/>
<input type="hidden" name="cd_ctg_m"		id="cd_ctg_m"		value="${paging.cd_ctg_m}"/>
<input type="hidden" name="cd_ctg_b"		id="cd_ctg_b"		value="${paging.cd_ctg_b}"/>
<input type="hidden" name="corp_nm"			id="corp_nm"		value="${paging.corp_nm}"/>
<input type="hidden" name="prd_type"		id="prd_type"		value="${paging.prd_type}"/>
<input type="hidden" name="filter"			id="filter"			value="${paging.filter}"/>
<input type="hidden" name="type"			id="type"/>
<input type="hidden" name="currentPage"		id="currentPage"	value="${paging.currentPage}"/>
<input type="hidden" name="searchWord"		id="searchWord"		value="${paging.searchWord}"/>
<input type="hidden" name="cd_bbs_type"		id="cd_bbs_type"	value="0"/>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->

	<!-- Shop Section Begin -->
	<section class="shop spad">
		<div class="container">
			<%@ include file="/include/front/lowgnbF.jsp" %>
			<div class="row" style="justify-content: center;">
				<c:choose>
					<c:when test="${empty list}">
						<div class="col-lg-2 col-md-6 d-flex justify-content-center align-items-center" style="height: 600px;">
							<p>상품이 없습니다.</p>
						</div>
					</c:when>
						<c:otherwise>
							<c:forEach var="list" items="${list}">
								<div class="col-lg-2 col-md-6">
									<div class="product__item">
										<a href="javascript:goWriteForm('${list.seq_sle}', '${list.cd_ctg_m}', '${list.cd_ctg_b}');" style="display: flex; justify-content: center; align-items: center;">
											<div style="height: 200px; width: 200px;" class="product__item__pic set-bg" data-setbg="/img/product/${list.img}">
											<c:if test="${list.flg_best != null && list.flg_best == 'Y'}">
												<div class="label new">인기상품</div>
											</c:if>
											</div>
										</a>
										<div class="product__item__text">
											<h6 style="line-height: 1.5em; min-height: 3em;"><a style="font-size: 15px;">${list.sle_nm}</a></h6>
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
						</c:otherwise>
					</c:choose>
				<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;">
					<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPages" />
				</div>
			</div>
		</div>
	</section>
	<!-- Shop Section End -->

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