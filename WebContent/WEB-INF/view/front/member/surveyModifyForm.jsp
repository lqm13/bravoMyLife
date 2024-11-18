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
	function setBasket() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/basket/setBasket.web";
		frmMain.target = "frmBlank";
		frmMain.submit();
	}
	
	function setBasketOne(value, value2, value3,value4, value5, value6, value7, value8, value9, value10) {
		
		var subFrmMain = document.getElementById("subFrmMain");
		
		subFrmMain.sle_nm.setAttribute("value", value2);
		subFrmMain.discount_sale.setAttribute("value", value3);
		subFrmMain.basketCount.setAttribute("value", value4);
		subFrmMain.img.setAttribute("value", value5);
		subFrmMain.point_stack.setAttribute("value", value6);
		subFrmMain.basketCd_ctg_m.setAttribute("value", value7);
		subFrmMain.basketCd_ctg_b.setAttribute("value", value8);
		subFrmMain.price_sale.setAttribute("value", value9);
		subFrmMain.discount.setAttribute("value", value10);
		subFrmMain.basketSeq_sle.setAttribute("value", value);
		
		subFrmMain.action = "/front/basket/setBasket.web";
		subFrmMain.target = "frmBlank";
		subFrmMain.submit();
	}
	
	function goWriteForm(value, value2, value3) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.goSeq_sle.setAttribute("value", value);
		frmMain.goCd_ctg_m.setAttribute("value", value2);
		frmMain.goCd_ctg_b.setAttribute("value", value3);
		
		frmMain.action="/front/buy/writeForm.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function surveyProc(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_survey_type.setAttribute("value", value);
		
		frmMain.action="/front/center/board/surveyProc.web";
		frmMain.submit();
	}
	
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/front/center/board/list.web";
		frmMain.submit();
	}
	</script>
</head>
<body >
<form id="subFrmMain" method="POST">
	<input type="hidden" name="basketList[0].point_stack"		id="point_stack"/>
	<input type="hidden" name="basketList[0].discount_sale"		id="discount_sale"/>
	<input type="hidden" name="basketList[0].img"				id="img"/>
	<input type="hidden" name="basketList[0].seq_sle"			id="basketSeq_sle"/>
	<input type="hidden" name="basketList[0].sle_nm"			id="sle_nm"/>
	<input type="hidden" name="basketList[0].cd_ctg_m"			id="basketCd_ctg_m"/>
	<input type="hidden" name="basketList[0].cd_ctg_b"			id="basketCd_ctg_b"/>
	<input type="hidden" name="basketList[0].price_sale"		id="price_sale"/>
	<input type="hidden" name="basketList[0].discount"			id="discount"/>
	<input type="hidden" name="basketList[0].count"				id="basketCount"		value="0" />
