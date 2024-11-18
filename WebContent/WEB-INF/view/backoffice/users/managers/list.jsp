<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/users/managers/list.jsp" %>
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
	
	</style>
	<script>
	
	function consolegoList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/console/center/board/list.web";
		frmMain.submit();
	}
	
	function goModifyForm(value) {
		
		var frmMain = document.getElementById("frmMain");

		document.getElementById("seq_mng").value = value;
		frmMain.action="/console/users/managers/modifyForm.web";
		frmMain.submit();
	}
	
	function goPage(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = value;
		frmMain.action="/console/users/managers/list.web";
		frmMain.submit();
	}
	
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST">
<input type="hidden" name="seq_mng"		id="seq_mng" />
<input type="hidden" name="cd_state"	id="cd_state" value="0"/>
<input type="hidden" name="currentPage"	id="currentPage" value="${paging.currentPage}" />	
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" value="${paging.cd_bbs_type}" />
	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header" style="display: flex; align-items: center; margin-left: 215px;">
		 <h1>
        관리자 관리
      </h1>
	</section>

	<!-- Main content -->
	<section class="content" style="display: flex; justify-content: center; align-items: center;">
	
		
		<!-- /.col -->
		<div class="col-md-9">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">관리자 목록</h3>&nbsp;&nbsp;&nbsp;
					<div class="box-tools pull-right">
						<div class="has-feedback">
							<div style="display: flex; align-items: center;">&nbsp;&nbsp;
								<select class="form-control" name="searchKey" style="height: 30px;">
									<option value="email"<c:if test="${paging.searchKey == 'email'}"> selected</c:if>>이메일</option>
									<option value="mng_nm"<c:if test="${paging.searchKey == 'mng_nm'}"> selected</c:if>>성명</option>
								</select>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" name="searchWord" id="searchWord" class="form-control input-sm" value="${paging.searchWord}"  />
								&nbsp;&nbsp;
								<input type="submit" value="검색"/>
							</div>
						</div>
					</div>
			<!-- /.box-tools -->
				</div>
			<!-- /.box-header -->
			<div class="box-body no-padding">
				<div class="table-responsive mailbox-messages">
					<table class="table table-hover table-striped">
						<tbody>
							<tr>
							<th style="width: 5%;text-align: center;">NO</th>
							<th style="text-align: center;">이메일(아이디)</th>
							<th style="width: 15%;text-align: center;">성명</th>
							<th style="width: 10%;text-align: center;">상태</th>
							<th style="width: 10%;text-align: center;">등록일</th>
							</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="5">등록된 관리자가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list">
							<tr>
								<td style="text-align: center;">
									${list.rnum}
								</td>
								<td class="txtRight" style="text-align: center;">
								<a href="javascript:goModifyForm(${list.seq_mng});">
									${list.email}
								</a>
							</td>
							<td style="text-align: center;">
								${list.mng_nm}
							</td>
							<td style="text-align: center;">
								<select style="background:#F0F0F0" disabled>
									<option value="0"<c:if test="${list.cd_state == 0}"> selected</c:if>>대기</option>
									<option value="1"<c:if test="${list.cd_state == 1}"> selected</c:if>>사용중</option>
									<option value="2"<c:if test="${list.cd_state == 2}"> selected</c:if>>반려</option>
									<option value="8"<c:if test="${list.cd_state == 8}"> selected</c:if>>자퇴</option>
									<option value="9"<c:if test="${list.cd_state == 9}"> selected</c:if>>강퇴</option>
								</select>
							</td>
							
							<td style="text-align: center;">
								${list.dt_reg}
							</td>
							</tr>
						</c:forEach>
					</c:otherwise>
					</c:choose>
				</tbody>
				</table>
				<!-- /.table -->
				</div>
				<!-- /.mail-box-messages -->
			</div>
			<!-- /.box-body -->
			<div class="box-footer no-padding">
				<div class="mailbox-controls">
				<!-- /.btn-group -->
				<button type="button" class="btn btn-default btn-sm" onclick="location.reload();"><i class="fa fa-refresh"></i></button>
					<span style="float: right;margin-right: 10px;margin-top: 5px;justify-content: center; ">전체 ${paging.totalLine}개 [${paging.currentPage}/${paging.totalPage} 페이지]</span>
				<div class="pull-right">
				<div class="btn-group">
					<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPage" />
				</div>
				<!-- /.btn-group -->
				</div>
				<!-- /.pull-right -->
				</div>
			</div>
			</div>
		  <!-- /. box -->
		</div>
	<!-- /.col -->
	
	<!-- /.row -->
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
