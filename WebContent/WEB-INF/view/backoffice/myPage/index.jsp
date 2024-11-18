<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/buy/list.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/backoffice.js"></script>
	<style>
	
	.content-header>h1 {
	font-size: 24px;
	text-align: center;
	padding-top: 50px;
	}
	</style>
	<script>
	
	function consolegoList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/console/center/board/list.web";
		frmMain.submit();
	}
	
	function goModifyForm() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/console/manager/modifyForm.web";
		frmMain.submit();
	}
	
	function goPasswdModifyForm() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/console/manager/passwd/modifyForm.web";
		frmMain.submit();
	}
	
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST" action="/console/myPage/index.web">
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" value="${paging.cd_bbs_type}" />

	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			<span style="font-size: 25px; font-weight: 700; color: #341d08;">${managerDto.mng_nm}</span>&nbsp;님 반갑습니다.</span>
		</h1>
	</section>

	<!-- Main content -->
	<section class="content" style="display: flex; justify-content: center; align-items: center;">
		
			<div class="col-md-6">
	
				<div class="box box-solid">
					<div class="box-header with-border">
						<h3 class="box-title">마이페이지 카테고리</h3>
		
					<div class="box-tools">
						<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
						</button>
					</div>
					</div>
					<div class="box-body no-padding">
						<ul class="nav nav-pills nav-stacked">
							<li class="active"><a href="javascript:goModifyForm()"><i class="fa fa-fw fa-user"></i> 개인정보 확인/수정</a>
							<li class="active"><a href="javascript:goPasswdModifyForm()"><i class="fa fa-fw fa-user"></i> 비밀번호 변경</a>
							</li>
						</ul>
					</div>
					<!-- /.box-body -->
					
				</div>
			</div>
	</section>
	<!-- /.content -->
</div>
<!-- /Maincontent -->

	<%@ include file="/include/backoffice/footer.jsp" %>

	<%@ include file="/include/backoffice/sideBar.jsp" %>

	<%@ include file="/include/backoffice/js.jsp" %>
</form>
</body>
</html>
