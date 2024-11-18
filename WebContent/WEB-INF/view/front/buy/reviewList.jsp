<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/reviewList.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
<style>
.modal {
	display: none;
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.8);
	display: flex;
	align-items: center;
	justify-content: center;
}

.modal-content {
	margin: auto;
	display: block;
	 width: 100%;
	max-width: 700px;
	position: relative;
	max-height: 80%;
	object-fit: contain;
}

.close {
	position: absolute;
	top: -10px;
	right: -10px;
	color: white;
	font-size: 35px;
	font-weight: bold;
	cursor: pointer;
	background-color: rgba(0, 0, 0, 0.5);
	padding: 5px 10px;
	border-radius: 50%;
}

@media only screen and (max-width: 700px) {
	.modal-content {
		width: 100%;
		max-height: 80%;
	}
}
</style>
	<%@ include file="/include/common/header.jsp" %>
	<script>
	
	function goWriteForm(value, value2, value3) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.cd_ctg_m.setAttribute("value", value2);
		frmMain.cd_ctg_b.setAttribute("value", value3);
		frmMain.action="/front/buy/writeForm.web";
		frmMain.submit();
	}
	
	function reviewWriteForm(value, value2, value3, value4) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.cd_ctg_m.setAttribute("value", value2);
		frmMain.cd_ctg_b.setAttribute("value", value3);
		frmMain.seq_buy_dtl.setAttribute("value", value4);
		frmMain.action="/front/buy/reviewWriteForm.web";
		frmMain.submit();
	}
	
	function reviewModifyForm(value, value2, value3, value4, value5) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.cd_ctg_m.setAttribute("value", value2);
		frmMain.cd_ctg_b.setAttribute("value", value3);
		frmMain.seq_buy_dtl.setAttribute("value", value4);
		frmMain.seq_review.setAttribute("value", value5);
		frmMain.action="/front/buy/reviewModifyForm.web";
		frmMain.submit();
	}
	
	function goPages(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.currentPage.setAttribute("value", value);
		frmMain.action="/front/buy/reviewListPage.web";
		frmMain.submit();
	}
	
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/front/center/board/list.web";
		frmMain.submit();
	}
	</script>
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>
	
	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" name="type"			id="type"/>
