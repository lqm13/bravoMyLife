<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="my-custom-ul" >
	<li><a style="font-size :25px" href="/front/myPage/" class="menuLnb">마이 페이지</a></li>
	<li>-<a style="font-size :19px"href="javascript:myModifyForm();" class="menuLnb">개인정보 확인/수정</a></li>
	<li>-<a style="font-size :19px"href="javascript:goPasswd();" class="menuLnb">비밀번호 수정</a></li>
	<li>-<a style="font-size :19px"href="javascript:goMyList(3);" class="menuLnb">문의 내역</a></li>
	<li>-<a style="font-size :19px"href="javascript:goPointHistory();" class="menuLnb">포인트 적립조회</a></li>
	<li>-<a style="font-size :19px"href="javascript:goPointUseHistory();" class="menuLnb">포인트 사용내역</a></li>
	<li>-<a style="font-size :19px"href="javascript:goSurveyModifyForm();" class="menuLnb">맞춤 건강 결과 조회</a></li>
	<li>-<a style="font-size :19px"href="javascript:goMyLike();" class="menuLnb">찜한 상품</a></li>
	<li>-<a style="font-size :19px"href="javascript:goReviewListPage();" class="menuLnb">상품후기 관리</a></li>
	<li>-<a style="font-size :19px"href="javascript:goHistory();" class="menuLnb">주문목록/배송조회</a></li>
	<li>-<a style="font-size :19px"href="javascript:goCancelhistory();" class="menuLnb">취소/교환/환불내역</a></li>
	<li>-<a style="font-size :19px"href="javascript:goWithdraw();" class="menuLnb">회원 탈퇴</a></li>
	<li>-<a style="font-size :19px"href="javascript:goModifyDelivery();" class="menuLnb">배송지 관리</a></li>
</ul>
<style>
.my-custom-ul li a {
	text-decoration: none;
	color: black; /* 기본 텍스트 색상 */
	
}

.my-custom-ul li a:hover,
.my-custom-ul li a:focus {

	color: #f77202; /* 선택 시 텍스트 색상 */
}
</style>
<script>
	function myModifyForm() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/member/modifyForm.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goPasswd() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/member/passwd/modifyForm.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goPointHistory() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/buy/pointHistory.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goPointUseHistory() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/buy/pointUseHistory.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goSurveyModifyForm() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/member/surveyModifyForm.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goMyLike() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/member/myLike.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goReviewListPage() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/buy/reviewListPage.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goHistory() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/buy/history.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goCancelhistory() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/buy/cancelhistory.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goWithdraw() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/member/withdraw.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goModifyDelivery() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/member/modifyDelivery.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goTypeT(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", value);
		frmMain.action = "/front/sale/total_list.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goMyList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("cd_bbs_type").value = value;
		
		frmMain.action = "/front/center/board/myPageNotice/list.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goTypeF(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", value);
		frmMain.action = "/front/sale/function_list.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goTypeI(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", value);
		frmMain.action = "/front/sale/ingredient_list.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goTypeG(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", value);
		frmMain.action = "/front/sale/gender_list.web";
		frmMain.target = "";
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
		frmMain.target = "";
		frmMain.submit();
	}
</script>