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
		
		<c:if test="${not empty sessionScope.SEQ_MBR}">	
			<div class="offcanvas__auth" style="text-align: left;">
				<a href="javascript:goMyPage()">마이페이지</a>
				<a href="javascript:goLogout()">로그아웃</a>
				<a href="javascript:goBasket()">장바구니</a>
			</div>
		</c:if>	
		
		<c:if test="${empty sessionScope.SEQ_MBR}">
			<div class="offcanvas__auth" style="text-align: left;">
				<a href="javascript:goLogin()">로그인</a>
				<a href="javascript:goRegisterForm()">회원가입</a>
			</div>
		</c:if>
		<select class="search-container" id="first_cd_ctg_android" style=" width: 100px !important; height: 45px !important; font-size: 18px !important; margin-right:5px">
			<option value="9"<c:if test="${paging.cd_ctg_b == 9}">selected</c:if>>상품명</option>
			<option value="1"<c:if test="${paging.cd_ctg_b == 1}">selected</c:if>>기능별</option>
			<option value="2"<c:if test="${paging.cd_ctg_b == 2}">selected</c:if>>성분별</option>
			<option value="3"<c:if test="${paging.cd_ctg_b == 3}">selected</c:if>>대상별</option>
		</select>
		
		<select  class="search-container" id="second_cd_ctg_android" style=" width: 120px !important; height: 45px !important; font-size: 18px !important;">
			<option value="10">전체검색</option>
		</select>
		<div>
		<input class="search-container" type="text" id="_searchWord_android" onkeydown="checkEnter(event)" style="height: 45px !important;  width: 157px !important;margin-top:20px"/>
		<a class="health-btn" href="javascript:goTypeTx('mobile');" style="margin-left: 10px; height: 42px !important; font-size: 17px !important ;margin-buttom:20px !important">
			검색
		</a>
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
<div class="header__right" style="position: absolute; bottom: -55px; right: 32.4% !important;">
	<div class="header__right__auth" style="display: flex; align-items: center; gap: 5px;">
		<div style="display: flex; justify-content: center; align-items: center; margin-bottom: 40px !important;">
		<select class="search-container" id="first_cd_ctg" style=" width: 120px !important; height: 45px !important; font-size: 18px !important;">
			<option value="9"<c:if test="${paging.cd_ctg_b == 9}">selected</c:if>>상품명</option>
			<option value="1"<c:if test="${paging.cd_ctg_b == 1}">selected</c:if>>기능별</option>
			<option value="2"<c:if test="${paging.cd_ctg_b == 2}">selected</c:if>>성분별</option>
			<option value="3"<c:if test="${paging.cd_ctg_b == 3}">selected</c:if>>대상별</option>
		</select>
		<select  class="search-container" id="second_cd_ctg" style=" width: 170px !important; height: 45px !important; font-size: 18px !important;">
			<option value="10">전체검색</option>
		</select>
		<input class="search-container" value="${paging.searchWord}" type="text" id="_searchWord_desktop" onkeydown="checkEnter(event)" style="height: 45px !important; font-size: 18px !important; width: 300px !important;"/>
		<a class="health-btn" href="javascript:goTypeTx('pc');" style="margin-left: 10px; height: 45px !important; font-size: 18px !important;">
			검색
		</a>
		</div>
	</div>
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
<div class="col-xl-12 col-lg-12" style="margin: 0 auto; float: none; width: 90%;">
	<nav class="header__menu" style="margin-bottom: 20px !important;">
		<ul style="display: inline-block; width: 90%; list-style: none;">
			<li class="active" style="display: inline-block; margin: 0 57px;">
				<a href="javascript:goTypeT('', '', '', '', '', '');">
					<img src="/img/icon/ctg.png" alt="전체 상품" style="width: 24px; height: 24px;">
				</a>
				<ul class="dropdown" style="top: 100%; left: 0; list-style: none;">
					<li><a href="javascript:goTypeF('', '', '', '', '', '');">기능별</a></li>
					<li><a href="javascript:goTypeI('', '', '', '', '', '');">성분별</a></li>
					<li><a href="javascript:goTypeG('', '', '', '', '', '');">대상별</a></li>
					<li><a href="javascript:goHealth();">맞춤 건강 관리</a></li>
					<li><a href="javascript:goList(1);">고객 센터</a></li>
					<li><a href="javascript:goIntro();">소개</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px; position: relative;">
				<a href="javascript:goTypeF('', '', '', '', '', '');" style="font-size: 18px; font-weight: bold;">기능별</a>
				<ul class="dropdown" style="top: 100%; left: 0; list-style: none;">
					<li><a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');">혈당/혈행/혈압</a></li>
					<li><a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');">항산화/면역력</a></li>
					<li><a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');">염증/항염</a></li>
					<li><a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');">관절/뼈/치아</a></li>
					<li><a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');">피로회복</a></li>
					<li><a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');">눈 건강</a></li>
					<li><a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');">장 건강</a></li>
					<li><a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');">두뇌/기억력</a></li>
					<li><a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');">위/간/갑상선</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px; position: relative;">
				<a href="javascript:goTypeI('', '', '', '', '', '');" style="font-size: 18px; font-weight: bold;">성분별</a>
				<ul class="dropdown" style="top: 100%; left: 0; list-style: none;">
					<li><a href="javascript:goTypeI('pol', '', '', '', '${paging.cd_ctg_m}', '');">폴리코사놀</a></li>
					<li><a href="javascript:goTypeI('omg', '', '', '', '${paging.cd_ctg_m}', '');">오메가-3</a></li>
					<li><a href="javascript:goTypeI('min', '', '', '', '${paging.cd_ctg_m}', '');">비타민/미네랄</a></li>
					<li><a href="javascript:goTypeI('bac', '', '', '', '${paging.cd_ctg_m}', '');">유산균</a></li>
					<li><a href="javascript:goTypeI('msm', '', '', '', '${paging.cd_ctg_m}', '');">글루코사민/MSM</a></li>
					<li><a href="javascript:goTypeI('rut', '', '', '', '${paging.cd_ctg_m}', '');">루테인</a></li>
					<li><a href="javascript:goTypeI('kou', '', '', '', '${paging.cd_ctg_m}', '');">코큐텐</a></li>
					<li><a href="javascript:goTypeI('arg', '', '', '', '${paging.cd_ctg_m}', '');">아르기닌</a></li>
					<li><a href="javascript:goTypeI('mik', '', '', '', '${paging.cd_ctg_m}', '');">밀크씨슬</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px; position: relative;">
				<a href="javascript:goTypeG('', '', '', '', '', '');" style="font-size: 18px; font-weight: bold;">대상별</a>
				<ul class="dropdown" style="top: 100%; left: 0; list-style: none;">
					<li><a href="javascript:goTypeG('M', '', '', '', '${paging.cd_ctg_m}', '');">남성</a></li>
					<li><a href="javascript:goTypeG('F', '', '', '', '${paging.cd_ctg_m}', '');">여성</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px; position: relative;">
				<a href="javascript:goHealth();" style="font-size: 18px; font-weight: bold;">맞춤 건강 관리</a>
				<ul class="dropdown" style="top: 100%; left: 0; list-style: none;">
					<li><a href="javascript:goSurvey()">맞춤 건강 추천</a></li>
					<li><a href="javascript:goSearch()">안심 조회 서비스</a></li>
					<li><a href="javascript:goHealthInfo()">건강 정보</a></li>
					<li><a href="javascript:goList(4)">새소식</a></li>
					<li><a href="javascript:goIngredInfo()">성분 사전</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px; position: relative;">
				<a href="javascript:goList(1);" style="font-size: 18px; font-weight: bold;">고객 센터</a>
				<ul class="dropdown" style="top: 100%; left: 0; list-style: none;">
					<li><a href="javascript:goList(1);" >공지사항</a></li>
					<li><a href="javascript:goList(2);" >자주 묻는 질문</a></li>
					<li><a href="javascript:goList(3);" >1대1 문의 사항</a></li>
				</ul>
			</li>
			<li style="display: inline-block; margin: 0 57px;">
				<a href="javascript:goIntro();" 
				style="font-size: 18px; font-weight: bold;">소개</a>
			</li>
		</ul>
		
	</nav>	
	<div class="canvas__open">
			<i class="fa fa-bars"></i>
	</div>
