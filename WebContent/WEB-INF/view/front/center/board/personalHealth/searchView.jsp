<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/sale/searchView.jsp" %>
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
<form id="frmMain">
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
	<section class="shop-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h6 class="lowgnb-title" style="padding-bottom: 40px; text-align: left; font-weight: bold; font-size: 36px;">${rowDataDto.prdlst_nm}</h6>
						<h6 class="cart-title" style="padding-left:4px !important; margin-bottom: 10px !important; font-size: 18px !important; color: rgb(7, 42, 131) !important; font-weight: bold !important;"><span></span>상세정보</h6>
						<div class="shop__cart__table" style="border-radius: 6px !important; border: 1px solid #e0e0e0 !important;">
							<table class="cart-table">
								<tbody>
									<tr>
										<th class="health-head">
										제조사명
										</th>
										<td class="health-body">
										${rowDataDto.bssh_nm}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										제품명
										</th>
										<td class="health-body">
										${rowDataDto.prdlst_nm}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										신고번호
										</th>
										<td class="health-body">
										${rowDataDto.prdlst_report_no}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										등록일자
										</th>
										<td class="health-body">
										${rowDataDto.prms_dt}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										소비기한
										</th>
										<td class="health-body">
										${rowDataDto.pog_daycnt}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										성상
										</th>
										<td class="health-body">
										${rowDataDto.dispos}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										섭취량/섭취 방법
										</th>
										<td class="health-body">
										${rowDataDto.ntk_mthd}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										포장재질(방법)
										</th>
										<td class="health-body">
										${rowDataDto.prdt_shap_cd_nm}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										보존 및 유통기준
										</th>
										<td class="health-body">
										${rowDataDto.cstdy_mthd}
										</td>
									</tr>
									<tr>
										<th class="health-head">
										섭취 시 주의사항
										</th>
										<td class="health-body">
											<div id="iftknAtntMatrCnContent">${rowDataDto.iftkn_atnt_matr_cn}</div>
										</td>
									</tr>
									<tr>
										<th class="health-head">
										기능성 내용
										</th>
										<td class="health-body">
											<div id="primaryFncltyContent">${rowDataDto.primary_fnclty}</div>
										</td>
									</tr>
									<tr>
										<th class="health-head">
										기준 및 규격
										</th>
										<td class="health-body">
											<div id="stdrStndContent">${rowDataDto.stdr_stnd}</div>
										</td>
									</tr>
									<tr>
										<th class="health-head">
										기능성 원료
										</th>
										<td class="health-body">
										${rowDataDto.rawmtrl_nm}
										</td>
									</tr>
								</tbody>
							</table>
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
<script>
document.addEventListener('DOMContentLoaded', function() {
	
	var contentDiv = document.getElementById('iftknAtntMatrCnContent');
	var contentText = contentDiv.innerHTML;
	
	var items = [];
	var isFirst = true;
	
	var formattedContent = contentText.replace(/(\d+\.\s(?!\())|\d+\)\s?|[\(\)]?[가-힣]\)\s?|[①②③④⑤⑥⑦⑧⑨⑩]\s?/g, function(match) {
		
		if (isFirst) {
			
			isFirst = false;
			return match;
		}
		return '<br>' + match;
	});
	contentDiv.innerHTML = formattedContent;
});

document.addEventListener('DOMContentLoaded', function() {
	
	var contentDiv = document.getElementById('primaryFncltyContent');
	var contentText = contentDiv.innerHTML;
	
	var items = [];
	var isFirst = true;
	
	var formattedContent = contentText.replace(/(\d+\.\s(?!\())|\d+\)\s?|[\(\)]?[가-힣]\)\s?|[①②③④⑤⑥⑦⑧⑨⑩]\s?/g, function(match) {
		
		if (isFirst) {
			
			isFirst = false;
			return match;
		}
		return '<br>' + match;
	});
	contentDiv.innerHTML = formattedContent;
});

document.addEventListener('DOMContentLoaded', function() {
	
	var contentDiv = document.getElementById('stdrStndContent');
	var contentText = contentDiv.innerHTML;
	
	var items = [];
	var isFirst = true;
	
	var formattedContent = contentText.replace(/(\d+\.\s(?!\())|\d+\)\s?|[\(\)]?[가-힣]\)\s?|[①②③④⑤⑥⑦⑧⑨⑩]\s?/g, function(match) {
		
		if (isFirst) {
			
			isFirst = false;
			return match;
		}
		return '<br>' + match;
	});
	contentDiv.innerHTML = formattedContent;
});
</script>
</form>
</body>
</html>