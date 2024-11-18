<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/manager/registerForm.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	<%@ include file="/include/backoffice/css.jsp" %>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/backoffice.js"></script>
	<style></style>
	<script>
	var isDuplicate = true;
	$(function() {
		var $frm = $("#frmMain");

		// 이메일 중복 확인 버튼 클릭 이벤트
		$("#btnId").on("click", function(e) {
			e.preventDefault(); // 기본 이벤트 방지 (폼 제출 방지)
			
			// 이메일이 7자리 이하 또는 @가 없으면 경고
			if ($("#email").val().length <= 7 || $("#email").val().indexOf("@") <= 0) {
				alert("이메일/아이디를(@ 포함) 8자리 이상으로 입력하세요!");
				return false;
			}
			
			// 이메일 데이터를 JSON으로 준비
			var myData = JSON.stringify({ email: $("#email").val() });

					$.ajax({
						type: "POST",
						async: false,
						url: "/console/manager/checkDuplicate.json",  // 중복 체크를 위한 URL
						dataType: "json",
						contentType: "application/json; charset=UTF-8",
						data: JSON.stringify({ email: $("#email").val() }),
						success: function (res) {
							// 중복 여부 확인
							if (res == true) {
								alert("이미 사용 중인 이메일입니다. 다른 이메일을 입력해주세요.");
								isDuplicate = true;  // 중복일 경우 true로 설정
							} else {
								alert("사용 가능한 이메일입니다.");
								isDuplicate = false;  // 중복이 아닐 경우 false로 설정
							}
						}
					});
				});
			});

</script>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST" >
	<%@ include file="/include/backoffice/loginMainSide.jsp" %>
	


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	<!-- Content Header (Page header) -->
	
	<section class="content-header" style="display: flex; align-items: center; margin-left: 425px;" >
		<h1>
			관리자가입
			<small></small>
		</h1>
	</section>

	<!-- Main content -->
	
	<section class="content" style="display: flex; justify-content: center; align-items: center;" >
	
		<!-- left column -->
		<div class="col-md-6">
		<!-- general form elements -->
		<div class="box box-primary">
		
			<!-- /.box-header -->
			<!-- form start -->
			
			
				<div class="form-group">
				<div class="box-body">
						<label>이메일 *</label>
						<input type="text" id="email" name="email" required
							style="flex: 1; min-width: 250px;" autocomplete="off"/>
							<input type="button" value="중복 찾기" id="btnId" />
					</div>
				</div>	
					<div class="form-group">
					<div class="box-body">
						<label>비밀번호 * (영문 대/소문자 구분, 숫자, 특수문자 포함 8~16자 필수 입력)</label>
						<input type="password" id="passwd" name="passwd" required autocomplete="off" />
					</div>
					</div>
					<div class="form-group">
					<div class="box-body">
						<label>비밀번호 * (확인을 위해 새 비밀번호를 다시 입력해주세요.)</label>
						<input type="password" id="passwd_" name="passwd_" required autocomplete="off" />
					</div>
					</div>
					<div class="form-group">
					<div class="box-body">
						<label>성명 * </label>
						<input type="text" id="mng_nm" name="mng_nm" required style="width: 25%;" autocomplete="off"/>
					</div>
					</div>
					<div class="form-group">
						<div class="box-body">
							<label>연락처 * </label>
								<div class="row">
									<div class="box-body">
										<input type="text" id="phone1" name="phone1"
											maxlength="3" required style="height: 33px;"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '')" autocomplete="off"/>
										-
										<input type="text" id="phone2" name="phone2"
											maxlength="4" required style="height: 33px;"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '')" autocomplete="off"/>
										-
										<input type="text" id="phone3" name="phone3"
											maxlength="4" required style="height: 33px;"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '')" autocomplete="off"/>
									</div>
								</div>
							<input type="hidden" id="phone" name="phone" value="010-2025-5589"/>
						</div>
					</div>
					<div class="box-body">
						<p>주소 <span>*</span></p>
						<input type="text" id="post" name="post" size="5" autocomplete="off">

						<p><label for="addr1">도로명 <span></span></label></p>
						<input type="text" id="addr1" name="addr1" size="40" autocomplete="off">
						<input type="hidden" id="jibunAdd" />
						 <input type="hidden" id="extraAddress" />
						<span id="guide" style="color:#999; display:none"></span>
						
						<p><label for="addr2">상세 <span></span></label></p>
						<input type="text" id="addr2" name="addr2" size="20" placeholder="상세 주소" autocomplete="off">
						<input type="button" value="우편번호 찾기" onclick="execDaumPostcode()" />
					</div>
				<div class="box-footer">
					<input type="button" value="회원가입" onclick="checkRegister()" />
				</div>
				
				</div>
			</div>
	</section>

	<!-- /.content -->
	</div>

<!-- /.content-wrapper -->
<%@ include file="/include/backoffice/footer.jsp" %>

<%@ include file="/include/backoffice/sideBar.jsp" %>
	<div class="control-sidebar-bg"></div>
<%@ include file="/include/backoffice/js.jsp" %>
</form>
</body>
</html>