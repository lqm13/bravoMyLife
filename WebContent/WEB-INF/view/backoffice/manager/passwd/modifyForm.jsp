<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/product/modifyForm.jsp" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>	
	<script type="text/javascript" src="/js/backoffice.js"></script>
	<style>
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
	padding: 25px;
	line-height: 1.42857143;
	vertical-align: top;
	</style>
	<script>

function checkModify() {
		
	if (confirm("정보를 변경하시겠습니까?")) {
		
		var frmMain		= document.getElementById("frmMain");
	
		var passwd = $("#passwd").val();	// 현재 비밀번호
		
		var confirmPasswd	= $("#confirmPasswd").val();
		var confirmPasswd_	= $("#confirmPasswd_").val();
		
		// 현재 비밀번호가 비어 있는지 확인
		if (!passwd) {
			alert("현재 비밀번호를 입력해주세요!");
			return false;
		}
		
		// 신규 비밀번호가 비어 있는지 확인
		if (!confirmPasswd) {
			alert("신규 비밀번호를 입력해주세요!");
			return false;
		}
		
		// 비밀번호 확인이 비어 있는지 확인
		if (!confirmPasswd_) {
			alert("신규 비밀번호 확인을 입력해주세요!");
			return false;
		}
		
		// 신규 비밀번호와 비밀번호 확인이 일치하는지 확인
		if (confirmPasswd != confirmPasswd_) {
			alert("신규 비밀번호와 비밀번호 확인이 일치하지 않습니다!");
			return false;
		}
		
		// 비밀번호가 규칙에 맞는지 확인 (예: 최소 8자, 대문자 포함)
		if (confirmPasswd.length < 8) {
			alert("신규 비밀번호는 최소 8자 이상이어야 합니다!");
			return false;
		}
		
		if (confirmPasswd.length > 16) {
			alert("신규 비밀번호는 최대 16자 입니다!");
			return false;
		}
		
		
		// 폼을 제출
		
		frmMain.action = "/console/manager/passwd/modifyProc.web";
		frmMain.submit();
		}
}
	
function goMyPage() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/console/myPage/index.web";
	frmMain.submit();
}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST">




	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
<div class="content-wrapper">

	<section class="content-header" style="display: flex; align-items: center; margin-left: 485px;">
		<h1>
		MYPAGE
		</h1>
	</section>
	
	<section class="content" >
		<div class="row" style="display: flex; justify-content: center; align-items: center;">
			<div class="col-md-5" style="display: flex; justify-content: center; align-items: center; ">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">비밀번호 변경</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<div class="table-responsive mailbox-messages">
							<table class="table table-hover table-striped">
								<tbody>
								<tr>
									<th style="width: 300px; text-align: center;" >현재 비밀번호 *</th>
									<td>
										<input type="password" id="passwd" name="passwd"  />
									</td>
								</tr>
								<tr>
									<th style="width: 300px; text-align: center;" >신규 비밀번호 * &nbsp; (영문 대/소문자 구분, 숫자, 특수문자 포함 8~16자 필수 입력)</th>
									<td>
										<input type="password" id="confirmPasswd" name="confirmPasswd"  />
									</td>
								</tr>
								<tr>
									<th style="width: 300px; text-align: center;" >신규 비밀번호 확인 *</th>
									<td>
										<input type="password" id="confirmPasswd_" name="confirmPasswd_"  />
									</td>
								</tr>
								<tr>
									<th style="width: 150px;" ></th>
									<td>
										
									</td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<div class="btn-group" style="display: flex; justify-content: center; gap: 10px; position: relative; top: -20px;">
						<input type="button" value="수정" class="btn btn-primary" style="width: 150px" onclick="checkModify();" />
						<input type="button" value="뒤로가기" class="btn btn-primary" style="width: 150px" onclick="javascript:goMyPage()"/>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>	
<!-- /Maincontent -->

	<%@ include file="/include/backoffice/footer.jsp" %>

	<%@ include file="/include/backoffice/sideBar.jsp" %>

	<%@ include file="/include/backoffice/js.jsp" %>
</form>
</body>
</html>