<input type="hidden" name="searchWord"		id="searchWord" />
<input type="hidden" name="cd_bbs_type"		id="cd_bbs_type" 	value="0"/>
<input type="hidden" name="seq_sle"			id="seq_sle"		value="0"/>
<input type="hidden" name="cd_ctg_m"		id="cd_ctg_m"/>
<input type="hidden" name="cd_ctg_b"		id="cd_ctg_b"/>
<input type="hidden" name="seq_buy_dtl"		id="seq_buy_dtl"	value="0"/>
<input type="hidden" name="seq_review"		id="seq_review"		value="0"/>
<input type="hidden" name="currentPage"		id="currentPage"	value="${paging.currentPage}"/>
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
	<section class="checkout spad" style="min-height: calc(100vh - 1px);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12" style="padding: 0;">
					<div class="product__details__tab" style="padding-left: 17px !important; padding-right: 17px !important; padding-top: 0px !important;">
						<ul class="nav nav-tabs" role="tablist" style="margin-bottom: 0px !important; border: 1px solid #d9d9d9 !important; display: flex !important; justify-content: space-between !important;">
							<li class="nav-item" style="background-color: #f9f9f9 !important; padding-top: 10px !important; padding-bottom: 10px !important; flex: 1 !important; text-align: center !important; align-items: center !important; justify-content: center !important; margin-right: 0px !important; border-right: 1px solid #d9d9d9 !important;">
								<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab" style="display: inline-block !important;">상품후기 작성(${count})</a>
							</li>
							<li class="nav-item" style="background-color: #f9f9f9 !important; padding-top: 10px !important; padding-bottom: 10px !important; flex: 1 !important; text-align: center !important; align-items: center !important; justify-content: center !important;">
								<a id="reviewTabLink" class="nav-link" data-toggle="tab" href="#tabs-3" role="tab" style="display: inline-block !important;">상품후기 목록(${reviwCount})</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<h6 class="cart-title" style="border-top: 1px solid #d9d9d9 !important; padding-top: 40px !important;  font-weight: normal !important; margin-bottom: 0px !important; ">*이미지를 클릭하면 상품으로 이동합니다</h6>
								<div class="review-form" style="border-radius: 5px !important; border-left: 1px solid #ddd !important; border-right: 1px solid #ddd !important; border-bottom: 1px solid #ddd !important">
									<c:choose>
										<c:when test="${empty list}">
											<div class="review-name" style="border-bottom: 0px !important; padding: 20px 20px 20px 30px !important; display: block !important; text-align: center; ">
												<p style="margin-bottom: 200px !important; margin-top: 200px !important; display: inline-block; text-align: center;">
													작성할 수 있는 상품후기가 없습니다.
												</p>
											</div>
										</c:when>
									<c:otherwise>
										<c:forEach var="list" items="${list}">
												<div class="review-name" style="border-top: 0px !important; padding: 20px 20px 20px 30px !important;">
													<div class="photoreview" style="padding: 0px !important;">
														<a href="javascript:goWriteForm('${list.seq_sle}', '${list.cd_ctg_m}', '${list.cd_ctg_b}');">
															<img src="/img/product/${list.img}" style="height: 100px !important;">
														</a>
													</div>
													<div class="product-name" style="flex-grow: 1; padding: 0px !important; display: flex; justify-content: space-between; align-items: center; margin-left: 20px !important; margin-right: 0px !important;">
														<div style="padding-right: 20px !important; display: flex; flex-direction: column; flex-grow: 1;">
															<div class="product-name" style="padding: 0px !important; font-weight: bold !important;">
																${list.sle_nm}
															</div>
															<div class="product-name" style="padding: 0px !important; font-size: 14px !important;">
																${list.sle_nm}, ${list.count}개
															</div>
															<div class="product-name" style="padding: 0px !important; color: #888 !important; font-size: 14px !important; margin-top: 25px !important; padding-bottom: 5px !important">
																${list.dt_reg}
															</div>
														</div>
														<div style="display: flex; justify-content: flex-end; align-items: center; gap: 10px; width: 25% !important; height: auto !important; flex-shrink: 0 !important; overflow: hidden !important;">
															<a href="javascript:reviewWriteForm('${list.seq_sle}', '${list.cd_ctg_m}', '${list.cd_ctg_b}', '${list.seq_buy_dtl}');" class="cart-btn" style="border-radius: 0px !important; background: white; color: #346aff !important; border: 1px solid #346aff !important; margin: 0; padding: 7px 7px 7px !important; text-align: center !important;">
																후기 작성하기
															</a>
														</div>
													</div>
												</div>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
							<h6 class="cart-title" style="border-top: 1px solid #d9d9d9 !important; padding-top: 40px !important;  font-weight: normal !important; margin-bottom: 0px !important; ">*상품명을 클릭하면 상품으로 이동합니다.</h6>
							<div class="review-formSub" style="border-radius: 5px !important; border-left: 1px solid #ddd !important; border-right: 1px solid #ddd !important; display: flex; flex-direction: column; border-bottom: 1px solid #ddd !important; width: 100% !important;">
								<c:choose>
									<c:when test="${empty reviewList}">
										<div class="review-name" style="border-bottom: 0px !important; border-top: 0px !important; padding: 20px 20px 20px 30px !important; display: block !important; text-align: center; ">
											<p style="margin-bottom: 200px !important; margin-top: 200px !important; display: inline-block; text-align: center;">
												등록된 상품후기가 없습니다.
											</p>
										</div>
									</c:when>
										<c:otherwise>
											<c:forEach var="review" items="${reviewList}">
											<div class="reviewTarget" data-seq-review="${review.seq_review}">
												<div class="review-title" style="border-top: 0px !important; border-bottom: 0px !important; padding-left: 0px !important; padding-top: 0px !important">
													
													<div class="review-name" style="border-top: 0px !important; padding: 10px 15px !important; border-top: 0px !important">
														<div class="photoreview" style="width: unset !important; display: inline-block; padding: 0 !important;">
															<a href="javascript:goWriteForm('${review.seq_sle}', '${review.cd_ctg_m}', '${review.cd_ctg_b}');">
																<img src="/img/product/${review.img}" style="width: 50px !important; height: 50px !important; vertical-align: middle !important;">
															</a>
														</div>
														<div class="product-name" style="flex-grow: 1; display: flex; justify-content: space-between; align-items: center; padding: 0px !important">
															<div style="padding-right: 20px !important; display: flex; flex-direction: column; flex-grow: 1;">
																<div class="product-name" style="margin-left: 20px !important; padding: 0px !important; font-weight: normal !important; font-size: 14px !important; color: #346aff !important;">
																	<a style="font-weight: normal !important; font-size: 14px !important; color: #346aff !important;" href="javascript:goWriteForm('${review.seq_sle}', '${review.cd_ctg_m}', '${review.cd_ctg_b}');">${review.sle_nm}</a>, ${review.count}개
																</div>
															</div>
															<div style="display: flex; justify-content: flex-end; align-items: center; gap: 10px; width: 25% !important; height: auto !important; flex-shrink: 0 !important; overflow: hidden !important;">
																<span>
																<a class="reviewBtn" href="javascript:reviewModifyForm('${review.seq_sle}', '${review.cd_ctg_m}', '${review.cd_ctg_b}', '${review.seq_buy_dtl}', '${review.seq_review}');">
																 수정
																</a>
																<a class="reviewBtn" href="javascript:reviewDelete('${review.seq_sle}', '${review.cd_ctg_m}', '${review.cd_ctg_b}', '${review.seq_buy_dtl}', '${review.seq_review}');">
																 삭제
																</a>
																</span>
															</div>
														</div>
													</div>
													<div style="padding: 10px 15px !important; margin-top: 10px !important">
														<div class="product-name" style="padding: 0px !important; display: flex; align-items: center;">
															<div class="rating" style="display: flex; align-items: center;">
																<c:if test="${review.mbr_rate_star == 1}">
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																</c:if>
																<c:if test="${review.mbr_rate_star == 2}">
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																</c:if>
																<c:if test="${review.mbr_rate_star == 3}">
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																</c:if>
																<c:if test="${review.mbr_rate_star == 4}">
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle" style="color: #e0e0e0;"></i>
																</c:if>
																<c:if test="${review.mbr_rate_star == 5}">
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																	<i class="fa fa-star-middle"></i>
																</c:if>
															</div>
															<div style="margin-left: 5px; display: flex;">
																<span class="reviewsub" style="font-family: Dotum, 돋움, Helvetica, AppleSDGothicNeo, Arial, sans-serif !important; padding-top: 5px; font-size: 12px !important; color: #888 !important;">
																	${review.dt_reg}
																</span>
															</div>
														</div>
													</div>
												</div>
												<div class="review-name" style="padding: 10px 15px !important; border-bottom: 0px !important; border-top: 0px !important;">
													<c:choose>
														<c:when test="${empty review.imgs}">
															<div class="photoreview" style="margin-right: 20px !important; display: inline-block; padding-bottom: 20px !important; padding-left: 0px !important; padding-top: 0px !important; width: auto !important;">
																<h6 class="cart-title" style="padding-bottom: 0px !important; margin-bottom: 0px !important; font-weight: normal !important;">*등록된 상품후기 이미지가 없습니다.</h6>
															</div>
														</c:when>
														<c:otherwise>
															<c:forEach var="imgs" items="${review.imgs}">
																<div class="photoreview" style="margin-right: 20px !important; display: inline-block; padding: 0px !important; width: auto !important;">
																	<img src="/img/review/${imgs.file_save}" class="img-thumbnail" style="padding: 0px !important; width: 70px; height: 80px; object-fit: cover;" />
																</div>
															</c:forEach>	
														</c:otherwise>
													</c:choose>
												</div>
													<div class="review-name" style="border-bottom: 1px solid #ddd !important; padding: 10px 15px 40px 15px !important; display: block !important; border-top: 0px !important;">
														<div class="reviewsub">
															${review.rate_review}
														</div>
													</div>
											</div>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</div>
								<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;">
									<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPages" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="imageModal" class="modal">
			<span class="close">&times;</span>
			<img class="modal-content" id="modalImage">
		</div>
		<div id="loadingSpinner" style=" display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999;">
			<img src="https://i.gifer.com/ZZ5H.gif" alt="Loading..." style="width: 50px; height: 50px;">
		</div>
		</section>
