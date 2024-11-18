	<!-- html 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/popup/event.jsp" %>
<!-- 이 부분은 필요에 따라 추가하는 것이 맞으므로 개별 판단에 따라 추가하거나 삭제해도 되고 사용하지 않더라도 그대로 넣어둬도 무방하다고 판단 -->
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
	
	function goTypeT(value, value2, value3, value4, value5) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = "1";
		frmMain.type.setAttribute("value", value);
		frmMain.filter.setAttribute("value", value2);
		frmMain.corp_nm.setAttribute("value", value3);
		frmMain.prd_type.setAttribute("value", value4);
		frmMain.cd_ctg_m.setAttribute("value", value5);
		frmMain.cd_ctg_b.setAttribute("value", '');
		
		frmMain.action = "/front/sale/total_list.web";
		frmMain.submit();
	}
	
	function goTypeF(value, value2, value3, value4, value5) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = "1";
		frmMain.type.setAttribute("value", value);
		frmMain.filter.setAttribute("value", value2);
		frmMain.corp_nm.setAttribute("value", value3);
		frmMain.prd_type.setAttribute("value", value4);
		frmMain.cd_ctg_m.setAttribute("value", value5);
		
		frmMain.action = "/front/sale/function_list.web";
		frmMain.submit();
	}
	
	function goTypeI(value, value2, value3, value4, value5) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = "1";
		frmMain.type.setAttribute("value", value);
		frmMain.filter.setAttribute("value", value2);
		frmMain.corp_nm.setAttribute("value", value3);
		frmMain.prd_type.setAttribute("value", value4);
		frmMain.cd_ctg_m.setAttribute("value", value5);
		
		frmMain.action = "/front/sale/ingredient_list.web";
		frmMain.submit();
	}
	
	function goTypeG(value, value2, value3, value4, value5) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = "1";
		frmMain.type.setAttribute("value", value);
		frmMain.filter.setAttribute("value", value2);
		frmMain.corp_nm.setAttribute("value", value3);
		frmMain.prd_type.setAttribute("value", value4);
		frmMain.cd_ctg_m.setAttribute("value", value5);
		
		frmMain.action = "/front/sale/gender_list.web";
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
<input type="hidden" name="seq_sle"			id="seq_sle"/>
<input type="hidden" name="cd_ctg_m"		id="cd_ctg_m"/>
<input type="hidden" name="cd_ctg_b"		id="cd_ctg_b"/>
<input type="hidden" name="corp_nm"			id="corp_nm"/>
<input type="hidden" name="prd_type"		id="prd_type"/>
<input type="hidden" name="filter"			id="filter"/>
<input type="hidden" name="type"			id="type"/>
<input type="hidden" name="currentPage"		id="currentPage"	value="1"/>
<input type="hidden" name="searchWord"		id="searchWord"/>
<input type="hidden" name="cd_bbs_type"		id="cd_bbs_type"	value="0"/>
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
	
	<!-- Blog Section Begin -->
	<br>
	<h6 style="text-align: center; letter-spacing: 1.5px; border: none; padding-bottom: 60px; font-size: 30px; font-weight: bold;">11월 이벤트</h6>

	<div style="position: relative; text-align: center; width: 100%; max-width: 600px; margin: 0 auto;">
		<img src="/img/popup/event.jpg" alt="Local Image" style="width: 100%; height: auto;">
		 <div style="position: absolute; top: calc(50% - 2cm); left: 50%; transform: translate(-50%, -50%); background-color: rgba(0, 0, 0, 0.5); padding: 10px 20px; border-radius: 10px;">
			<a href="javascript:goTypeT('', '', '', '', '', '');" style="color: white; text-decoration: none; font-size: 24px; font-weight: bold;">상품으로 바로이동!</a>
		</div>
	</div>
	<!-- Blog Section End -->

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