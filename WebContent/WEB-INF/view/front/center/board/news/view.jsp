<!-- html 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/center/board/news/view.jsp" %>
<!-- 이 부분은 필요에 따라 추가하는 것이 맞으므로 개별 판단에 따라 추가하거나 삭제해도 되고 사용하지 않더라도 그대로 넣어둬도 무방하다고 판단 -->
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>


<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<style>
	
	</style>
	<script>
	
	<!-- 각 페이지의 기능에 따라 스크립트 추가 -->
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
			
			var frmMain = document.getElementById("frmMain");
			
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
	
	
	function download(type, sequence) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", type);
		frmMain.sequence.setAttribute("value", sequence);
		frmMain.action = "/front/center/board/download.web";
		frmMain.target = "frmBlank";
		frmMain.submit();
		
		frmMain.target = "_self";
	}
	
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("searchWord").value = "";
		document.getElementById("currentPage").value = "1";
		document.getElementById("cd_bbs_type").value = value;
		
		//frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/front/center/board/list.web";
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
<input type="hidden" id="type"			name="type" />
<input type="hidden" id="sequence"		name="sequence" />
<input type="hidden" id="cd_bbs_type"	name="cd_bbs_type"/>
<input type="hidden" id="seq_bbs"		name="seq_bbs"		value="${boardDto.seq_bbs}" />
<input type="hidden" id="searchWord" name="searchWord" />
<input type="hidden" id="currentPage" name="currentPage" value="1" />
<input type="hidden" name="cd_ctg_m"		id="cd_ctg_m" />
<input type="hidden" name="cd_ctg_b"		id="cd_ctg_b" />


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
<section class="shop spad">
	<div class="container">
		<article class="txtCenter">
			<div class="col-lg-8 col-md-8 col-sm-8">
				<div class="blog__details__content">
					<div class="blog__details__item">
						<br />
						<br />
						<br />

							
						<div class="blog__details__item__title">
							<span class="tip">게시글 제목</span>
							<h4>${boardDto.title}</h4>
							<ul>
								<li><span style="font-size: 16px;">[등록 일자]</span></li>
								<li style="font-size: 16px;">${boardDto.dt_reg}</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="blog__details__quote">
			<div class="icon"><i class="fa fa-quote-left"></i></div>
				<img src="/img/news/${boardDto.file_save}" alt="" style="margin-top: 100px;" /><br/><br/><br/><br/>
				<p>${boardDto.content}</p>
			</div>
			<br />
			<br />
			<br />
			<br />
			
			<div style=" margin-left: auto; margin-right: auto; text-align: center;">
				
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="checkout__form__input">
					<c:if test="${boardDto.seq_reply == 0}">
					</c:if>
					<input type="button" value="목록" style="width:130px; font-size: 17px;" onclick="javascript:goList(4);" />
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
<iframe name="frmBlank" id="frmBlank" width="0" height="0"></iframe>
</form>
</body>
</html>