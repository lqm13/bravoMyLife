<!-- html 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/center/board/myPageNotice/writeForm.jsp" %>
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
	
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/front/center/board/list.web";
		frmMain.submit();
	}
	
	function writeProc(value, value2, value3) {
		var frmMain = document.getElementById("frmMain");
		document.getElementById("cd_bbs_type").value = value;
		
		if (document.getElementById("title").value == ""
				|| document.getElementById("cd_ctg").value == "0"
				|| tinymce.activeEditor.getContent() == "") {
			alert("필수 항목을 입력하세요!");
			return;
		}
		
		frmMain.cd_ctg_b.setAttribute("value", value2);
		frmMain.cd_ctg_m.setAttribute("value", value3);
		
		frmMain.action="/front/center/board/myPageNotice/writeProc.web";
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
<input type="hidden" id="cd_bbs_type"	name="cd_bbs_type"/>
<input type="hidden" id="cd_ctg_b"		name="cd_ctg_b"/>
<input type="hidden" id="cd_ctg_m"		name="cd_ctg_m"/>
<input type="hidden" id="type"			name="type" />
<input type="hidden" id="searchWord"	name="searchWord"/>
<input type="hidden" id="seq_sle"		name="seq_sle" value= "${boardDto.seq_sle}"/>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<!-- Header Section Begin -->
	<!-- 페이지의 상단에 보이는 로고 및 로그인 / 회원가입 코드 -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
		<%@ include file="/include/front/mygnb.jsp" %>
	<!-- Breadcrumb End -->
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
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="checkout__form__input">
					<c:if test="${boardDto.seq_sle > 0}">
						<p style="font-weight: bold; margin-top: 30px;margin-bottom: 5px; font-size: 16px;">상품이름 </p>
						<input type="text" id="sle_nm" name="sle_nm" value="${boardDtoNm.sle_nm}" style="width: 40%; padding: 10px; border: 1px solid #ccc; width:15%;border-radius: 5px; font-size: 14px;"/>
					</c:if>
					<c:if test="${boardDto.seq_sle > 0}">
					<div class="checkout__form__input">
						<p style="font-weight: bold; margin-bottom: 5px; font-size: 16px;">상품 대분류</p>
						<select id="cd_ctg_bs" style="margin-bottom:10px" disabled>
							<option value="0">대분류를 선택하세요</option>
							<option value="1"<c:if test="${boardDto.cd_ctg_b == '1'}"> selected</c:if>>기능별</option>
							<option value="2"<c:if test="${boardDto.cd_ctg_b == '2'}"> selected</c:if>>성분별</option>
							<option value="3"<c:if test="${boardDto.cd_ctg_b == '3'}"> selected</c:if>>대상별</option>
						</select>
					</div>
					</c:if>
					<c:if test="${boardDto.seq_sle > 0}">
						<div class="checkout__form__input">
						<p style="font-weight: bold; margin-bottom: 5px; font-size: 16px;">상품 중분류</p>
							<c:choose>
								<c:when test="${boardDto.cd_ctg_b == '1'}">
									<select id="cd_ctg_ms" disabled>
										<option value="1" <c:if test="${boardDto.cd_ctg_m == '1'}"> selected</c:if>>혈당/혈행/혈압</option>
										<option value="2" <c:if test="${boardDto.cd_ctg_m == '2'}"> selected</c:if>>항산화/면역력</option>
										<option value="3" <c:if test="${boardDto.cd_ctg_m == '3'}"> selected</c:if>>염증/항염</option>
										<option value="4" <c:if test="${boardDto.cd_ctg_m == '4'}"> selected</c:if>>관절/뼈/치아</option>
										<option value="5" <c:if test="${boardDto.cd_ctg_m == '5'}"> selected</c:if>>피로회복</option>
										<option value="6" <c:if test="${boardDto.cd_ctg_m == '6'}"> selected</c:if>>눈 건강</option>
										<option value="7" <c:if test="${boardDto.cd_ctg_m == '7'}"> selected</c:if>>장 건강</option>
										<option value="8" <c:if test="${boardDto.cd_ctg_m == '8'}"> selected</c:if>>두뇌/기억력</option>
										<option value="9" <c:if test="${boardDto.cd_ctg_m == '9'}"> selected</c:if>>위/간/갑상선</option>
									</select>
								</c:when>
								<c:when test="${boardDto.cd_ctg_b == '2'}">
									<select id="cd_ctg_ms" disabled>
										<option value="1" <c:if test="${boardDto.cd_ctg_m == '1'}"> selected</c:if>>폴리코사놀</option>
										<option value="2" <c:if test="${boardDto.cd_ctg_m == '2'}"> selected</c:if>>오메가-3</option>
										<option value="3" <c:if test="${boardDto.cd_ctg_m == '3'}"> selected</c:if>>비타민/미네랄</option>
										<option value="4" <c:if test="${boardDto.cd_ctg_m == '4'}"> selected</c:if>>유산균</option>
										<option value="5" <c:if test="${boardDto.cd_ctg_m == '5'}"> selected</c:if>>글루코사민/MSM</option>
										<option value="6" <c:if test="${boardDto.cd_ctg_m == '6'}"> selected</c:if>>루테인</option>
										<option value="7" <c:if test="${boardDto.cd_ctg_m == '7'}"> selected</c:if>>코큐텐</option>
										<option value="8" <c:if test="${boardDto.cd_ctg_m == '8'}"> selected</c:if>>아르기닌</option>
										<option value="9" <c:if test="${boardDto.cd_ctg_m == '9'}"> selected</c:if>>밀크씨슬</option>
									</select>
								</c:when>
								<c:when test="${boardDto.cd_ctg_b == '3'}">
									<select id="cd_ctg_ms" disabled>
										<option value="1" <c:if test="${boardDto.cd_ctg_m == '1'}"> selected</c:if>>남성</option>
										<option value="2" <c:if test="${boardDto.cd_ctg_m == '2'}"> selected</c:if>>여성</option>
									</select>
								</c:when>
								<c:when test="${boardDto.cd_ctg_b == ''}">
									<select id="cd_ctg_ms" disabled>
										<option value="0">먼저 대분류를 선택하세요</option>
									</select>
								</c:when>
							</c:choose>
						</div>
					</c:if>
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
					<p style="font-weight: bold; margin-bottom: 5px; font-size: 16px;">첨부 파일 <span></span></p>
					<input type="file" id="files[0]" name="files[0]" />
				</div>
				<br/>
				<br/>
				<div style="width: 900px; margin-left: auto; margin-right: auto; text-align: center;width: 100%;">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="checkout__form__input">
							<input type="button" value="등록" style="width:100px; font-weight: 500; font-size: 16px;" onclick="writeProc(3, '${boardDto.cd_ctg_b}', '${boardDto.cd_ctg_m}');" />
							<input type="button" value="목록" style="width:100px; font-weight: 500; font-size: 16px;" onclick="goList(3);"/>
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

	<!-- Footer Section Begin -->
	<%@ include file="/include/common/footer.jsp" %>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>
	<script>
	$(document).ready(function() {
		$('#cd_ctg_bs').change(function() {
			var selected = $(this).val();
			var select = $('#cd_ctg_ms');

			select.empty(); 

			switch (selected) {
				case '1':
					select.append('<option value="1">혈당/혈행/혈압</option>');
					select.append('<option value="2">항산화/면역력</option>');
					select.append('<option value="3">염증/항염</option>');
					select.append('<option value="4">관절/뼈/치아</option>');
					select.append('<option value="5">피로회복</option>');
					select.append('<option value="6">눈 건강</option>');
					select.append('<option value="7">장 건강</option>');
					select.append('<option value="8">두뇌/기억력</option>');
					select.append('<option value="9">위/간/갑상선</option>');
					break;
				case '2':
					select.append('<option value="1">폴리코사놀</option>');
					select.append('<option value="2">오메가-3</option>');
					select.append('<option value="3">비타민/미네랄</option>');
					select.append('<option value="4">유산균</option>');
					select.append('<option value="5">글루코사민/MSM</option>');
					select.append('<option value="6">루테인</option>');
					select.append('<option value="7">코큐텐</option>');
					select.append('<option value="8">아르기닌</option>');
					select.append('<option value="9">밀크씨슬</option>');
					break;
				case '3':
					select.append('<option value="1">남성</option>');
					select.append('<option value="2">여성</option>');
					break;
				default:
					select.append('<option value="0">먼저 대분류를 선택하세요</option>');
					break;
			}
		});
	});
</script>
</form>
</body>
</html>	