function checkModify() {
	if (confirm("정보를 변경하시겠습니까?")) {
	var isSubmit	= true;
	var frmMain		= document.getElementById("frmMain");
	
	// 휴대폰번호 확인(3자리-4자리-4자리)
	var regExpPhone = /^\d{3}-\d{4}-\d{4}$/;
	var phone = document.getElementById("phone1").value + "-" + document.getElementById("phone2").value + "-" + document.getElementById("phone3").value;
		if (!regExpPhone.test(phone)) {
			alert("연락처를 확인해 주세요!");
			isSubmit = false;
		}
		
		if (document.getElementById("phone1").value == ""
				|| document.getElementById("phone2").value == ""
				|| document.getElementById("phone3").value == ""
				|| document.getElementById("post").value == ""
				|| document.getElementById("addr1").value == ""
				|| document.getElementById("addr2").value == "") {
			alert("필수 항목을 입력하세요!");
			isSubmit = false;
		}
		
		if (isSubmit) {
			
		document.getElementById("phone").value = 
			document.getElementById("phone1").value
			+ "-" + document.getElementById("phone2").value
			+ "-" + document.getElementById("phone3").value;
			
		frmMain.action = "/front/member/modifyProc.web";
		frmMain.submit();
		}
	}
}

function execDaumPostcode() {
	
	var width = 500; //팝업의 너비
	var height = 600; //팝업의 높이
	
	new daum.Postcode({
		width: width,
		height: height,
		oncomplete: function(data) {
			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress;		// 도로명 주소 변수
			var extraRoadAddr = '';					// 참고 항목 변수
			
			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				extraRoadAddr += data.bname;
			}
			
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName !== '' && data.apartment === 'Y'){
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if(extraRoadAddr !== ''){
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById("postcode").value		= data.zonecode;
			document.getElementById("roadAddr").value		= roadAddr;
			document.getElementById("addr1").value			= data.jibunAddress;
			
			// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
			if(roadAddr !== ''){
				document.getElementById("extraAddress").value = extraRoadAddr;
			}
			else {
				document.getElementById("extraAddress").value = '';
			}
			
			var guideTextBox = document.getElementById("guide");
			// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
			if(data.autoRoadAddress) {
				var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
				guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
				guideTextBox.style.display = 'block';
			
			}
			else if(data.autoJibunAddress) {
				var expJibunAddr = data.autoJibunAddress;
				guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
				guideTextBox.style.display = 'block';
			}
			else {
				guideTextBox.innerHTML = '';
				guideTextBox.style.display = 'none';
			}
			}
		}).open({
			left: (window.screen.width / 2) - (width / 2),
			top: (window.screen.height / 2) - (height / 2)
	});
}

function checkEmail(email) {
	var isEmail = true;
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	if (!regExpEmail.test(email)) return false;
	if (email.length <= 7) return false;
	if (email.indexOf("@") <= 0) return false;

	var arrDomain = [".co.kr", ".com", ".net", ".or.kr", ".go.kr"];
	var isExist = arrDomain.some(function (domain) {
		return email.indexOf(domain) > 0;
	});

	if (!isExist) return false;

	var arrValue = email.split("@");
	var regularExpression = /^[a-zA-Z]{1}[a-zA-Z0-9_]{4,16}$/;
	if (!regularExpression.test(arrValue[0])) return false;

	var IRREGULAR_KEYWORD = "super|root|administrator|admin|console"
		+ "|sys|system|sa|owner"
		+ "|document|html|iframe|div|span|img|src|type"
		+ "|javascript|vbscript|script|alert"
		+ "|id|member|customer|www";
	if (IRREGULAR_KEYWORD.indexOf(arrValue[0].toLowerCase()) >= 0) {
		return false;
	}

	return isEmail;
}

function checkRegister() {
	var isSubmit = true;
	var frmMain = document.getElementById("frmMain");

	if (!document.getElementById("term_1").checked) {
		alert("필수 약관에 동의하셔야 합니다!");
		return;
	}
	
	if (!document.getElementById("term_2").checked) {
		alert("필수 약관에 동의하셔야 합니다!");
		return;
	}
	
	var age = document.getElementById("age").value;

	if (age === "") {
		alert("연령을 입력 하셔야 합니다!");
		return;
	}
	
	var email = document.getElementById("email").value;

	if (!checkEmail(email)) {
		alert("이메일을 확인하세요!");
		document.getElementById("email").focus();
		return;
	}
	
	if (isDuplicate) {
		alert("이메일 중복을 확인하세요!");
		document.getElementById("btnId").focus();
		return;
	}

	if (document.getElementById("passwd").value != document.getElementById("passwd_").value) {
		alert("비밀번호를 확인하세요!");
		isSubmit = false;
		document.getElementById("passwd").focus();
	}
	
	var regExpPasswd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
	if (!regExpPasswd.test(document.getElementById("passwd").value)) {
		alert("비밀번호는 영문/숫자/특수기호를 조합하여 8자 이상을 입력하세요!");
		isSubmit = false;
	}

	var regExpName = /^[가-힣]*$/;
	if (!regExpName.test(document.getElementById("mbr_nm").value)) {
		alert("성명은 한글만 입력하세요!");
		isSubmit = false;
	}

	var regExpPhone = /^\d{3}-\d{4}-\d{4}$/;
	var phone = document.getElementById("phone1").value + "-" + document.getElementById("phone2").value + "-" + document.getElementById("phone3").value;
	if (!regExpPhone.test(phone)) {
		alert("연락처를 확인해 주세요!");
		isSubmit = false;
	}
	
	if (document.getElementById("mbr_nm").value == ""
		|| document.getElementById("phone1").value == ""
		|| document.getElementById("phone2").value == ""
		|| document.getElementById("phone3").value == ""
		|| document.getElementById("post").value == ""
		|| document.getElementById("addr1").value == ""
		|| document.getElementById("addr2").value == "") {
		alert("필수 항목을 입력하세요!");
		isSubmit = false;
	}
	
	if (isSubmit) {
		alert("정상적으로 "
			+ email
			+ "로 인증 URL이 전송되었습니다.\n반드시 가입 후 10분 이내에 인증 URL을 클릭하셔야 정상적으로 서비스를 이용할 수 있습니다.");
		document.getElementById("phone").value =
			document.getElementById("phone1").value
			+ "-" + document.getElementById("phone2").value
			+ "-" + document.getElementById("phone3").value;

		frmMain.action = "/front/member/registerProc.web";
		frmMain.submit();
	}
}

