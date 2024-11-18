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
	
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				document.getElementById('post').value = data.zonecode;  // 우편번호
				document.getElementById('addr1').value = data.roadAddress;  // 도로명 주소
			}
		}).open();
	}	
	
	function goMyPage() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/console/myPage/index.web";
		frmMain.submit();
	}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST" action="/console/manager/modifyForm.web">


	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
<div class="content-wrapper">

	<section class="content-header" style="display: flex; align-items: center; margin-left: 415px;">
		<h1>
		MYPAGE
		</h1>
	</section>
	
	<section class="content" >
		<div class="row" style="display: flex; justify-content: center; align-items: center;">
			<div class="col-md-6" style="display: flex; justify-content: center; align-items: center; ">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">개인 정보 확인/수정</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<div class="table-responsive mailbox-messages">
							<table class="table table-hover table-striped">
								<tbody>
								<tr>
									<th style="width: 150px; text-align: center;" >이메일</th>
									<td>
										<input type="text" id="email" name="email" required value="${managerDto.email}" style="flex: 1; min-width: 250px; text-align: center;" disabled autocomplete="off"/>
									</td>
								</tr>
								<tr>
									<th style="width: 150px; text-align: center;" >성명</th>
									<td>
										<input type="text" id="age" name="age" value="${managerDto.mng_nm}" maxlength="10" style="flex: 1; min-width: 250px; text-align: center;" disabled autocomplete="off"/>
									</td>
								</tr>
								<tr>
									<th style="width: 150px; text-align: center;" >연락처</th>
									<td>
										<input type="text" id="phone1" name="phone1" value="${fn:split(managerDto.phone, '-')[0]}" style="text-align:center; " required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
											maxlength="3" autocomplete="off"/>
										-
										<input type="text" id="phone2" name="phone2" value="${fn:split(managerDto.phone, '-')[1]}" style="text-align:center;" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
											maxlength="4" autocomplete="off"/>
										-
										<input type="text" id="phone3" name="phone3" value="${fn:split(managerDto.phone, '-')[2]}" style="text-align:center;" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
											maxlength="4" autocomplete="off"/>
										<input type="hidden" id="phone" name="phone"/>
									</td>
								</tr>
								<tr>
									<th style="width: 150px; text-align: center;" >주소</th>
									<td>
										<input type="text" id="post" name="post" style="text-align: center;" size="5" readonly value="${managerDto.post}"/>
										<br>
										<br>
											<label for="addr1" style="text-align: center;">도로명</label>
											<input type="text"	id="addr1"	name="addr1" style="text-align: center;" size="40" readonly value="${managerDto.addr1}"/>
											<span id="guide" style="color:#999; display:none"></span>
										<br>
										<br>	
											<label for="addr2" style="text-align: center;">상세</label>
											<input type="text"	id="addr2"	name="addr2" style="text-align: center;" size="20" value="${managerDto.addr2}" placeholder="상세 주소" />
											
											<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
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
