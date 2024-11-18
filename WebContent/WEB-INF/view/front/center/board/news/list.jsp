<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/center/board/news/list.jsp" %>
<!-- 이 부분은 필요에 따라 추가하는 것이 맞으므로 개별 판단에 따라 추가하거나 삭제해도 되고 사용하지 않더라도 그대로 넣어둬도 무방하다고 판단 -->
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<style></style>
</head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
	
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
	
	
	window.onload = function() {

		
		var boardFrmMain = document.getElementById("boardFrmMain");
		if (boardFrmMain) {
			boardFrmMain.ssSearchKey.value = '';
			boardFrmMain.ssSearchWord.value = '';
		}
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
	
	
	function goView(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_bbs.setAttribute("value", value);
		
		frmMain.action = "/front/center/board/view.web";
		frmMain.submit();
	}
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("searchWord").value = "";
		document.getElementById("currentPage").value = "1";
		document.getElementById("cd_bbs_type").value = value;
		
		frmMain.action = "/front/center/board/list.web";
		frmMain.submit();
	}
	function goPage(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = value;
		
		frmMain.action="/front/center/board/list.web";
		frmMain.submit();
	}
	
	function boardSearch() {
		
		var boardFrmMain = document.getElementById("boardFrmMain");
		
		var sSearchWord = document.getElementById("sSearchWord").value;
		var sSearchKey = document.getElementById("sSearchKey").value;
		
		boardFrmMain.cd_bbs_type.setAttribute("value", '4');
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
<input type="hidden" name="a"				id="a" value ="${paging.register}"/>
<input type="hidden" name="seq_bbs"			id="seq_bbs" value="0"/>
<input type="hidden" name="cd_bbs_type"		id="cd_bbs_type" value ="${paging.cd_bbs_type}" />
<input type="hidden" name="sSearchKey"		id="ssSearchKey" />
<input type="hidden" name="sSearchWord"		id="ssSearchWord" />
</form>
<form id="frmMain" method="POST">
<input type="hidden" name="cd_bbs_type"		id="cd_bbs_type" value ="${paging.cd_bbs_type}" />
<input type="hidden" name="seq_bbs"			id="seq_bbs" value="0"/>
<input type="hidden" name="type"			id="type"/>
<input type="hidden" name="cd_ctg_m"		id="cd_ctg_m" />
<input type="hidden" name="cd_ctg_b"		id="cd_ctg_b" value="0"/>
<input type="hidden" name="searchWord"		id="searchWord" />
<input type="hidden" name="_searchWord"		id="_searchWord" />
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
			<div class="col-lg-12" style="padding: 0 !important;">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="checkout__form__input">
						<h6 style="text-align: center; letter-spacing: 1.5px; border: none; padding-bottom: 60px; font-size: 30px; font-weight: bold;">새소식</h6>
							<h6 class="coupon__link" style="text-align: center; letter-spacing: 1.5px; border: none">
								<a href="javascript:goSurvey();" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">맞춤 건강 추천</a>
								<a href="javascript:goSearch()" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">안심 조회 서비스</a>
								<a href="javascript:goHealthInfo()" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">건강정보</a>
								<a href="javascript:goList(4);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px;">새소식</a>
								<a href="javascript:goIngredInfo();" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">성분사전</a>
							</h6>
							<br>
							<div class="brdSearchArea">
							<div style="display: flex; justify-content: flex-end;margin-bottom: 10px;">
								<select name="sSearchKey" id="sSearchKey">
									<option value="title"<c:if test="${paging.sSearchKey == 'title'}"> selected</c:if>>제목</option>
									<option value="contents"<c:if test="${paging.sSearchKey == 'contents'}"> selected</c:if>>내용</option>
									<option value="title+contents"<c:if test="${paging.sSearchKey == 'title+contents'}"> selected</c:if>>제목 또는 내용</option>
								</select>
								<input type="text" name="sSearchWord" id="sSearchWord" value="${paging.sSearchWord}" /> 
								<input type="button" onclick="javascript:boardSearch();" value="검색"/>
							</div>
							
							<div class="row">
								<div class="col-lg-12 col-md-12">
									<div class="brdInfo">전체 ${paging.totalLine}개 [${paging.currentPage}/${paging.totalPage} 페이지]</div>
										<table class="headTop_01" style=" margin-left: auto; margin-right: auto; width: 100%">
											<tr>
												<th style="width: 5%">NO</th>
												<th style="text-align: left; padding-left: 100px;">제목</th>
												<th style="width: 15%">등록일</th>
											</tr>
											<c:choose>
												<c:when test="${empty list}">
													<tr>
														<td colspan="6">등록된 글이 없습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${list}" var="list">
														<tr>
															<td>
																${list.rnum}
															</td>
															<td style="text-align: left; padding-left: 100px;">
																<a href="javascript:goView(${list.seq_bbs});">
																	${list.title}
																</a>
															</td>
															<td>
																${list.dt_reg}
															</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</table>
										<div class="row">
											<br/>
											<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;" >
												<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPage" />
											</div>
											<br/>
											<br/>
											<br/>
										</div>
									</div>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
		
	</section>
	<!-- Shop Cart Section End -->

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