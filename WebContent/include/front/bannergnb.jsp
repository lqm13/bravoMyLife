<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__close">+</div>
		
		<div class="offcanvas__logo">
			<a href="./index.html"><img src="/img/logo/logo3.png" alt=""></a>
		</div>
		
		<div id="mobile-menu-wrap" style="text-align:left; margin-left: -60px;display: flex;flex-wrap:wrap"></div>
		
		<div class="offcanvas__auth" style="text-align: left;">
			<a href="javascript:goLogin()">로그인</a>
			<a href="javascript:goRegisterForm()">회원가입</a>
		</div>
	</div>
<header class="header" style="background-color: #341d08; height: 240px; position: relative;">
<div class="container-fluid">
	<div class="row">
		<div class="col-xl-3 col-lg-2">
		</div>
	</div>
</div>
<div class="header__logo" style="position: absolute; top: 45%; left: 50%; transform: translate(-50%, -50%);">
	<a href="/"><img src="/img/logo/logo3.png" alt=""></a>
</div>
<div class="header__right" style="position: absolute; bottom: -10px; right: 19%;">
<div class="header__right__auth" style="display: flex; align-items: center; gap: 5px;">
	<c:if test="${not empty sessionScope.SEQ_MBR}">
		<a href="javascript:goMyPage()" title="${sessionScope.NAME}" style="color: white; font-size: 15px;">
			마이페이지
		</a>
		<a href="javascript:goLogout()" style="color: white; font-size: 15px;">
			로그아웃
		</a>
		<a href="javascript:goBasket()" style="color: white; font-size: 15px;">
			장바구니
		</a>
		<ul class="header__right__widget" style="list-style: none; margin: 0; padding: 0; display: flex; align-items: center;">
			<li style="position: relative; display: inline-block; padding-bottom: 2px;">
				<span class="icon_bag_alt" 
					style="font-size: 20px; display: inline-block; position: relative; width: 20px; height: 20px;">
				</span>
				<div id="basket-count" class="tip" style="position: absolute; top: -12px; right: -12px; font-size: 15px; width: 12px; height: 12px; display: flex; transform: translate(-30%, -30%);">
					2
				</div>
			</li>
		</ul>
	</c:if>	 
	<c:if test="${empty sessionScope.SEQ_MBR}">
		<a href="javascript:goLogin()" style="color: white; font-size: 15px;">로그인</a>
		<a href="javascript:goRegisterForm()" style="color: white; font-size: 15px;">회원가입</a>
	</c:if>
</header>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function () {
	
	function basketData() {
		
		$.ajax({
			type: "POST",
			url: "/front/member/currentBasket.json",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			success: function (res) {
				
				if (res.memberDto) {
					
					$("#basket-count").text(res.memberDto.current_basket);
				} else {
					
					$("#basket-count").text(0);
				}
			},
		});
	}
	basketData();
});




	function goLogin() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/login/loginForm.web";
		frmMain.submit();
	}
	
	function goLogout() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/login/logout.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goRegisterForm() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/member/registerForm.web";
		frmMain.submit();
	}
	
	function goMyPage() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/myPage/index.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goBasket() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/basket/main.web";
		frmMain.target = "";
		frmMain.submit();
	}
</script>