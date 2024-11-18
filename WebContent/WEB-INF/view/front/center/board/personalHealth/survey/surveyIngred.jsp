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
			<input type="hidden" name="gender"										id="gender"									value="${surveyDto.gender}"/>
			<input type="hidden" name="mbr_nm"										id="mbr_nm"									value="${surveyDto.mbr_nm}"/>
			<input type="hidden" name="user_age"									id="user_age"								value="${surveyDto.user_age}"/>
			<c:forEach var="surveyListDto" items="${surveyListDto}"	varStatus="status">
				<input type="hidden" name="surveyList[${status.index}].cd_ctg_m"	id="surveyList[${status.index}].cd_ctg_m"	value="${surveyListDto.cd_ctg_m}" />
				<input type="hidden" name="surveyList[${status.index}].cd_ctg_b"	id="surveyList[${status.index}].cd_ctg_b"	value="${surveyListDto.cd_ctg_b}" />
			</c:forEach>
				<div class="survey">
					<div class="gnb">
						<div class="survey-div">
							<a href="#" onclick="window.history.back(); return false;"style="display: inline-block; line-height: 32px;"><span style="position: relative;">이전</span></a>
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
							<div id="progressCurrent" style="width: 66%; height: 100%; background-color: #FF4500;"></div>
						</div>
					</div>
				</div>
				<div id="A3" class="row" style="display: flex; justify-content: center; align-items: center;">
					<div class="col-lg-12" style="max-width: 670px !important; width: 100% !important; text-align: center;">
						<h2 id="qTitle" class="ha on" style="text-align: center; font-size: 20px; font-weight: 700;">해당하는 식습관을 선택하세요.</h2>
							<span style="display: inline-block;">하나만 선택해 주세요.</span>
						<br>
						<br>
						<div class="checkbox-container">
							<input type="checkbox" class="customCheckbox" id="food1" style="display:none" name="cd_ctg" value="21">
							<label for="food1" class="customLabel">
								 <i class="fas fa-seedling"></i>
								 <span style="display: block;">곡물류를 자주 먹지 않아요.</span>
							</label>
						</div>
						<br>
						<div class="checkbox-container">
							<input type="checkbox" class="customCheckbox" id="food2" style="display:none" name="cd_ctg" value="22">
							<label for="food2" class="customLabel">
								 <i class="fas fa-fish"></i>
								 <span style="display: block;">생선을 자주 먹지 않아요.</span>
							</label>
						</div>
						<br>
						<div class="checkbox-container">
							<input type="checkbox" class="customCheckbox" id="food3" style="display:none" name="cd_ctg" value="23">
							<label for="food3" class="customLabel">
								 <i class="fas fa-leaf"></i>
								 <span style="display: block;">브로콜리를 자주 먹지 않아요.</span>
							</label>
						</div>
						<br>
						<div class="checkbox-container">
							<input type="checkbox" class="customCheckbox" id="food4" style="display:none" name="cd_ctg" value="24">
							<label for="food4" class="customLabel">
								 <i class="fas fa-glass-martini"></i>
								 <span style="display: block;">요거트를 자주 먹지 않아요.</span>
							</label>
						</div>
						<br>
						<div class="checkbox-container">
							<input type="checkbox" class="customCheckbox" id="food5" style="display:none" name="cd_ctg" value="25">
							<label for="food5" class="customLabel">
								 <i class="fas fa-anchor"></i>
								 <span style="display: block;">조개류를 자주 먹지 않아요.</span>
							</label>
						</div>
						<br>
						<div class="checkbox-container">
							<input type="checkbox" class="customCheckbox" id="food6" style="display:none" name="cd_ctg" value="26">
							<label for="food6" class="customLabel">
								 <i class="fas fa-leaf"></i>
								 <span style="display: block;">시금치를 자주 먹지 않아요.</span>
							</label>
						</div>
						<br>
						<div class="checkbox-container">
							<input type="checkbox" class="customCheckbox" id="food7" style="display:none" name="cd_ctg" value="27">
							<label for="food7" class="customLabel">
								 <i class="fas fa-drumstick-bite"></i>
								 <span style="display: block;">소고기를 자주 먹지 않아요.</span>
							</label>
						</div>
						<br>
						<div class="checkbox-container">
							<input type="checkbox" class="customCheckbox" id="food8" style="display:none" name="cd_ctg" value="28">
							<label for="food8" class="customLabel">
								 <i class="fas fa-seedling"></i>
								 <span style="display: block;">호두를 자주 먹지 않아요.</span>
							</label>
						</div>
						<br>
						<div class="checkbox-container">
							<input type="checkbox" class="customCheckbox" id="food9" style="display:none" name="cd_ctg" value="29">
							<label for="food9" class="customLabel">
								 <i class="fas fa-capsules"></i>
								 <span style="display: block;">밀크씨슬 씨앗을 자주 먹지 않아요.</span>
							</label>
						</div>
						<br>
						<div>
							<button id="btnNext" class="btn-next" onClick="surveyProc('5');">
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