<!-- Checkout Section end -->

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
	$(document).ready(function() {
		
		var modal = $('#imageModal');
		var modalImg = $('#modalImage');
		
		$('.img-thumbnail').on('click', function() {
			
			var imgSrc = $(this).attr('src');
			modal.css('display', 'flex');
			modalImg.attr('src', imgSrc);
		});
		$('.close').on('click', function() {
			
			modal.css('display', 'none');
		});
		$(window).on('click', function(event) {
			
			if ($(event.target).is(modal)) {
				
				modal.css('display', 'none');
			}
		});
	});

	$(document).ready(function() {
		
		$('<style>.nav::before { display: none; }</style>').appendTo('head');
		$('<style>.nav::after { display: none; }</style>').appendTo('head');
	});
	
	document.addEventListener("DOMContentLoaded", function() {
		var activeNavLink = document.querySelector(".nav-link.active");
		if (activeNavLink) {
			
			activeNavLink.style.backgroundColor = "#f9f9f9";
		}
	});
	
	document.addEventListener("DOMContentLoaded", function() {
		
		var navLinks = document.querySelectorAll(".nav-link");
		var observer = new MutationObserver(function(mutations) {
			
			mutations.forEach(function(mutation) {
				if (mutation.type === "attributes" && mutation.attributeName === "class") {
					
					var target = mutation.target;
					
					if (target.classList.contains("active")) {
						
						target.style.backgroundColor = "#f9f9f9";
					} else {
						
						target.style.backgroundColor = "";
					}
				}
			});
		});
		navLinks.forEach(function(navLink) {
			
			observer.observe(navLink, { attributes: true });
		});
	});
	
	function reviewDelete(value, value2, value3, value4, value5) {
		
		var targetDiv = document.querySelector('.reviewTarget[data-seq-review="' + value5 + '"]');
		var myData = { seq_sle: value, cd_ctg_m: value2, cd_ctg_b: value3, seq_buy_dtl: value4, seq_review: value5 };
		
		$.ajax({
			type: 'POST',
			url: '/front/buy/reviewDelete.json',
			data: JSON.stringify(myData),
			contentType: 'application/json; charset=UTF-8',
			beforeSend: function () {
				$('#loadingSpinner').fadeIn(200);
			},
			success: function (response) {
				
				if (response.status === "success") {
					
					targetDiv.remove();
					
					if (document.querySelectorAll('.reviewTarget').length === 0) {
						
						var shopCartTable = document.querySelector('.review-formSub');
						if (shopCartTable) {
							shopCartTable.innerHTML = 
								'<div class="review-name" style="border-top: 1px solid #ddd !important; border-bottom: 0px !important; border-top: 0px !important; padding: 20px 20px 20px 30px !important; display: block !important; text-align: center;">' +
									'<p style="margin-bottom: 200px !important; margin-top: 200px !important; display: inline-block; text-align: center;">' +
										'등록된 상품후기가 없습니다.' +
									'</p>' +
								'</div>';
						}
					}
					
					var reviewCount = response.reviewCount;
					$('#reviewTabLink').text('상품후기 목록(' + reviewCount + ')');
					
				}
			},
			complete: function () {
				
				$('#loadingSpinner').fadeOut(200);
			}
		});
	}
</script>
</form>
</body>
</html>