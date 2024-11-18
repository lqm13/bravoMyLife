<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/member/modifyForm.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
	
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>
		
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/front.js"></script>
	<script type="text/javascript" src="/js/package/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/package/tinymce.js"></script>		
	<script>
	function execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					document.getElementById('post').value = data.zonecode;  // 우편번호
					document.getElementById('addr1').value = data.roadAddress;  // 도로명 주소
				}
			}).open();
		}
	
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/front/center/board/list.web";
		frmMain.submit();
	}
	</script>
</head>
<body>
<form id="frmMain" method="POST" class="checkout__form">
<input type="hidden" name="phone" id="phone"/>
<input type="hidden" name="cd_bbs_type"		id="cd_bbs_type" 	value = "0"/>
<input type="hidden" name="type"			id="type"/>
<input type="hidden" name="searchWord"		id="searchWord"/>
<input type="hidden" name="cd_ctg_b"		id="cd_ctg_b"/>
<input type="hidden" name="cd_ctg_m"		id="cd_ctg_m"/>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
		<%@ include file="/include/front/mygnb.jsp" %>
	<!-- Breadcrumb End -->

				<!-- Checkout Section Begin -->
					<section class="checkout spad" >
						<div class="container">
							<div class="row"style="display: flex; justify-content: center; align-items: center;">
								<div class="col-lg-8">
									<h5 style="font-size :30px">개인 정보</h5>
									<div class="row">
										<!-- 이메일 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<p>이메일 <span>*</span></p>
												<div style="display: flex; align-items: center; gap: 10px;">
													<input type="text" id="email" name="email" required value="${memberDto.email}"
														style="flex: 1; min-width: 250px;" disabled autocomplete="off"/>
												</div>
											</div>
										</div>

										<!-- 성명 -->
										<div class="col-lg-6 col-md-6 col-sm-6">
											<div class="checkout__form__input">
												<p>성명 <span>*</span></p>
												<input type="text" id="age" name="age" value="${memberDto.mbr_nm}" maxlength="10" style="width: 100%;" disabled autocomplete="off"/>
											</div>
										</div>
										<!-- 성별 -->
										<div class="col-lg-6 col-md-6 col-sm-6">
											<div class="checkout__form__input">
												<p>성별 <span>*</span></p>
												<input type="text" id="age" name="age"  maxlength="10" value=	
													<c:choose>
															<c:when test="${memberDto.gender == 'M'}">남</c:when>
															<c:otherwise>여</c:otherwise>
													</c:choose>
												style="width: 100%;" disabled autocomplete="off"/>
											</div>
										</div>

										<!-- 연락처 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<p>연락처 <span>*</span></p>
												<div style="display: flex; gap: 5px;">
													<input type="text" id="phone1" name="phone1" value="${fn:split(memberDto.phone, '-')[0]}" style="text-align:center;" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
														maxlength="3" required
														oninput="this.value = this.value.replace(/[^0-9.]/g, '')" autocomplete="off"/>
													-
													<input type="text" id="phone2" name="phone2" value="${fn:split(memberDto.phone, '-')[1]}" style="text-align:center;" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
														maxlength="4" required
														oninput="this.value = this.value.replace(/[^0-9.]/g, '')" autocomplete="off"/>
													-
													<input type="text" id="phone3" name="phone3" value="${fn:split(memberDto.phone, '-')[2]}" style="text-align:center;" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
														maxlength="4" required
														oninput="this.value = this.value.replace(/[^0-9.]/g, '')" autocomplete="off"/>
												</div>
											</div>
										</div>

										<!-- 주소 -->
										<div class="col-lg-12 col-md-6 col-sm-6">
											<div class="checkout__form__input">
											<p>주소 <span>*</span></p>
											<input type="text" id="post" name="post" size="5" readonly value="${memberDto.post}"/>
	
												<label for="addr1">도로명</label>
												<input type="text"	id="addr1"	name="addr1" size="40" readonly value="${memberDto.addr1}"/>
												<span id="guide" style="color:#999; display:none"></span>
												
												<label for="addr2">상세</label>
												<input type="text"	id="addr2"	name="addr2" size="20" value="${memberDto.addr2}" placeholder="상세 주소" />
												
												<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
											</div>
										</div>

										<!-- 마케팅 수신 동의 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__checkbox" >
												<p>마케팅 수신 동의</p>
													<br>
														<input type = "checkbox" id="flg_sms" name="flg_sms" value="Y"<c:if test="${memberDto.flg_sms == 'Y'}"> checked</c:if>>
														SMS
														<input type = "checkbox" id="flg_email" name="flg_email" value="Y"<c:if test="${memberDto.flg_email == 'Y'}"> checked</c:if>>
														EMAIL
											</div>
										</div>
										
										<!-- 수정 버튼 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<input type="button" value="수정하기"
													style="width: 100%; text-align: center;" id="registerId" onClick="checkModify();"/>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>

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
</form>
</body>
</html>