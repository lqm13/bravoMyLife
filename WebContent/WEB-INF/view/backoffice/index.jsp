<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/index.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script type="text/javascript" src="/js/backoffice.js"></script>
	<script>
		window.onload = function () {
			if ("${url}") {
				alert("로그인이 필요합니다.");
			}
		}
		
		window.onload = function() {
			var savedEmail = localStorage.getItem("savedEmail");
			if (savedEmail) {
				document.getElementById("email").value = savedEmail;
				document.getElementById("rememberMe").checked = true;
			}
		}
		
		function goRegisterForm() {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.action = "/console/manager/registerForm.web";
			frmMain.submit();
		}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">

	<%@ include file="/include/backoffice/loginMainSide.jsp" %>

<!-- Main content -->
<div class="content-wrapper" >
	<section class="content" style="display: flex; justify-content: center; align-items: center; padding-top: 310px;">
		<div class="col-md-6">
			<div class="box box-info">
				<div class="box-header with-border">
				<h3 class="box-title">로그인</h3>
				</div>
					<form id="frmMain" method="POST" class="form-horizontal" >
					<input type="hidden" name="cd_state"	id="cd_state" value="0"/>
						<div class="box-body">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">이메일</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="email" name="email" placeholder="Email" autocomplete="off" value="@naver.com">
									</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" id="passwd" name="passwd" placeholder="Password" autocomplete="off" value="12345678!a">
									</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label>
											<input type="checkbox" id="rememberMe"> 아이디 저장
										</label>
									</div>
								</div>
							</div>
						</div>
							<div class="box-footer">
								<input type="button" value="로그인" class="btn btn-info pull-right" id="loginId" onClick="checkLogin();"/>
								<a href="javascript:goRegisterForm()" class="btn btn-info pull-right" style="margin-right: 10px;">회원 가입</a>
								
							</div>
					</form>
			</div>
		</div>
	</section>
</div>
<!-- /Maincontent -->

	<%@ include file="/include/backoffice/footer.jsp" %>
	
	<%@ include file="/include/backoffice/js.jsp" %>

</body>
</html>
