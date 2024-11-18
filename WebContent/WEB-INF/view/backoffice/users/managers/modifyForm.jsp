<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/users/managers/modifyForm.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/backoffice.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script>
	
	function modifyProc(value) {
		
		var frmMain = document.getElementById("frmMain");

		frmMain.action = "/console/users/managers/modifyProc.web";
		frmMain.submit();
	}
	
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST" >
<input type="hidden" name="seq_mng" value="${managersDto.seq_mng}"/>	
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" value="${paging.cd_bbs_type}" />
	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->

<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header" style="display: flex; align-items: center; margin-left: 425px;">

	<h1>
		관리자 관리
		<small></small>
	</h1>
	</section>

		<!-- Main content -->
	<section class="content" style="display: flex; justify-content: center; align-items: center;">
	
		<div class="col-md-6">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">관리자 정보 수정</h3>
				</div>
			<!-- /.box-header -->
			<div class="box-body">
				<table class="table table-bordered">
					<tr>
						<th>성명</th>
						<td>${managersDto.mng_nm}</td>
					</tr>
					<tr>
						<th>이메일(아이디)</th>
						<td colspan="3">
							${managersDto.email} / 
							<select name="cd_state" style="background:#F0F0F0">
								<option value="0"<c:if test="${managersDto.cd_state == 0}"> selected</c:if>>대기</option>
								<option value="1"<c:if test="${managersDto.cd_state == 1}"> selected</c:if>>사용중</option>
								<option value="8"<c:if test="${managersDto.cd_state == 8}"> selected</c:if>>사퇴</option>
								<option value="9"<c:if test="${managersDto.cd_state == 9}"> selected</c:if>>해고</option>
							</select>
						</td>
					</tr>
				<tr>
					<th>연락처</th>
					<td colspan="3">
						${fn:split(managersDto.phone, '-')[0]} - ${fn:split(managersDto.phone, '-')[1]} - ${fn:split(managersDto.phone, '-')[2]}
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3">
						${managersDto.post} ${managersDto.addr1} ${managersDto.addr2}
					</td>
				</tr>
				</table>
				<div class="modal-footer" style="text-align: center; padding-top: 10px; padding-bottom: 10px;">
					<input type="button" value="수정 하기" class="btn btn-default" data-dismiss="modal" onclick="javascript:modifyProc()"/>
					<input type="button" value="목록" class="btn btn-primary" onclick="javascript:goManagersList()" />
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