	<!-- html 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/sale/function_list.jsp" %>
<!-- 이 부분은 필요에 따라 추가하는 것이 맞으므로 개별 판단에 따라 추가하거나 삭제해도 되고 사용하지 않더라도 그대로 넣어둬도 무방하다고 판단 -->
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
<style>

</style>
	<%@ include file="/include/common/header.jsp" %>
	
	<script>
	
	function checkboxSelected() {
		
		var checkboxes = document.getElementsByName('cd_ctg');
		
		var oneChecked = false;

		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked) {
				oneChecked = true;
				break;
			}
		}
		 return oneChecked;
	}
	
	function surveyProc(value) {
		
		if (!checkboxSelected()) {
				alert('한가지를 선택해주세요.');
				if (event) {
					event.preventDefault();
				}
				return;
			}
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_survey_type.setAttribute("value", value);
		
		frmMain.action="/front/center/board/surveyProc.web";
		frmMain.submit();
	}
	
	</script>
	
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<!-- 페이지의 상단에 보이는 로고 및 로그인 / 회원가입 코드 -->
	<%@ include file="/include/front/bannergnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->

	<section class="checkout spad" >
		<div class="container">
			<form id="frmMain" method="POST" class="checkout__form">
			<input type="hidden" name="cd_survey_type"								id="cd_survey_type"/>
			<input type="hidden" name="gender"										id="gender"			value="${surveyDto.gender}"/>
			<input type="hidden" name="mbr_nm"										id="mbr_nm"			value="${surveyDto.mbr_nm}"/>
			<input type="hidden" name="user_age"									id="user_age"		value="${surveyDto.user_age}"/>
			<c:forEach var="surveyListDto" items="${surveyListDto}"	varStatus="status">
				<input type="hidden" name="surveyList[${status.index}].cd_ctg_m"	id="surveyList[${status.index}].cd_ctg_m"	value="${surveyListDto.cd_ctg_m}" />
				<input type="hidden" name="surveyList[${status.index}].cd_ctg_b"	id="surveyList[${status.index}].cd_ctg_b"	value="${surveyListDto.cd_ctg_b}" />
			</c:forEach>
			
			
			<!-- 고정 -->
				<div class="survey">
					<div class="gnb">
						<div class="survey-div">
							<a href="#"onclick="window.history.back(); return false;" style="display: inline-block; line-height: 32px;"><span style="position: relative;">이전</span></a>
						</div>
						<div class="survey-div">
							<h1 style="text-align: center; font-size: 30px; font-weight: 700; margin-top: -15px; font-family: 'Noto Sans KR', sans-serif !important;">맞춤 건강 설문</h1>
						</div>
						<div class="survey-div" style="text-align: right;">
							<span onclick="closeSurvey(); return false;" style="position: relative; cursor: pointer;">X</span>
						</div>
					</div>
					<div class="survey-progress">
						<div class="progress-sub">
							<div id="progressCurrent" style="width: 33%; height: 100%; background-color: #FF4500;"></div>
						</div>
					</div>
				</div>
				<div id="A2" class="row" style="display: flex; justify-content: center; align-items: center;">
					<div class="col-lg-12" style="max-width: 670px !important; width: 100% !important; text-align: center;">
						<h2 id="qTitle" class="ha on" style="text-align: center; font-size: 20px; font-weight: 700;">불편하거나 걱정되는 것을 선택하세요.</h2>
						<span id="qContent" class="ha bubble on" style="display: inline-block;">
							하나만 선택해 주세요.
						</span>
						<br>
						<br>
						<div class="checkbox-container" style="justify-content: center; align-items: center;"">
							<input type="checkbox" class="customCheckbox" id="symptom1" style="display:none" name="cd_ctg" value="11">
							<label for="symptom1" class="customLabel">
								 <i class="fas fa-heart"></i>
								 <span style="display: block;">혈관 · 혈액 순환</span>
							</label>
						</div>
						<br>
						<div class="checkbox-container">
							<input type="checkbox" class="customCheckbox" id="symptom2" style="display:none" name="cd_ctg" value="17">
							<label for="symptom2" class="customLabel">
								 <i class="fas fa-apple-alt"></i>
								 <span style="display: block;">소화 · 장</span>
							</label>
						</div>
						<br>
						<div class="checkbox-container">
							<input type="checkbox" class="customCheckbox" id="symptom3" style="display:none" name="cd_ctg" value="13">
							<label for="symptom3" class="customLabel">
								 <i class="fas fa-smile"></i>
								 <span style="display: block;">염증 · 항염</span>
							</label>
						</div>
						<br>
						<div class="checkbox-container">
							<input type="checkbox" class="customCheckbox" id="symptom4" style="display:none" name="cd_ctg" value="16">
							<label for="symptom4" class="customLabel">
								 <i class="fas fa-eye"></i> 
								 <span style="display: block;">눈</span>
							</label>
						</div>
						<br>
						<div class="checkbox-container">
							<input type="checkbox" class="customCheckbox" id="symptom5" style="display:none" name="cd_ctg" value="18">
							<label for="symptom5" class="customLabel">
								 <i class="fas fa-brain"></i>
								 <span style="display: block;">두뇌 활동</span>
							</label>
						</div>
						<br>
						<div class="checkbox-container">
							<input type="checkbox" class="customCheckbox" id="symptom6" style="display:none" name="cd_ctg" value="15">
							<label for="symptom6" class="customLabel">
								 <i class="fas fa-bed"></i>
								 <span style="display: block;">피로감</span>
							</label>
						</div>
						<br>
						<div class="checkbox-container">
							<input type="checkbox" class="customCheckbox" id="symptom7" style="display:none" name="cd_ctg" value="14">
							<label for="symptom7" class="customLabel">
								 <i class="fas fa-bone"></i>
								 <span style="display: block;">뼈 · 관절</span>
							</label>
						</div>
						<br>
						<div class="checkbox-container">
							<input type="checkbox" class="customCheckbox" id="symptom8" style="display:none" name="cd_ctg" value="12">
							<label for="symptom8" class="customLabel">
								 <i class="fas fa-virus"></i>
								 <span style="display: block;">면역</span>
							</label>
						</div>
						<br>
						<div class="checkbox-container">
							<input type="checkbox" class="customCheckbox" id="symptom9" style="display:none" name="cd_ctg" value="19">
							<label for="symptom9" class="customLabel">
								 <i class="fas fa-heartbeat"></i>
								 <span style="display: block;">위 · 간</span>
							</label>
						</div>
						<br>
						<br>
						<div>
							<button id="btnNext" class="btn-next" onClick="surveyProc('4');">
								다음
							</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
	<!-- Footer Section Begin -->
	<%@ include file="/include/common/footer.jsp" %>
	<%@ include file="/include/common/footer-copyright.jsp" %>
	<!-- Footer Section End -->
	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>
	
	<script>
		$(document).ready(function() {
			$('.customCheckbox').on('click', function() {
				// 현재 체크박스의 체크 상태를 저장
				var isChecked = $(this).prop('checked');
		
				// 모든 체크박스의 체크를 해제
				$('.customCheckbox').prop('checked', false);
		
				// 현재 체크박스만 다시 체크 상태로 설정
				$(this).prop('checked', isChecked);
		
				// 모든 레이블의 배경색과 글자색을 초기화
				$('.customCheckbox').next().css({
					'background-color': '#FFFFFF',
					'color': '#000000',
					'border-color': '#CCC'
				});
		
				// 선택된 체크박스에 대해 스타일 적용
				if (isChecked) {
					$(this).next().css({
						'background-color': '#F77202',
						'color': '#FFFFFF',
						'border-color': '#F77202'
					});
				}
			});
		});
		
		function closeSurvey() {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.action = "/front/center/board/personalHealth/index.web";
			frmMain.submit();
		}
</script>
</body>
</html>