</form>
<form id="frmMain" method="POST" class="checkout__form">
	<input type="hidden" name="cd_survey_type"					id="cd_survey_type"/>
	<input type="hidden" name="gender"							id="gender"				value="${surveyDto.gender}"/>
	<input type="hidden" name="mbr_nm"							id="mbr_nm"				value="${surveyDto.mbr_nm}"/>
	<input type="hidden" name="user_age"						id="user_age"			value="${surveyDto.user_age}"/>
	<input type="hidden" name="seq_sle"							id="goSeq_sle"			value="0"/>
	<input type="hidden" name="cd_ctg_m"						id="goCd_ctg_m"/>
	<input type="hidden" name="cd_ctg_b"						id="goCd_ctg_b"/>
	<input type="hidden" name="cd_bbs_type"						id="cd_bbs_type" 		value = "0"/>
	<input type="hidden" name="type"							id="type"/>
	<input type="hidden" name="searchWord"						id="searchWord" />
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
	<section class="checkout spad" style="min-height: calc(100vh - 1px);padding-top: 0px;">
	<c:choose>
		<c:when test="${empty surveyListDto}">
			<div class="container">
				<div class="row" style="justify-content: center;display:block;background-color: #fff;max-width: 670px !important;width: 100% !important;margin-left: auto;margin-right: auto;">
					<div class="mySurveyTop" style=" ">
						<div class="survey-div" style="margin-bottom: 20px;">
							<h1 class="survey-h1-1">등록된 건강설문 결과표가 없습니다.</h1>
						</div>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
		<div class="container">
			<div class="survay_notice">
				 본 결과는 의사의 처방을 대신하지 않습니다. 
			</div>
			<!-- 고정 -->
			<div class="row" style="justify-content: center;display:block;background-color: #fff;max-width: 670px !important;width: 100% !important;margin-left: auto;margin-right: auto;">
				<div class="surveyTop"style="gap: 24px;">
					<div class="gnb" style="margin: 5px auto 0;display: flex; flex-direction: column;">
					<c:choose>
						<c:when test="${surveyDto.dt_upt == null || surveyDto.dt_upt == ''}">
							<a style="padding-top: 20px !important; color: #858585;text-align:center;font-size:28px">${surveyDto.dt_reg}의 건강설문 결과표</a>
						</c:when>
						<c:otherwise>
							<a style="padding-top: 20px !important; color: #858585;text-align:center;font-size:28px">${surveyDto.dt_upt}의 수정된 건강설문 결과표</a>
						</c:otherwise>
					</c:choose>
						<div class="survey-div" style="margin-bottom: 20px;">
							<h1 class="survey-h1-1">${surveyDto.mbr_nm} 님의
							<br>건강설문 결과표</h1>
							<h1 class="survey-h1-2">
							 성별 
							<c:if test="${surveyDto.gender == 'M'}">
								남성
							</c:if>
							<c:if test="${surveyDto.gender == 'F'}">
								여성
							</c:if>
							 <span>|</span> 나이 ${surveyDto.user_age}세 </h1>
						</div>
						
						<div class="survay_title_content">
							<h3>고객님께 추천드리는 분석결과</h3>
							<ul>
							<li><%@ include file="/include/front/surveyCtgG.jsp" %></li>
							<li><%@ include file="/include/front/surveyCtgF.jsp" %></li>
							<li><%@ include file="/include/front/surveyCtgI.jsp" %></li>
							</ul>
						</div>
					</div>
				</div>
				
				<!-- 	1번째 상품			 -->
				<c:forEach var="surveyListDto" items="${surveyListDto}"	varStatus="status">
					<c:forEach var="surveyDatas" items="${surveyListDto.surveyDatas}"	varStatus="status">
					<input type="hidden" name="basketList[${status.index}].point_stack"		id="point_stack"	value="${surveyDatas.point_stack}" />
					<input type="hidden" name="basketList[${status.index}].discount_sale"	id="discount_sale"	value="${surveyDatas.discount_sale}" />
					<input type="hidden" name="basketList[${status.index}].img"				id="img"			value="${surveyDatas.img}" />
					<input type="hidden" name="basketList[${status.index}].seq_sle"			id="seq_sle"		value="${surveyDatas.seq_sle}" />
					<input type="hidden" name="basketList[${status.index}].sle_nm"			id="sle_nm"			value="${surveyDatas.sle_nm}" />
					<input type="hidden" name="basketList[${status.index}].cd_ctg_m"		id="cd_ctg_m"		value="${surveyDatas.cd_ctg_m}" />
					<input type="hidden" name="basketList[${status.index}].cd_ctg_b"		id="cd_ctg_b"		value="${surveyDatas.cd_ctg_b}" />
					<input type="hidden" name="basketList[${status.index}].price_sale"		id="price_sale"		value="${surveyDatas.price_sale}" />
					<input type="hidden" name="basketList[${status.index}].discount"		id="discount"		value="${surveyDatas.discount}" />
					<input type="hidden" name="basketList[${status.index}].count"			id="basketCount"	value="1" />
					<div class="surveyResult" style="gap: 24px; ">
						<div class="gnb" style="margin: 5px auto 0; flex-direction: column;">
							<div class="my-survey-div" >
								<%@ include file="/include/front/surveyCtgBmodifyMain.jsp" %>
							</div>
							<div style="display: flex; align-items: flex-start; padding-top: 10px; padding-left: 20px;">
								<div class="cart-div" style="width: 80px; height: 80px; overflow: hidden;">
									<img class="cart-img-wrapper" src="/img/product/${surveyDatas.img}" alt="Product Image" style="max-width: 100%; max-height: 100%; width: auto; height: auto;">
								</div>
								<%@ include file="/include/front/surveyCtgBmodifySub.jsp" %>
							</div>
							<span style="display: block; padding-top: 10px;">${surveyDatas.sle_nm}</span>
							
							<div class="button-group" style="display: flex; justify-content: space-between;">
							<input type="button" value="개별 장바구니 담기" class="survey-btnCart" id="btnCart" onClick="setBasketOne('${surveyDatas.seq_sle}', '${surveyDatas.sle_nm}', '${surveyDatas.discount_sale}', '1',
							'${surveyDatas.img}', '${surveyDatas.point_stack}', '${surveyDatas.cd_ctg_m}', '${surveyDatas.cd_ctg_b}', '${surveyDatas.price_sale}', '${surveyDatas.discount}');"/>
							<input type="button" value="상품 상세정보 보기" class="surver-btnWrite" id="btnCart" onClick="javascript:goWriteForm('${surveyDatas.seq_sle}', '${surveyDatas.cd_ctg_m}', '${surveyDatas.cd_ctg_b}');">
							</div>
						</div>
					</div>
					</c:forEach>
				</c:forEach>
				
				<!-- 	전체 상품 연결한 부분			 -->
				<div class="survey" style="gap: 24px; height: 1px;margin-top: 190px; ">
					<div class="gnb" style="margin: 5px auto 0; flex-direction: column;">
					</div>
				</div>
				<!-- 	전체 상품			 -->
				<div class="survey-sticky" style="height:200px">
					<div class="gnb" style="margin: 5px auto 0; flex-direction: column;">
						<input type="button" value="전체 추천 제품 장바구니 담기" class="survey-allBtnCart" id="btnCart" onclick="setBasket();"/>
					</div>
					<div class="gnb" style="margin: 5px auto 0; flex-direction: column; ">
						<input type="button" value="설문조사 다시 하기" class="survey-reBtn" id="btnCart" onclick="surveyProc('2');"style="margin-top:50px"/>
					</div>
				</div>
			</div>
		</div>
		</c:otherwise>
	</c:choose>
	</section>

	<!-- Instagram Begin -->
	<!-- 페이지 하단 이미지가 나열 되는 곳 data-setbg="/img/instagram/insta-1.jpg" 이 부분을 우리 상품 이미지로 -->
	<%@ include file="/include/common/footerpic.jsp" %>
	<!-- Instagram End -->

	<!-- Footer Section Begin -->
	<%@ include file="/include/common/footer.jsp" %>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>
</form>
<iframe name="frmBlank" id="frmBlank" width="0" height="0"></iframe>
</body>
</html>