<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/users/member/modifyForm.jsp" %>
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
	
	<script>
	function modifyProc(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/console/users/member/modifyProc.web";
		frmMain.submit();
	}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST" >
<input type="hidden" name="seq_mbr" value="${memberDto.seq_mbr}"/>	
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" value="${paging.cd_bbs_type}" />
	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header" style="display: flex; align-items: center; margin-left: 425px;">

		<h1>
			회원 관리
			<small></small>
		</h1>
	</section>

		<!-- Main content -->
	<section class="content" style="display: flex; justify-content: center; align-items: center;">
	
		<div class="col-md-6">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">회원 정보 수정</h3>
				</div>
			<!-- /.box-header -->
				<div class="box-body">
					<table class="table table-bordered">
					<tr>
						<th>성명</th>
						<td>${memberDto.mbr_nm}</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
						<c:choose>
							<c:when test="${memberDto.gender == 'M'}">남</c:when>
							<c:otherwise>여</c:otherwise>
						</c:choose>
						</td>
					</tr>	
					<tr>
						<th>나이</th>
						<td>
							${memberDto.age}
						</td>
					</tr>
					<tr>
						<th>이메일(아이디)</th>
						<td colspan="3">
							${memberDto.email} / 
							<select name="cd_state" style="background:#F0F0F0">
								<option value="0"<c:if test="${memberDto.cd_state == 0}"> selected</c:if>>대기</option>
								<option value="1"<c:if test="${memberDto.cd_state == 1}"> selected</c:if>>사용중</option>
								<option value="2"<c:if test="${memberDto.cd_state == 2}"> selected</c:if>>반려</option>
								<option value="8"<c:if test="${memberDto.cd_state == 8}"> selected</c:if>>자퇴</option>
								<option value="9"<c:if test="${memberDto.cd_state == 9}"> selected</c:if>>강퇴</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td colspan="3">
							${fn:split(memberDto.phone, '-')[0]} - ${fn:split(memberDto.phone, '-')[1]} - ${fn:split(memberDto.phone, '-')[2]}
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">
							${memberDto.post} ${memberDto.addr1} ${memberDto.addr2}
						</td>
					</tr>
					<tr>
						<th>포인트 총합</th>
						<td colspan="3">
							${memberDto.total_point}
						</td>
					</tr>
					<tr>
						<th>마지막 접속 일시</th>
						<td>
							${memberDto.last_dt}
						</td>
					</tr>
					<tr>
						<th>마케팅 수신 동의</th>
						<td colspan="3">
							SMS <input type="checkbox"<c:if test="${memberDto.flg_sms == 'Y'}"> checked</c:if>/>
							Email <input type="checkbox"<c:if test="${memberDto.flg_email == 'Y'}"> checked</c:if>/>
						</td>
					</tr>
					</table>
					<div class="modal-footer" style="text-align: center; padding-top: 10px; padding-bottom: 10px;">
						<input type="button" value="수정 하기" class="btn btn-default" data-dismiss="modal" onclick="javascript:modifyProc()"/>
						<input type="button" value="목록" class="btn btn-primary" onclick="javascript:goMemberList()" />
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