<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/login/loginForm.jsp" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
	<script type="text/javascript" src="/js/front.js"></script>
	<script>
		window.onload = function () {
			if ("${url}") {
				alert("로그인이 필요합니다.");
			}
		}
		
		window.onload = function() {
			var savedEmail = localStorage.getItem("savedEmail");
			if (savedEmail) {
				document.getElementById("email").value = savedEmail;
				document.getElementById("rememberMe").checked = true;
			}
		}
		
		document.addEventListener('DOMContentLoaded', function () {
			const loginInput = document.getElementById('passwd');
			const loginButton = document.getElementById('loginId');

			loginInput.addEventListener('keydown', function(event) {
				if (event.key === "Enter") {
					loginButton.click();
				}
			});
		});
	</script>
	<style>
	
		@media (min-width: 1200px) {
			.header__menu::after {width:100%;}
		}
		@media (min-width: 992px) {
			.container, .container-lg, .container-md, .container-sm {max-width:700px;}
		}
	</style>
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->

<!-- Login Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<form id="frmMain" method="POST" class="checkout__form">
				<div class="row" style="display: flex; justify-content: center; align-items: center;">
					<div class="col-lg-8">
						<h5 >회원 로그인</h5>
						<div class="row">
							<div class="col-lg-12 col-md-6 col-sm-6">
								<div class="checkout__form__input">
									<input type="text" id="email" name="email" value="${cookie.email}" placeholder="이메일을 입력해주세요." maxlength="32" autocomplete="off" required>
								</div>
							</div>
							<div class="col-lg-12 col-md-6 col-sm-6">
								<div class="checkout__form__input">
									<input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요." autocomplete="off" required>
								</div>
							</div>
							<div class="col-lg-12 col-md-6 col-sm-6">
								<div class="checkout__form__checkbox">
									<input type="checkbox" id="rememberMe" > 아이디 저장
								</div>
							</div>
							<div class="col-lg-12 col-md-6 col-sm-6">
								<div class="checkout__form__input">
									<input type="button" value="로그인" id="loginId" onClick="checkLogin();"/>
								</div>
								<hr style="border: 1px solid #ccc; margin: 0;">
								<br>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4" style="padding-left: 8px; padding-right: 8px;">
								<div class="checkout__form__input">
									<input type="button" value="회원가입" id="registerId" onClick="goToRegister();"/>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4" style="padding-left: 8px; padding-right: 8px;">
								<div class="checkout__form__input">
									<input type="button" value="아이디 찾기" id="findId" onClick="moveToFindId();"/>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4" style="padding-left: 8px; padding-right: 8px;">
								<div class="checkout__form__input">
									<input type="button" value="비밀번호 찾기" id="findPasswd" onClick="moveToFindPasswd();"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
<!-- Login Section End -->

	<!-- Instagram Begin -->
	<!-- 페이지 하단 이미지가 나열 되는 곳 data-setbg="/img/instagram/insta-1.jpg" 이 부분을 우리 상품 이미지로 -->
	<%@ include file="/include/common/footerpic.jsp" %>
	<!-- Instagram End -->

	<!-- Footer Section Begin -->
	<%@ include file="/include/common/footer.jsp" %>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>
</body>
</html>