<!-- html 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/center/board/faq/list.jsp" %>
<!-- 이 부분은 필요에 따라 추가하는 것이 맞으므로 개별 판단에 따라 추가하거나 삭제해도 되고 사용하지 않더라도 그대로 넣어둬도 무방하다고 판단 -->
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<style>
		
		@media (min-width: 1200px) {
			.header__menu::after {width:100%;}
		}
		@media (min-width: 992px) {
			.container, .container-lg, .container-md, .container-sm {max-width:100px;}
		}
			
		.gnb li {
		display: inline; /* 수평 배치 */
		margin-right: 15px; /* 메뉴 간격 */
		}
		
		p {
		margin-top: 5px;
		line-height: 1.6; /* 줄 간격 */
		margin: 5px 0; /* 위아래 여백 */
		}
		
		button.accordion {
		background-color: #f3ebe1; /* 기본 버튼 배경색 */
		color: #000; /* 검정 글자 */
		cursor: pointer;
		padding: 10px;
		width: 100%;
		border: none;
		text-align: left;
		outline: none;
		font-size: 16px;
		transition: background-color 0.3s;
		border-radius: 5px; /* 버튼 모서리 둥글게 */
		margin: 5px 0; /* 버튼 간격 */
		}
		
		button.accordion:hover {
		background-color: #c7b199; /* 마우스 호버 시 색상 */
		}
		
		button.accordion.active {
		background-color: #e7d5bf; /* 클릭 시 연한 베이지색 */
		}
		
		.accordion2 {
		background-color: #FFF; /* 텍스트 박스 배경색 */
		color: #000; /* 검정 글자 */
		cursor: text;
		padding: 10px;
		width: 100%px;
		border: 1px solid #ddd; /* 테두리 */
		border-radius: 5px; /* 둥근 모서리 */
		margin: 5px 0; /* 여백 */
		resize: none; /* 크기 조절 비활성화 */
		overflow: auto; /* 스크롤바 활성화 */
		height: auto; /* 자동 높이 */
		}
		
		.panel {
		padding: 1px 1px;
		background-color: white;
		overflow: hidden;
		display: none; /* 기본적으로 숨김 */
		height: auto;
		}
		
		.contact-info {
		margin-top: 20px; /* 상단 여백 */
		padding: 10px;
		background-color: #F9F3EC; /* 부드러운 배경색 */
		border-radius: 8px; /* 모서리 둥글게 */
		}
		
		.contact-info h3 {
		margin-bottom: 10px; /* 하단 여백 */
		}
	</style>
	<script>
		window.onload=function() { 
			var acc=document.getElementsByClassName("accordion"); for (var i=0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() { this.classList.toggle("active"); var
			panel=this.nextElementSibling; if (panel.style.display==="block" ) { panel.style.display="none"
			; } else { panel.style.display="block" ; } }); }}
		
		<!-- 각 페이지의 기능에 따라 스크립트 추가 -->
		function goView(value) {
	
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("seq_bbs").value = value;
			
			frmMain.action="/front/center/board/view.web";
			frmMain.submit();
		}
		
		function goPage(value) {
			
			var frmMain = document.getElementById("boardFrmMain");
			
			document.getElementById("currentPage").value = value;
			
			frmMain.action="/front/center/board/list.web";
			frmMain.submit();
		}
		
		function goList(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("searchWord").value = "";
			document.getElementById("sSearchWord").value = "";
			document.getElementById("sSearchKey").value = "";
			document.getElementById("currentPage").value = "1";
			
			frmMain.cd_bbs_type.setAttribute("value", value);
			frmMain.action="/front/center/board/list.web";
			frmMain.submit();
		}
		
		function download(type, sequence) {
			
			
			var frmMain = document.getElementById("boardFrmMain");
			
			frmMain.type.setAttribute("value", type);
			frmMain.sequence.setAttribute("value", sequence);
			frmMain.action = "/console/center/board/download.web";
			frmMain.target = "frmBlank";
			frmMain.submit();
			
			frmMain.target = "_self";
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
		
		function boardSearch() {
			
			var boardFrmMain = document.getElementById("boardFrmMain");
			
			var sSearchWord = document.getElementById("sSearchWord").value;
			var sSearchKey = document.getElementById("sSearchKey").value;
			
			boardFrmMain.cd_bbs_type.setAttribute("value", '2');
			boardFrmMain.ssSearchWord.setAttribute("value", sSearchWord);
			boardFrmMain.ssSearchKey.setAttribute("value", sSearchKey);
			
			boardFrmMain.action="/front/center/board/list.web";
			boardFrmMain.submit();
		}
	</script>

	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>

<body>
<form id="boardFrmMain" method="POST">
<input type="hidden" name="cd_bbs_type" 	id="cd_bbs_type" value="${paging.cd_bbs_type}" />
<input type="hidden" name="currentPage" 	id="currentPage" value="${paging.currentPage}" />
<input type="hidden" name="sSearchKey"		id="ssSearchKey" />
<input type="hidden" name="sSearchWord"		id="ssSearchWord" />
</form>
<form id="frmMain" method="POST">
<input type="hidden" name="type"			id="type"/>
<input type="hidden" name="cd_ctg_m"		id="cd_ctg_m" />
<input type="hidden" name="cd_ctg_b"		id="cd_ctg_b" />
<input type="hidden" name="searchWord"		id="searchWord" />
<input type="hidden" name="_searchWord"		id="_searchWord" />
<input type="hidden" name="cd_bbs_type" 	id="cd_bbs_type" value="${paging.cd_bbs_type}" />
<input type="hidden" name="currentPage" 	id="currentPage" value="${paging.currentPage}" />
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

	<section class="shop spad" style="min-height: calc(100vh - 1px);">
		<div class="container">
			<article class="txtCenter">
				<div class="col-lg-12" style="padding: 0 !important;">
				<div class="checkout__form__input">
					<div>
						<h6 style="text-align: center; letter-spacing: 1.5px; border: none; padding-bottom: 60px; font-size: 30px; font-weight: bold;">자주 찾는 질문(FAQ)</h6>
						<h6 class="coupon__link" style="text-align: center;; border: none">
							<c:if test="${paging.cd_bbs_type == 1}">
								<a href="javascript:goList(1);" style="font-size: 15px !important; font-weight: bold; display: inline-block; padding: 10px 15px; color: white; background-color: #735048; border: 1px solid #cccccc; border-radius: 10px;">공지사항</a>
								<a href="javascript:goList(2);" style="font-size: 15px !important; font-weight: bold; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">자주 찾는 질문(FAQ)</a>
								<a href="javascript:goList(3);" style="font-size: 15px !important; font-weight: bold; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">1:1 문의</a>
							</c:if>
		
							<c:if test="${paging.cd_bbs_type == 2}">
								<a href="javascript:goList(1);" style="font-size: 15px !important; font-weight: bold; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">공지사항</a>
								<a href="javascript:goList(2);" style="font-size: 15px !important; font-weight: bold; display: inline-block; padding: 10px 15px; color: white; background-color: #735048; border: 1px solid #cccccc; border-radius: 10px;">자주 찾는 질문(FAQ)</a>
								<a href="javascript:goList(3);" style="font-size: 15px !important; font-weight: bold; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">1:1 문의</a>
							</c:if>
							<c:if test="${paging.cd_bbs_type == 3}">
								<a href="javascript:goList(1);" style="font-size: 15px !important; font-weight: bold; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">공지사항</a>
								<a href="javascript:goList(2);" style="font-size: 15px !important; font-weight: bold; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">자주 찾는 질문(FAQ)</a>
								<a href="javascript:goList(3);" style="font-size: 15px !important; font-weight: bold; display: inline-block; padding: 10px 15px; color: white; background-color: #735048; border: 1px solid #cccccc; border-radius: 10px;">1:1 문의</a>
							</c:if>
						</h6>
					</div>
				</div>
				</div>
				<br/>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="checkout__form__input">
						<div style="display: flex; justify-content: flex-end;margin-bottom: 10px;">
							<select name="sSearchKey" id="sSearchKey" style="width: 30%;max-width: 130px;">
								<option value="title"<c:if test="${paging.sSearchKey == 'title'}"> selected</c:if>>제목</option>
								<option value="contents"<c:if test="${paging.sSearchKey == 'contents'}"> selected</c:if>>내용</option>
								<option value="title+contents"<c:if test="${paging.sSearchKey == 'title+contents'}"> selected</c:if>>제목 또는 내용</option>
							</select>
							<input type="text" name="sSearchWord" id="sSearchWord" value="${paging.sSearchWord}" /> 
							<input type="button" onclick="javascript:boardSearch();" value="검색"/>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="checkout__form__input">
								<div class="brdInfo">전체 ${paging.totalLine}개 [${paging.currentPage}/${paging.totalPage} 페이지]</div>
							<br/>
									<!-- faq 리스트를 반복문으로 출력 -->
								<c:forEach items="${list}" var="list">
									<c:choose>
										<c:when test="${list.flg_top == 'Y'}">
										<button class="accordion" type="button" style="font-weight: bold;">${list.title}</button>
											<div class="panel">
												<select class="form-control" id="cd_ctg" name="cd_ctg" style="margin-bottom: 6px;"disabled>
													<option value="0"<c:if test="${list.cd_ctg == '0'}"> selected</c:if>>선택</option>
													<option value="1"<c:if test="${list.cd_ctg == '1'}"> selected</c:if>>가입 및 탈퇴</option>
													<option value="2"<c:if test="${list.cd_ctg == '2'}"> selected</c:if>>상품</option>
													<option value="3"<c:if test="${list.cd_ctg == '3'}"> selected</c:if>>구매</option>
													<option value="4"<c:if test="${list.cd_ctg == '4'}"> selected</c:if>>결제</option>
													<option value="5"<c:if test="${list.cd_ctg == '5'}"> selected</c:if>>배송</option>
													<option value="6"<c:if test="${list.cd_ctg == '6'}"> selected</c:if>>환불</option>
													<option value="9"<c:if test="${list.cd_ctg == '9'}"> selected</c:if>>기타</option>
												</select>
												<div class="accordion2" >
													<c:if test="${list.file_orig != ''}">
														<a style="color:blue" href="javascript:download('BbsFaq', ${list.seq_bbs});">[첨부파일 다운로드]</a>
													</c:if>
														${list.content}
												</div>
											</div>
										</c:when>
										<c:otherwise>
										<button class="accordion" type="button">${list.title}</button>
											<div class="panel">
												<select class="form-control" id="cd_ctg" name="cd_ctg" style="margin-bottom: 6px;"disabled>
													<option value="0"<c:if test="${list.cd_ctg == '0'}"> selected</c:if>>선택</option>
													<option value="1"<c:if test="${list.cd_ctg == '1'}"> selected</c:if>>가입 및 탈퇴</option>
													<option value="2"<c:if test="${list.cd_ctg == '2'}"> selected</c:if>>상품</option>
													<option value="3"<c:if test="${list.cd_ctg == '3'}"> selected</c:if>>구매</option>
													<option value="4"<c:if test="${list.cd_ctg == '4'}"> selected</c:if>>결제</option>
													<option value="5"<c:if test="${list.cd_ctg == '5'}"> selected</c:if>>배송</option>
													<option value="6"<c:if test="${list.cd_ctg == '6'}"> selected</c:if>>환불</option>
													<option value="9"<c:if test="${list.cd_ctg == '9'}"> selected</c:if>>기타</option>
												</select>
												<div class="accordion2" >
													<c:if test="${list.file_orig != ''}">
														<a style="color:blue" href="javascript:download('BbsFaq', ${list.seq_bbs});">[첨부파일 다운로드]</a>
													</c:if>
														${list.content}
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
									<br/>
									<br/>
								<div class="row">
									<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;" >
										<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPage" />
									</div>
								</div>
							</div>
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