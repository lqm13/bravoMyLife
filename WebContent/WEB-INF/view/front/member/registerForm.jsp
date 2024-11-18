<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/member/registerForm.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>

	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/front.js"></script>
	<script type="text/javascript" src="/js/package/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/package/tinymce.js"></script>		
	<script>
	$(function() {
		$('#age').datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true,
			changeYear: true,
			yearRange: "1900:" + new Date().getFullYear(),
			onClose: function() {
				$(this).focus();
			},
			onSelect: function(dateText) {
			}
		});

		$('#age').on('input', function() {
			// 숫자만 남기고 자릿수 제한
			var value = $(this).val().replace(/[^0-9]/g, '').slice(0, 8);
			$(this).val(value);

			if (value.length === 8) {
				var formattedDate = value.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
				$(this).val(formattedDate);
			}
		});
	});
		
		// 이메일 중복 여부
		var isDuplicate = true;

		$(function () {

			var $frm = $("#frmMain");

			$("#checkRegister").on("click", function (e) {

				var myData = { email: $("#email").val() };

				$.ajax({
					type: "POST",
					async: false,
					url: "/front/member/checkEmail.json",
					dataType: "json",
					contentType: "application/json; charset=UTF-8",
					data: JSON.stringify(myData),
					success: function (res) {
						if (res == true) {
							alert("정상적으로 " + $("#email").val()
								+ "로 인증 URL이 전송되었습니다.\n반드시 가입 후 10분 이내에 인증 URL을 클릭하셔야 정상적으로 서비스를 이용할 수 있습니다.");
							// + "로 인증 URL이 전송되었습니다.\n반드시 가입 후 인증 URL을 클릭하셔야 정상적으로 서비스를 이용할 수 있습니다.");
						}
						else {
							alert("인증 이메일이 발송이 실패되었습니다!\n시스템 관리자에게 문의하세요!");
						}
					}
				});
			});

			$("#btnId").on("click", function (e) {

				// 이메일이 7자리 이하 또는 @가 없으면
				if ($("#email").val().length <= 7 || $("#email").val().indexOf("@") <= 0) {
					alert("이메일/아이디를(@ 포함) 8자리 이상으로 입력하세요!");
					return false;
				}
				
				var myData = { email: $("#email").val() };
				
				$.ajax({
					type: "POST",
					async: false,
					url: "/front/member/checkDuplicate.json",
					dataType: "json",
					contentType: "application/json; charset=UTF-8",
					data: JSON.stringify(myData),
					success: function (res) {
						// 중복이 안 될 경우
						if (res != true) {
							isDuplicate = false;
							$("#email").attr("readonly", true);
							alert($("#email").val() + "는 사용 가능하며 변경할 수 없습니다.");
							// $("#btnConfirm").attr("disabled", false);
						}
						else {
							alert($("#email").val() + "는 중복됩니다! 다른 이메일을 입력하세요!");
							$("#email").val("");
							$("#email").focus();
						}
					}
				});
			});
		});
		 function execDaumPostcode() {
				new daum.Postcode({
					oncomplete: function(data) {
						document.getElementById('post').value = data.zonecode;  // 우편번호
						document.getElementById('addr1').value = data.roadAddress;  // 도로명 주소
					}
				}).open();
			}
	</script>
