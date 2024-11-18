<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/member/writeFormDelivery.jsp" %>
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
	<script type="text/javascript" src="/js/package/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/package/tinymce.js"></script>		
	<script>
	function execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					document.getElementById('post').value = data.zonecode;
					document.getElementById('addr1').value = data.roadAddress;
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
<input type="hidden" name="type"				id="type"/>
<input type="hidden" name="searchWord"			id="searchWord" />
<input type="hidden" name="cd_ctg_m"			id="cd_ctg_m"/>
<input type="hidden" name="cd_ctg_b"			id="cd_ctg_b"/>
<input type="hidden" name="cd_bbs_type"			id="cd_bbs_type"		/>
<input type="hidden" name="seq_mbr_addr"		id="seq_mbr_addr"		value="${memberDto.seq_mbr_addr}"/>
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
							<h5 style="font-size :30px; border-bottom: 0px !important;">배송지 수정</h5>
								<c:if test="${memberDto.flg_default == 'Y'}">
								<div style="padding-bottom: 10px !important; display: flex; align-items: center; justify-content: left;">
									<input name="deliveryDefault" value="true" type="checkbox" class="delivery_checkbox" checked><span>기본 배송지로 선택</span>
								</div>
								</c:if>
								<c:if test="${memberDto.flg_default == 'N'}">
								<div style="padding-bottom: 10px !important; display: flex; align-items: center; justify-content: left;">
									<input name="deliveryDefault" value="true" type="checkbox" class="delivery_checkbox"><span>기본 배송지로 선택</span>
								</div>
								</c:if>
							<div class="row">
								<!-- 주소 -->
								<div class="col-lg-12 col-md-6 col-sm-6">
									<div class="checkout__form__input">
									<p style="font-family: 'Noto Sans KR', sans-serif !important;">주소 <span>*</span></p>
										<input type="text" id="post" name="post" size="5" value="${memberDto.post}"/>
											<label for="addr1">도로명</label>
										<input type="text"	id="addr1" name="addr1" size="40" value="${memberDto.addr1}"/>
										<span id="guide" style="color:#999; display:none"></span>
											<label for="addr2">상세</label>
										<input type="text"	id="addr2" name="addr2" size="20" value="${memberDto.addr2}"/>
										<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
									</div>
								</div>
								<!-- 수정 버튼 -->
								<div class="col-lg-12 col-md-12 col-sm-12">
									<div class="checkout__form__input">
										<input type="button" value="배송지 수정하기" style="width: 100%; text-align: center;" id="registerId" onClick="checkModifyDelivery();"/>
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
<script>
	function checkModifyDelivery() {
		
	var isSubmit	= true;
	var frmMain		= document.getElementById("frmMain");
	
		if (document.getElementById("post").value == ""
				|| document.getElementById("addr1").value == ""
				|| document.getElementById("addr2").value == "") {
			alert("필수 항목을 입력하세요!");
			isSubmit = false;
		}
		if (isSubmit) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.action = "/front/member/writeProcDelivery.web";
			frmMain.submit();
		}
	}
	
	$(document).ready(function() {
		
		$('.delivery_checkbox').on('change', function() {
			
			if ($(this).is(':checked')) {
				
				var $checkbox = $(this);
				
				$.ajax({
					type: "POST",
					url: "/front/member/deliveryDefaultCheck.json",
					dataType: "json",
					contentType: "application/json; charset=UTF-8",
					success: function(res) {
						
						if (res.check) {
							
							alert("이미 기본 배송지로 설정된 주소가 있습니다.");
							$checkbox.prop('checked', false);
						} else {
							
							alert("기본 배송지로 설정되었습니다.");
						}
					},
				});
			}
		});
	});
</script>
</form>
</body>
</html>