</div>
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

var secondSelect = document.getElementById("second_cd_ctg");
var selectedSecondValue = "${paging.cd_ctg_m}";

var options = {
		
	"9": [{ value: "10", text: "전체검색" }],
	"1": [
		{ value: "10", text: "전체검색" },
		{ value: "1", text: "혈당/혈행/혈압" },
		{ value: "2", text: "항산화/면역력" },
		{ value: "3", text: "염증/항염" },
		{ value: "4", text: "관절/뼈/치아" },
		{ value: "5", text: "피로회복" },
		{ value: "6", text: "눈 건강" },
		{ value: "7", text: "장 건강" },
		{ value: "8", text: "두뇌/기억력" },
		{ value: "9", text: "위/간/갑상선" }
	],
	"2": [
		{ value: "10", text: "전체검색" },
		{ value: "1", text: "폴리코사놀" },
		{ value: "2", text: "오메가-3" },
		{ value: "3", text: "비타민/미네랄" },
		{ value: "4", text: "유산균" },
		{ value: "5", text: "글루코사민/MSM" },
		{ value: "6", text: "루테인" },
		{ value: "7", text: "코큐텐" },
		{ value: "8", text: "아르기닌" },
		{ value: "9", text: "밀크씨슬" }
	],
	"3": [
		{ value: "10", text: "전체검색" },
		{ value: "1", text: "남성" },
		{ value: "2", text: "여성" }
	]
};