</head>
<body>
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

	<!-- Register Section Begin -->
		<section class="checkout spad">
			<div class="container">
				<form action="/front/member/registerProc.web" class="checkout__form" id="frmMain" method="POST">
				<input type="hidden" name="phone" id="phone" />
					<div class="row" style="display: flex; justify-content: center; align-items: center;">
						<div class="col-lg-8">
							<h5>회원가입</h5>
							<div class="row">
								<div class="col-lg-12 col-md-6 col-sm-6">
									<div class="checkout__form__input">
										<p>이메일 <span>*</span></p>
										<div style="display: flex; align-items: center; gap: 10px;">
											<input type="text" id="email" name="email" required
												style="flex: 1; min-width: 250px;" autocomplete="off"/>
											<input type="button" value="중복 찾기" style="width: 150px; text-align: center;"
												id="btnId" />
										</div>
									</div>
								</div>
								
								<div class="col-lg-12 col-md-6 col-sm-6">
									<div class="checkout__form__input">
										<p>비밀번호 <span>*</span> (영문 대/소문자 구분, 숫자, 특수문자 포함 8~16자 필수 입력)</p>
										<input type="password" id="passwd" name="passwd" required autocomplete="off" />
									</div>
								</div>
								
								<div class="col-lg-12 col-md-6 col-sm-6">
									<div class="checkout__form__input">
										<p>비밀번호 <span>*</span> (확인을 위해 새 비밀번호를 다시 입력해주세요.)</p>
										<input type="password" id="passwd_" name="passwd_" required autocomplete="off" />
									</div>
								</div>
								
								<div class="col-lg-12 col-md-6 col-sm-6">
									<div class="checkout__form__input">
										<p>성명 <span>*</span></p>
										<input type="text" id="mbr_nm" name="mbr_nm" required
											style="width: 100%;" autocomplete="off"/>
									</div>
								</div>
								
								<div class="col-lg-7 col-md-6 col-sm-6">
									<div class="checkout__form__input">
										<p>생년월일 <span>*</span></p>
										<input type="text" id="age" name="age" placeholder="생년월일" maxlength="10" style="width: 100%;" required autocomplete="off"/>
									</div>
								</div>
								
								<div class="col-lg-5 col-md-6 col-sm-6">
									<div class="gender-option">
										<p>성별 <span>*</span></p>
										<div class="checkbox_container" style="display: flex; gap: 10px;">
											<label><input type="radio" name="gender" value="M" checked />
												남</label>
											<label><input type="radio" name="gender" value="F" /> 여</label>
										</div>
									</div>
								</div>
								
								<div class="col-lg-12 col-md-6 col-sm-6">
									<div class="checkout__form__input">
										<p>연락처 <span>*</span></p>
										<div style="display: flex; gap: 5px;">
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
								</div>
								
								<div class="col-lg-12 col-md-6 col-sm-6">
									<div class="checkout__form__input">
										<p>주소 <span>*</span></p>
										<input type="text" id="post" name="post" size="5" autocomplete="off"/>

											<p><label for="addr1">도로명 <span>*</span></label></p>
											<input type="text"	id="addr1"	name="addr1" size="40" autocomplete="off"/>
											<span id="guide" style="color:#999; display:none"></span>
											
											<p><label for="addr2">상세 <span>*</span></label></p>
											<input type="text"	id="addr2"	name="addr2" size="20" placeholder="상세 주소" autocomplete="off"/>
											
											<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
									</div>
								</div>
								
								<div class="col-lg-12 col-md-6 col-sm-6">
									<div class="checkout__form__checkbox" >
										<p>마케팅 수신 동의</p>
											<br>
												<input type = "checkbox" id="flg_sms" name="flg_sms" value="Y">
												SMS
												<input type = "checkbox" id="flg_email" name="flg_email" value="Y">
												EMAIL
									</div>
								</div>
								
								<div class="col-lg-12 col-md-6 col-sm-6">
									<div class="checkout__form__checkbox">
										<input type="checkbox" id="term_1" name="term_1" value="Y">
										[필수] '브라보 마이 라이프' 이용 약관 동의
										<div class="terms-container"
											style="border: 1px solid #ccc; padding: 10px; margin-top: 5px; max-height: 100px; overflow-y: auto;">
											제1장 총칙<br>제 1 조 (목적)<br>이 약관은 브라보 마이 라이프(이하 “회사”)가 운영하는 사이버몰에서 제공하는
											서비스와 이를 이용하는 회원의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
										</div>
									</div>
								</div>
								
								<div class="col-lg-12 col-md-6 col-sm-6">
									<div class="checkout__form__checkbox">
										<input type="checkbox" id="term_2" name="term_2" value="Y">
										[필수] 개인정보 수집 및 이용동의
										<div class="terms-container"
											style="border: 1px solid #ccc; padding: 10px; margin-top: 5px; max-height: 100px; overflow-y: auto;">
											제1장 총칙<br>제 1 조 (목적)<br>이 약관은 브라보 마이 라이프(이하 “회사”)가 운영하는 사이버몰에서 제공하는
											서비스와 이를 이용하는 회원의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
										</div>
									</div>
								</div>
								
								<div class="col-lg-12 col-md-6 col-sm-6">
									<div class="checkout__form__checkbox">
										<input type="checkbox" id="term_3" name="term_3" value="Y">
										[선택] 개인정보 제3자 제공 동의
										<div class="terms-container"
											style="border: 1px solid #ccc; padding: 10px; margin-top: 5px; max-height: 100px; overflow-y: auto;">
											제1장 총칙<br>제 1 조 (목적)<br>이 약관은 브라보 마이 라이프(이하 “회사”)가 운영하는 사이버몰에서 제공하는
											서비스와 이를 이용하는 회원의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
										</div>
									</div>
								</div>
								
								<div class="col-lg-12 col-md-6 col-sm-6">
									<div class="checkout__form__input">
										<input type="button" value="회원가입"
											style="width: 100%; text-align: center;" id="registerId" onClick="checkRegister();"/>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</section>
	<!-- Register Section End -->
	
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
</body>
</html>