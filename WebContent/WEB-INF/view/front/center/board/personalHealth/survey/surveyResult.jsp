	<!-- html 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/sale/function_list.jsp" %>
<!-- 이 부분은 필요에 따라 추가하는 것이 맞으므로 개별 판단에 따라 추가하거나 삭제해도 되고 사용하지 않더라도 그대로 넣어둬도 무방하다고 판단 -->
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
	<c:if test="${empty sessionScope.SEQ_MBR}">
	var isLogin = false;
	</c:if>
	
	<c:if test="${not empty sessionScope.SEQ_MBR}">
	var isLogin = true;
	</c:if>
	
	function setBasket() {
		
		if (!isLogin) {
			alert("로그인이 필요합니다.");
			return;
		}
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/basket/setBasket.web";
		frmMain.target = "frmBlank";
		frmMain.submit();
	}
	
	function setBasketOne(value, value2, value3,value4, value5, value6, value7, value8, value9, value10) {
		
		if (!isLogin) {
			alert("로그인이 필요합니다.");
			return;
		}
		
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
	
	</script>

	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>

<body style="background-color: #f8f8f8;">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<!-- 페이지의 상단에 보이는 로고 및 로그인 / 회원가입 코드 -->
	<%@ include file="/include/front/bannergnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->

	<section class="checkout spad" style="padding-top: 0px;">
		<div class="container">
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
			<div class="survay_notice">
				 본 결과는 의사의 처방을 대신하지 않습니다. 
			</div>
			<!-- 고정 -->
			<div class="row" style="justify-content: center;display:block;background-color: #fff;max-width: 670px !important;width: 100% !important;margin-left: auto;margin-right: auto;">
				<div class="surveyTop"style="gap: 24px;">
					<div class="gnb" style="margin: 5px auto 0;display: flex; flex-direction: column;">
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
					<input type="hidden" name="basketList[${status.index}].point_stack"		id="point_stack"	value="${surveyListDto.point_stack}" />
					<input type="hidden" name="basketList[${status.index}].discount_sale"	id="discount_sale"	value="${surveyListDto.discount_sale}" />
					<input type="hidden" name="basketList[${status.index}].img"				id="img"			value="${surveyListDto.img}" />
					<input type="hidden" name="basketList[${status.index}].seq_sle"			id="seq_sle"		value="${surveyListDto.seq_sle}" />
					<input type="hidden" name="basketList[${status.index}].sle_nm"			id="sle_nm"			value="${surveyListDto.sle_nm}" />
					<input type="hidden" name="basketList[${status.index}].cd_ctg_m"		id="cd_ctg_m"		value="${surveyListDto.cd_ctg_m}" />
					<input type="hidden" name="basketList[${status.index}].cd_ctg_b"		id="cd_ctg_b"		value="${surveyListDto.cd_ctg_b}" />
					<input type="hidden" name="basketList[${status.index}].price_sale"		id="price_sale"		value="${surveyListDto.price_sale}" />
					<input type="hidden" name="basketList[${status.index}].discount"		id="discount"		value="${surveyListDto.discount}" />
					<input type="hidden" name="basketList[${status.index}].count"			id="basketCount"	value="1" />
				<div class="surveyResult" style="gap: 24px; border-top: 16px solid #f4f4f4;">
					<div class="gnb" style="margin: 5px auto 0; flex-direction: column;">
						<div class="survey-div">
							<%@ include file="/include/front/surveyCtgBmain.jsp" %>
						</div>
						<div style="display: flex; align-items: flex-start; padding-top: 10px; padding-left: 20px;">
							<div class="cart-div" style="width: 80px; height: 80px; overflow: hidden;">
								<img class="cart-img-wrapper" src="/img/product/${surveyListDto.img}" alt="Product Image" style="max-width: 100%; max-height: 100%; width: auto; height: auto;">
							</div>
							<%@ include file="/include/front/surveyCtgBsub.jsp" %>
						</div>
						<span style="display: block; padding-top: 10px;">${surveyListDto.sle_nm}</span>
						
						<div class="button-group" style="display: flex; justify-content: space-between;">
						<input type="button" value="개별 장바구니 담기" class="survey-btnCart" id="btnCart" onClick="setBasketOne('${surveyListDto.seq_sle}', '${surveyListDto.sle_nm}', '${surveyListDto.discount_sale}', '1',
						'${surveyListDto.img}', '${surveyListDto.point_stack}', '${surveyListDto.cd_ctg_m}', '${surveyListDto.cd_ctg_b}', '${surveyListDto.price_sale}', '${surveyListDto.discount}');"/>
						<input type="button" value="상품 상세정보 보기" class="surver-btnWrite" id="btnCart" onClick="javascript:goWriteForm('${surveyListDto.seq_sle}', '${surveyListDto.cd_ctg_m}', '${surveyListDto.cd_ctg_b}');">
						</div>
					</div>
				</div>
				</c:forEach>
				
				<!-- 	전체 상품 연결한 부분			 -->
				<div class="survey" style="gap: 24px; height: 1px; border-top: 16px solid #f4f4f4;">
					<div class="gnb" style="margin: 5px auto 0; flex-direction: column;">
					</div>
				</div>
				<!-- 	전체 상품			 -->
				<div class="survey-sticky" >
					<div class="gnb" style="margin: 5px auto 0; flex-direction: column;">
						<input type="button" value="전체 추천 제품 장바구니 담기" class="survey-allBtnCart" id="btnCart" onClick="setBasket();"/>
					</div>
				</div>
			</div>
			</form>
		</div>
	</section>
	<!-- Footer Section Begin -->
	<%@ include file="/include/common/footer.jsp" %>
	<%@ include file="/include/common/footer-copyright.jsp" %>
	<!-- Footer Section End -->
	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>
<iframe name="frmBlank" id="frmBlank" width="0" height="0"></iframe>
</body>
</html>