document.getElementById("first_cd_ctg").addEventListener("change", function() {
	
	var selectedValue = this.value;
	var selectedOptions = options[selectedValue] || [];
	
	secondSelect.innerHTML = "";
	
	selectedOptions.forEach(option => {
		
		var opt = document.createElement("option");
		opt.value = option.value;
		opt.textContent = option.text;
		
		if (option.value === selectedSecondValue) {
			
			opt.selected = true;
		}
		
		secondSelect.appendChild(opt);
	});
});

document.getElementById("first_cd_ctg").dispatchEvent(new Event("change"));

function checkEnter(event) {
	
	if (event.keyCode === 13) {
		
		event.preventDefault();
		
		goTypeTx('pc');
	}
}



var secondSelectAndroid = document.getElementById("second_cd_ctg_android");
var selectedSecondValueAndroid = "${paging.cd_ctg_m}";

var options = {
		
	"9": [{ value: "10", text: "전체검색" }],
	"1": [
		{ value: "10", text: "전체검색" },
		{ value: "1", text: "혈당/혈행/혈압" },
		{ value: "2", text: "항산화/면역력" },
		{ value: "3", text: "염증/항염" },
		{ value: "4", text: "관절/뼈/치아" },
		{ value: "5", text: "피로회복" },
		{ value: "6", text: "눈 건강" },
		{ value: "7", text: "장 건강" },
		{ value: "8", text: "두뇌/기억력" },
		{ value: "9", text: "위/간/갑상선" }
	],
	"2": [
		{ value: "10", text: "전체검색" },
		{ value: "1", text: "폴리코사놀" },
		{ value: "2", text: "오메가-3" },
		{ value: "3", text: "비타민/미네랄" },
		{ value: "4", text: "유산균" },
		{ value: "5", text: "글루코사민/MSM" },
		{ value: "6", text: "루테인" },
		{ value: "7", text: "코큐텐" },
		{ value: "8", text: "아르기닌" },
		{ value: "9", text: "밀크씨슬" }
	],
	"3": [
		{ value: "10", text: "전체검색" },
		{ value: "1", text: "남성" },
		{ value: "2", text: "여성" }
	]
};

document.getElementById("first_cd_ctg_android").addEventListener("change", function() {
	
var selectedValue = this.value;
var selectedOptions = options[selectedValue] || [];

secondSelectAndroid.innerHTML = "";

	selectedOptions.forEach(option => {
		
		var opt = document.createElement("option");
		opt.value = option.value;
		opt.textContent = option.text;
		
		if (option.value === selectedSecondValueAndroid) {
			
			opt.selected = true;
		}
		secondSelectAndroid.appendChild(opt);
	});
});

document.getElementById("first_cd_ctg_android").dispatchEvent(new Event("change"));

function goHealth() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/front/center/board/personalHealth/index.web";
	frmMain.target = "";
	frmMain.submit();
}

function goIntro() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/front/center/board/introduce/index.web";
	frmMain.target = "";
	frmMain.submit();
}

function goHealthInfo() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/front/center/board/health/list.web";
	frmMain.target = "";
	frmMain.submit();
}

function goIngredInfo() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/front/center/board/ingred/list.web";
	frmMain.target = "";
	frmMain.submit();
}

function goSurvey() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/front/center/board/surveyForm.web";
	frmMain.target = "";
	frmMain.submit();
}

function goSearch() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/front/center/board/personalHealth/searchForm.web";
	frmMain.target = "";
	frmMain.submit();
}

function hpSurgoList(value) {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.cd_bbs_type.setAttribute("value", value);
	frmMain.action = "/front/hpSur/ingredient.web";
	frmMain.target = "";
	frmMain.submit();
}

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