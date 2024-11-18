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
	
	function surveyProc(value) {
		
		if (!isLogin) {
			alert("로그인이 필요합니다.");
			return;
		}
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_survey_type.setAttribute("value", value);
		
		frmMain.action="/front/center/board/surveyProc.web";
		frmMain.submit();
	}
	</script>

	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>

<body>
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

	<section class="checkout spad" >
		<div class="container">
			<form id="frmMain" method="POST" class="checkout__form">
			<input type="hidden" name="cd_survey_type"				id="cd_survey_type"/>
				<div class="row"style="display: flex; justify-content: center; align-items: center; margin-bottom: 30px !important;">
					<div class="col-lg-12" style="max-width: 670px !important; width: 100% !important; text-align: center;">
						<div style="position: relative; text-align: center; width: 100%; max-width: 600px; margin: 0 auto;">
							<img src="/img/personalhealth/servey.png" alt="Local Image" style="width: 100%; height: auto;">
							<div style="position: absolute; top: calc(95% - 2cm); left: 50%; transform: translate(-50%, -50%); background-color: rgba(130, 130, 130, 0.5); padding: 10px 20px; border-radius: 10px;">
								<a href="javascript:surveyProc('2');" style="color: white; text-decoration: none; font-size: 24px; font-weight: bold;">설문 조사 시작</a>
							</div>
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
</body>
</html>