<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/member/passwd/modifyForm.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">
<head>
	<%@ include file="/include/common/header.jsp" %>
	<%@ include file="/include/common/css.jsp" %>
	<%@ include file="/include/common/webfont.jsp" %>
	<script type="text/javascript" src="/js/front.js"></script>
	<script>
	function clearAllTextBoxes() {
		$('input[type=password').val('');
	}
	
	function checkModify() {
		
		var frmMain = document.getElementById("frmMain");
		
		var passwd = $("#passwd").val();	// 현재 비밀번호
		
		var confirmPasswd	= $("#confirmPasswd").val();
		var confirmPasswd_	= $("#confirmPasswd_").val();
		
		// 현재 비밀번호가 비어 있는지 확인
		if (!passwd) {
			alert("현재 비밀번호를 입력해주세요!");
			return;
		}
		
		// 신규 비밀번호가 비어 있는지 확인
		if (!confirmPasswd) {
			alert("신규 비밀번호를 입력해주세요!");
			return;
		}
		
		// 비밀번호 확인이 비어 있는지 확인
		if (!confirmPasswd_) {
			alert("신규 비밀번호 확인을 입력해주세요!");
			return;
		}
		
		// 신규 비밀번호와 비밀번호 확인이 일치하는지 확인
		if (confirmPasswd != confirmPasswd_) {
			alert("신규 비밀번호와 비밀번호 확인이 일치하지 않습니다!");
			return;
		}
		
		// 비밀번호가 규칙에 맞는지 확인 (예: 최소 8자, 대문자 포함)
		if (confirmPasswd.length < 8) {
			alert("신규 비밀번호는 최소 8자 이상이어야 합니다!");
			return;
		}
		
		if (confirmPasswd.length > 16) {
			alert("신규 비밀번호는 최대 16자 입니다!");
			return;
		}
		
		// 폼을 제출
		frmMain.action = "/front/member/passwd/modifyProc.web";
		frmMain.submit();
	}
	
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/front/center/board/list.web";
		frmMain.submit();
	}
	</script>
	<style>
	
		@media (min-width: 1200px) {
			.header__menu::after {width:100%;}
		}
		@media (min-width: 992px) {
			.container, .container-lg, .container-md, .container-sm {max-width:900px;}
		}
	</style>
</head>
<body>
<form id="frmMain" method="POST" class="checkout__form">
<input type="hidden" name="cd_bbs_type"			id="cd_bbs_type" value = "0"/>
<input type="hidden" name="type"				id="type"/>
<input type="hidden" name="searchWord"			id="searchWord"/>
<input type="hidden" name="cd_ctg_b"			id="cd_ctg_b"/>
<input type="hidden" name="cd_ctg_m"			id="cd_ctg_m"/>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<!-- 페이지의 상단에 보이는 로고 및 로그인 / 회원가입 코드 -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->
		<%@ include file="/include/front/mygnb.jsp" %>
	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->

		<section class="checkout spad" style="min-height: calc(100vh - 1px); ">
			<div class="container">
				<div class="row" style="display: flex; justify-content: center; align-items: center;">
					<div class="col-lg-8">
						<h5 >비밀번호 변경</h5>
						<div class="row">
							<div class="col-lg-12 col-md-6 col-sm-6">
								<div class="checkout__form__input">
									<p>현재 비밀번호 <span>*</span> </p>
									<input type="password" id="passwd" name="passwd"  />
								</div>
							</div>
							<div class="col-lg-12 col-md-6 col-sm-6">
								<div class="checkout__form__input">
									<p>신규 비밀번호 <span>*</span> (영문 대/소문자 구분, 숫자, 특수문자 포함 8~16자 필수 입력)</p>
									<input type="password" id="confirmPasswd" name="confirmPasswd"  />
								</div>
							</div>
							<div class="col-lg-12 col-md-6 col-sm-6">
								<div class="checkout__form__input">
									<p>신규 비밀번호 확인 <span>*</span> </p>
									<input type="password" id="confirmPasswd_" name="confirmPasswd_"  />
								</div>
							</div>
							<div class="col-lg-12 col-md-6 col-sm-6">

								<br>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6" style="padding-left: 8px; padding-right: 8px;">
								<div class="checkout__form__input">
									<input type="button" value="다시 쓰기" id="clear" onClick="clearAllTextBoxes();"/>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6" style="padding-left: 8px; padding-right: 8px;">
								<div class="checkout__form__input">
									<input type="button" value="수정 하기" onClick="checkModify();"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

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