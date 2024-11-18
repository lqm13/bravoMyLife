<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/sale/searchForm.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
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
	
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("searchWord").value = "";
		document.getElementById("currentPage").value = "1";
		document.getElementById("cd_bbs_type").value = value;
		
		
		frmMain.action="/front/center/board/list.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function searchView(value) {
		
		console.log("받아온 값 log 확인" + value);
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.prdlst_report_no.setAttribute("value", value);
		
		frmMain.action = "/front/center/board/personalHealth/searchView.web";
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
<input type="hidden" name="prdlst_report_no"	id="prdlst_report_no"/>
<input type="hidden" name="cd_bbs_type"			id="cd_bbs_type" value="0"/>
<input type="hidden" name="searchWord"			id="searchWord" value="${paging.searchWord}" />
<input type="hidden" name="currentPage"			id="currentPage" value="${paging.currentPage}" />
<input type="hidden" name="type"				id="type"/>
<input type="hidden" name="cd_ctg_m"			id="cd_ctg_m" />
<input type="hidden" name="cd_ctg_b"			id="cd_ctg_b" />
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
				<br>
					<h6 class="lowgnb-title" style="text-align: center; font-weight: bold; font-size: 36px;">안심 조회 서비스</h6>
					<br>
					<br>
					<h6 class="coupon__link" style="text-align: center; letter-spacing: 1.5px; border: none">
						<a href="javascript:goSurvey();" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">맞춤 건강 추천</a>
						<a href="javascript:goSearch()" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #c7b199; border: 1px solid #cccccc; border-radius: 10px;">안심 조회 서비스</a>
						<a href="javascript:goHealthInfo()" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">건강정보</a>
						<a href="javascript:goList(4);" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">새소식</a>
						<a href="javascript:goIngredInfo();" style="font-size: 15px !important; display: inline-block; padding: 10px 15px; color: black; background-color: #ffffff; border: 1px solid #cccccc; border-radius: 10px;">성분사전</a>
					</h6>
					<div style="text-align: center; margin-bottom: 30px !important;">
						<img src="/img/personalhealth/healthSearch.png">
					</div>
						<div style="margin-bottom: 20px !important">
							<div style="display: flex; justify-content: flex-end; align-items: center; margin-bottom: 20px !important;">
								<input class="search-container" type="text" id="prdlst_nm" name="prdlst_nm" onkeydown="checkEnter(event)" />
								<a class="health-btn" href="javascript:item_search();" style="margin-left: 10px;">
									검색
								</a>
							</div>
						</div>
						<h6 class="cart-title" style="margin-bottom: 10px !important; font-size: 14px !important;">* 안심 조회 서비스에서는 모든 건강기능식품 정보(수출용 포함)를 제공합니다</h6>
						<div class="shop__cart__table" style="border-radius: 6px !important; border: 1px solid #e0e0e0 !important;">
							<table class="cart-table">
								<thead>
									<tr>
										<th class="health-head" style="background: #F6F6F6 !important; border-bottom: 1px solid #e0e0e0 !important;">제품명</th>
										<th class="health-head" style="width: 20% !important; background: #F6F6F6 !important; border-bottom: 1px solid #e0e0e0 !important;">제조사명</th>
										<th class="health-head" style="width: 15% !important; background: #F6F6F6 !important; border-bottom: 1px solid #e0e0e0 !important;">신고번호</th>
										<th class="health-head" style="width: 10% !important; background: #F6F6F6 !important; border-bottom: 1px solid #e0e0e0 !important;">등록일</th>
									</tr>
								</thead>
								<tbody id="dataBody">
									<tr>
										<td colspan="4" class="health-body" style="text-align: center !important; line-height: 100px !important; border-bottom: 0px !important;">
											조회를 대기중입니다.
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
	function item_search() {
		
		var myData = {prdlst_nm: $("#prdlst_nm").val()};
		
		$.ajax({
			type: "POST",
			url: "/front/board/searchItem.json",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(myData),
			success: function (res) {
				
				var responseDto = res.responseDto;
				var tableBody = $('#dataBody');
				
				tableBody.empty();
				
				if (responseDto && responseDto.C003 && Array.isArray(responseDto.C003.row) && responseDto.C003.row.length > 0) {
					
					var rows = responseDto.C003.row;
					
					rows.forEach(function(item) {
						
						var tr = $('<tr></tr>');
						
						tr.on('click', function() {
							
							searchView("'" + item.PRDLST_REPORT_NO + "'");
						});
						tr.css('cursor', 'pointer');
						
						var date = item.PRMS_DT;
						var formattedDate = date.substring(0, 4) + '-' + date.substring(4, 6) + '-' + date.substring(6);
						
						tr.append('<td class="health-body">' + item.PRDLST_NM + '</td>');
						tr.append('<td class="health-body" style="text-align: center !important;">' + item.BSSH_NM + '</td>');
						tr.append('<td class="health-body" style="text-align: center !important;">' + item.PRDLST_REPORT_NO + '</td>');
						tr.append('<td class="health-body" style="text-align: center !important;">' + formattedDate + '</td>');
						
						tableBody.append(tr);
					});
				} else {
					
					var noDataTr = $('<tr></tr>');
					noDataTr.append('<td colspan="4" class="health-body" style="text-align: center !important; line-height: 100px !important;">검색 결과가 없습니다.</td>');
					
					tableBody.append(noDataTr);
				}
			},
		});
	}
	
	function checkEnter(event) {
	
		if (event.keyCode === 13) {
			
			event.preventDefault();
			item_search();
		}
	}
</script>
</form>
</body>
</html>