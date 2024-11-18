<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/member/modifyDelivery.jsp" %>
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
	
	function writeFormDelivery(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("seq_mbr_addr").value = value;
		
		frmMain.action = "/front/member/writeFormDelivery.web";
		frmMain.submit();
	}
	
	function deleteDelivery(value) {
		
		var frmMain = document.getElementById("frmMain");
		var targetTr = document.querySelector('.addrTarget[data-seq-mbr-addr="' + value + '"]');
		var myData = { seq_mbr_addr: value };
		
		$.ajax({
			type: "POST",
			url: "/front/member/deliveryDelCheck.json",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(myData),
			success: function(res) {
				
				if (res.check) {
					
					alert("기본 배송지는 삭제할 수 없습니다.");
				} else {
					
					$.ajax({
						type: "POST",
						url: "/front/member/deliveryDelete.json",
						data: JSON.stringify(myData),
						contentType: "application/json; charset=UTF-8",
						beforeSend: function () {
							$('#loadingSpinner').fadeIn(200);
						},
						success: function(res) {
							
							if (res.status === "success") {
								
								targetTr.remove();
								
								if (document.querySelectorAll('.addrTarget').length === 0) {
									
									var shopCartTable = document.querySelector('.addrTbody');
									
									if (shopCartTable) {
										
										shopCartTable.innerHTML = 
											'<tr>' +
											'<td colspan="4" class="health-body" style="text-align: center !important; line-height: 100px !important;">' +
												'등록된 배송지가 없습니다.' +
											'</td>' +
											'</tr>';
									}
								}
							}
						},
						complete: function () {
							$('#loadingSpinner').fadeOut(200);
						}
					});
				}
			}
		});
	}
	</script>
</head>
<body>
<form id="frmMain" method="POST" class="checkout__form">
<input type="hidden" name="cd_bbs_type"			id="cd_bbs_type"		value="0"/>
<input type="hidden" name="type"				id="type"/>
<input type="hidden" name="searchWord"			id="searchWord"/>
<input type="hidden" name="cd_ctg_m"			id="cd_ctg_m"/>
<input type="hidden" name="cd_ctg_b"			id="cd_ctg_b"/>
<input type="hidden" name="seq_mbr_addr"		id="seq_mbr_addr"		value="0"/>
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
									<h5 style="font-size :30px; border-bottom: 0px !important;">배송지 관리</h5>
									<h6 class="cart-title" style="font-size: 16px !important;">*배송지는 최대 3개까지 등록할 수 있습니다.</h6>
									<div class="shop__cart__table">
										<table class="cart-table" style="border-bottom: 1px solid #818181; border-top: 1px solid #818181;">
											<thead>
												<tr>
													<th class="health-head" style="width:10% !important; background: #F6F6F6 !important; border-bottom: 1px solid #e0e0e0 !important;">주소</th>
													<th class="health-head" style="background: #F6F6F6 !important; border-bottom: 1px solid #e0e0e0 !important;">도로명</th>
													<th class="health-head" style="width:13% !important; background: #F6F6F6 !important; border-bottom: 1px solid #e0e0e0 !important;">상세</th>
													<th class="health-head" style="width:28% !important; background: #F6F6F6 !important; border-bottom: 1px solid #e0e0e0 !important;">등록일</th>
												</tr>
											</thead>
											<tbody id="dataBody" class="addrTbody">
												<c:choose>
													<c:when test="${empty list}">
														<tr>
															<td colspan="4" class="health-body" style="text-align: center !important; line-height: 100px !important;">
																등록된 배송지가 없습니다.
															</td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:forEach var="list" items="${list}">
															<tr class="addrTarget" data-seq-mbr-addr="${list.seq_mbr_addr}" style="border-bottom: 0px !important;">
															<td class="health-body" style="text-align: center !important; border-bottom: 0px !important;">
																${list.post}
															</td>
															<td class="health-body" style="text-align: center !important; border-bottom: 0px !important;">
															<c:if test="${list.flg_default == 'Y'}">
																<div style="display: flex; align-items: center;">${list.addr1}<span class="delivery_address" style="margin-top: 2.6px !important;">기본배송지</span></div>
															</c:if>
															<c:if test="${list.flg_default == 'N'}">
																<div style="display: flex; align-items: center;">${list.addr1}</div>
															</c:if>
															</td>
															<td class="health-body" style="text-align: center !important; border-bottom: 0px !important; padding-left: 0px !important; padding-right: 0px !important;">
																${list.addr2}
															</td>
															<td class="health-body" style="display: flex; align-items: center; justify-content: space-between; text-align: left; border-bottom: 0px !important;">
																<div>
																	${list.dt_reg}
																</div>
																<span style="white-space: nowrap;">
																	<a class="reviewBtn" style="font-size: 12px !important; font-weight: normal !important; border: 0px !important;" href="javascript:writeFormDelivery('${list.seq_mbr_addr}');">
																		수정
																	</a>
																	<a class="reviewBtn" style="font-size: 12px !important; font-weight: normal !important; border: 0px !important;" href="javascript:deleteDelivery('${list.seq_mbr_addr}');">
																		삭제
																	</a>
																</span>
															</td>
															</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</div>
									<div class="row">
										<!-- 주소 -->
										<div class="col-lg-12 col-md-6 col-sm-6">
											<div class="checkout__form__input">
											<p style="font-family: 'Noto Sans KR', sans-serif !important;">주소 <span>*</span></p>
												<input type="text" id="post" name="post" size="5"/>
													<label for="addr1">도로명</label>
												<input type="text"	id="addr1" name="addr1" size="40"/>
												<span id="guide" style="color:#999; display:none"></span>
													<label for="addr2">상세</label>
												<input type="text"	id="addr2" name="addr2" size="20" placeholder="상세 주소" />
												<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
											</div>
										</div>
										<!-- 수정 버튼 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<input type="button" value="배송지 추가하기" style="width: 100%; text-align: center;" id="registerId" onClick="checkModifyDelivery();"/>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<div id="loadingSpinner" style=" display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999;">
						<img src="https://i.gifer.com/ZZ5H.gif" alt="Loading..." style="width: 50px; height: 50px;">
					</div>
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
			
			$.ajax({
				type: "POST",
				url: "/front/member/deliveryCheck.json",
				dataType: "json",
				contentType: "application/json; charset=UTF-8",
				success: function(res) {
					
					if (res.check) {
						
						ModifyDeliveryProc();
					}
					else {
						
						alert("배송지는 3개까지 추가할 수 있습니다.");
					}
				},
			});
		}
	}
	
	function ModifyDeliveryProc() {
		
		var frmMain = document.getElementById("frmMain");
				
		frmMain.action = "/front/member/modifyDeliveryProc.web";
		frmMain.submit();
	}
</script>
</form>
</body>
</html>