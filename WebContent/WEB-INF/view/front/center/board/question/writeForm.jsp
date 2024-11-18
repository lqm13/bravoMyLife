<!-- html 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/center/board/question/writeForm.jsp" %>
<!-- 이 부분은 필요에 따라 추가하는 것이 맞으므로 개별 판단에 따라 추가하거나 삭제해도 되고 사용하지 않더라도 그대로 넣어둬도 무방하다고 판단 -->
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">
<head>
	<%@ include file="/include/common/header.jsp" %>
	<style></style>
	<script type="text/javascript" src="/js/package/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/package/tinymce.js"></script>
	<script>
	window.onload = function () {
		// HTML Editor
		tinymce.init({selector:'textarea'});
	}
	
	function goList(value) {
		var frmMain = document.getElementById("frmMain");
		document.getElementById("cd_bbs_type").value = value;
		frmMain.action="/front/center/board/list.web";
		frmMain.submit();
	}
	
	function writeProc(value) {
		var frmMain = document.getElementById("frmMain");
		document.getElementById("cd_bbs_type").value = value;
		
		if (document.getElementById("title").value == ""
				|| document.getElementById("cd_ctg").value == "0"
				|| tinymce.activeEditor.getContent() == "") {
			alert("필수 항목을 입력하세요!");
			return;
		}
		frmMain.action="/front/center/board/writeProc.web";
		frmMain.submit();
	}
	
	function goTypeF(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", value);
		frmMain.action = "/front/sale/function_list.web";
		frmMain.submit();
	}
	
	function goTypeI(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", value);
		frmMain.action = "/front/sale/ingredient_list.web";
		frmMain.submit();
	}
	
	function goTypeG(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", value);
		frmMain.action = "/front/sale/gender_list.web";
		frmMain.submit();
	}
	
	function goTypeT(value) {
		
		var first_cd_ctg		= document.getElementById("first_cd_ctg").value;
		var second_cd_ctg		= document.getElementById("second_cd_ctg").value;
		var _searchWord			= document.getElementById("_searchWord").value;
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_ctg_b.setAttribute("value", first_cd_ctg);
		frmMain.cd_ctg_m.setAttribute("value", second_cd_ctg);
		frmMain.searchWord.setAttribute("value", _searchWord);
		
		frmMain.type.setAttribute("value", value);
		frmMain.action = "/front/sale/total_list.web";
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
	
	</script>
<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>	
</head>
<body>

<form id="frmMain" method="POST" enctype="multipart/form-data" class="checkout__form">
<input type="hidden" id="cd_bbs_type" 	name="cd_bbs_type" value="0"/>
<input type="hidden" id="type"			name="type"/>
<input type="hidden" id="cd_ctg_m" 		name="cd_ctg_m"/>
<input type="hidden" id="cd_ctg_b"		name="cd_ctg_b"/>
<input type="hidden" id="searchWord"	name="searchWord"/>
<input type="hidden" id="_searchWord"	name="_searchWord"/>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<!-- Header Section Begin -->
	<!-- 페이지의 상단에 보이는 로고 및 로그인 / 회원가입 코드 -->
	<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->
	<section class="shop spad">
		<div class="container">
			<article class="txtCenter">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="checkout__form__input">
						<p style="font-weight: bold; margin-bottom: 5px; font-size: 16px;">제목 <span>*</span></p>
						<input type="text" id="title" name="title" required style="width: 40%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; font-size: 14px;"/>
					</div>
				</div>
				<br/>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="checkout__form__input">
						<p style="font-weight: bold; margin-bottom: 5px; font-size: 16px;">카테고리 <span>*</span></p>
						<select id="cd_ctg" name="cd_ctg" required>
						<option value="0">선택</option>
						<option value="1">가입 및 탈퇴</option>
						<option value="2">상품</option>
						<option value="3">구매</option>
						<option value="4">결제</option>
						<option value="5">배송</option>
						<option value="6">환불</option>
						<option value="9">기타</option>
						</select>
					</div>
				</div>
				<br/>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="checkout__form__input">
						<p style="font-weight: bold; margin-bottom: 5px; font-size: 16px;">내용 <span>*</span></p>
							<textarea id="content" name="content" required></textarea>
					</div>
				</div>
				<br/>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="checkout__form__input">
						<p style="font-weight: bold; margin-bottom: 5px; font-size: 16px;">첨부 파일 <span></span></p>
							<input type="file" id="files[0]" name="files[0]" style="border: 0px solid #e1e1e1;"/>
					</div>
				</div>
				<br/>
				<br/>
				<div style="width: 900px; margin-left: auto; margin-right: auto; text-align: center;width: 100%;">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="checkout__form__input">
							<input type="button" value="등록" style="width:100px; font-weight: 500; font-size: 16px;" onclick="javascript:writeProc(3);" />
					 		<input type="button" value="목록" style="width:100px; font-weight: 500; font-size: 16px;" onclick="javascript:goList(3);"/>
						</div>
					</div>
				</div>
			</article>
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