function loadSavedEmail() {
	var savedEmail = localStorage.getItem("savedEmail");
	if (savedEmail) {
		var emailInput = document.getElementById("email");
		var rememberMeCheckbox = document.getElementById("rememberMe");

		if (emailInput) {
			emailInput.value = savedEmail;
		}

		if (rememberMeCheckbox) {
			rememberMeCheckbox.checked = true;
		}
	}
}

function checkLogin() {
			
	var frmMain = document.getElementById("frmMain");
	
	if (document.getElementById("email").value.length < 6
			|| document.getElementById("email").value.length > 32) {
		alert("이메일(아이디)를 6 ~ 16자 이내로 입력하세요!");
		document.getElementById("email").focus();
		// document.getElementById("email").select();
		return false;
	}
	
	if (document.getElementById("passwd").value.length < 8
			|| document.getElementById("passwd").value.length > 16) {
		alert("비밀번호를 8 ~ 16자 이내로 입력하세요!");
		document.getElementById("passwd").focus();
		return false;
	}
	
	// 아이디 저장 체크 쿠키
	if (document.getElementById("rememberMe").checked) {
		setCookie("savedEmail", document.getElementById("email").value, 7);
	} else {
		eraseCookie("savedEmail");
	}
	
	frmMain.action = "/front/login/loginProc.web";
	frmMain.submit();
	
	return true;
}

function setCookie(name, value, days) {
	var expires = "";
	if (days) {
		var date = new Date();
		date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
		expires = "; expires=" + date.toUTCString();
	}
	document.cookie = name + "=" + (value || "") + expires + "; path=/";
}

function getCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) === ' ') c = c.substring(1, c.length);
		if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
	}
	return null;
}

function eraseCookie(name) {
	document.cookie = name + "=; Max-Age=-99999999; path=/";
}

function goToRegister() {
	
	frmMain.action = "/front/member/registerForm.web";
	frmMain.submit();
}

function moveToFindId() {
	
	frmMain.action = "/front/member/findIdForm.web";
	frmMain.submit();
}

function moveToLogin() {
	
	frmMain.action = "/front/login/loginForm.web";
	frmMain.submit();
}


function validateForm() {
	var mbrNm = document.getElementById("mbr_nm").value;
	if (!mbrNm) {
		alert("성명을 입력하세요.");
		return false; // 폼 제출 중지
	}
	return true; // 폼 제출 진행
}
function moveToFindPasswd() {
	
	frmMain.action = "/front/member/findPasswdForm.web";
	frmMain.submit();
}

function resetPasswd() {
	
	var passwd_input = $("#passwd_input").val();	// 현재 임시 비밀번호
	
	var newPasswd	= $("#newPasswd").val();
	var newPasswd_	= $("#newPasswd_").val();
	
	// 임시 비밀번호가 비어 있는지 확인
	if (!passwd_input) {
		alert("임시 비밀번호를 입력해주세요!");
		return;
	}
	
	// 새비밀번호가 비어 있는지 확인
	if (!newPasswd) {
		alert("새비밀번호를 입력해주세요!");
		return;
	}
	
	// 새비밀번호 확인이 비어 있는지 확인
	if (!newPasswd_) {
		alert("새비밀번호 확인을 입력해주세요!");
		return;
	}
	
	// 신규 비밀번호와 비밀번호 확인이 일치하는지 확인
	if (newPasswd != newPasswd_) {
		alert("새비밀번호와 새비밀번호 확인이 일치하지 않습니다!");
		return;
	}
	
	// 비밀번호가 규칙에 맞는지 확인
	var regExpPasswd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
		if (!regExpPasswd.test(newPasswd)) { // newPasswd를 검사
			alert("비밀번호는 영문/숫자/특수기호를 조합하여 8자 이상을 입력하세요!");
			return; // isSubmit = false; 대신 return으로 수정
		}

	frmMain.action = "/front/member/findPasswdResultProc.web";
	frmMain.submit();
}