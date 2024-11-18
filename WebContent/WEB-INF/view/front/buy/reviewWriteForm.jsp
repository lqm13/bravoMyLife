<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/reviewWriteForm.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
	function reviewWriteProc() {
		
		var frmMain = document.getElementById("frmMain");
		var rateStarHiddenInput = document.querySelector("input[id='rate_star_check']");
		var rateStarHiddenInputMain = document.querySelector("input[name='rate_star']");
		var rateStarValue = rateStarHiddenInput.value;
		
		if (!rateStarValue || rateStarValue === "") {
			alert("평점을 입력하세요.");
			return;
		}
		
		if (document.getElementById("rate_review").value == "") {
			alert("후기 내용을 입력하세요.");
			return;
		}
		
		frmMain.action = "/front/buy/reviewWriteProc.web";
		frmMain.submit();
	}
	
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/front/center/board/list.web";
		frmMain.submit();
	}
	
	function goReviewListPage() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/buy/reviewListPage.web";
		frmMain.submit();
	}
	</script>
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>
	
	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>
<body>
<form id="frmMain" method="POST" enctype="multipart/form-data">
<input type="hidden" name="rate_star" 		id="rate_star" value="0">
<input type="hidden" 						id="rate_star_check">
<input type="hidden" name="type"			id="type"/>
<input type="hidden" name="searchWord"		id="searchWord" />
<input type="hidden" name="cd_ctg_m"		id="cd_ctg_m"/>
<input type="hidden" name="cd_ctg_b"		id="cd_ctg_b"/>
<input type="hidden" name="cd_bbs_type"		id="cd_bbs_type"/>
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
	<section class="checkout spad">
		<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12" >
						<div class="review-form" style="height: 100% !important; display: flex; flex-direction: column;">
							<input type="hidden" name="seq_sle"				id="seq_sle"		value="${saleDto.seq_sle}"/>
							<input type="hidden" name="seq_buy_dtl"			id="seq_buy_dtl"	value="${saleDto.seq_buy_dtl}"/>
							<div class="review-title" style="border-bottom: 0px !important; border-top: 0px !important; padding-bottom: 25px !important">
								<div>
									<img src="/img/review/review.png" style="height: 26px !important;"><span class="reviewtitle">상품 후기</span>
								</div>
								<div>
									<span class="reviewsub">이 상품에 대해서 얼마나 만족하시나요?</span>
								</div>
							</div>
							<div class="review-name" style="border-bottom: 0px !important;">
								<div class="photoreview" style="padding: 20px 10px !important;">
									<img src="/img/product/${saleDto.img}" style="height: 100px !important; ">
								</div>
								<div class="product-name" style="flex-grow: 1; padding-right: 0px !important">
									<div class="product-name" style="padding: 0px !important; font-weight: bold !important;">
										${saleDto.sle_nm}, ${saleDto.count}개
									</div>
									<div class="product-name" style="padding: 0px !important;">
										<div class="rating">
											<i class="fa fa-star-large" style="color: #e0e0e0;" data-value="1"></i>
											<i class="fa fa-star-large" style="color: #e0e0e0;" data-value="2"></i>
											<i class="fa fa-star-large" style="color: #e0e0e0;" data-value="3"></i>
											<i class="fa fa-star-large" style="color: #e0e0e0;" data-value="4"></i>
											<i class="fa fa-star-large" style="color: #e0e0e0;" data-value="5"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="review-name" style="border-bottom: 0px !important;">
								<div class="photoreview" style="display: flex !important; justify-content: flex-start !important; align-items: center !important;">
									사진첨부
								</div>
							<div class="product-name" style="padding-right: 0px !important">
								<div style="display: flex; align-items: center; height: 100px;">
									<div id="file-inputs" style="display: flex; align-items: center;">
										<div id="file-inputs" style="display: flex; align-items: center;">
											<div id="file-inputs-0" style="position: relative; display: flex; flex-direction: column; margin-right: 20px; align-items: center;">
												<div class="img-container" id="img-container-0" style="width: 70px; height: 80px; background-color: #f0f0f0; display: flex; align-items: center; justify-content: center; cursor: pointer;">
													<span class="upload-text" id="upload-text-0" style="color: #666;">사진 첨부</span>
													<img id="img-preview-0" style="display: none; width: 100%; height: 100%; object-fit: cover;"/>
												</div>
												<input type="file" id="file-input-0" style="display: none;" name="files[0]"/>
												<button type="button" id="delete-btn-0" style="background-color: transparent; border: none; font-size: 16px; color: #666666; cursor: pointer;">&times;</button>
											</div>
										</div>
										<div id="file-inputs" style="display: flex; align-items: center;">
											<div id="file-inputs-1" style="position: relative; display: flex; flex-direction: column; margin-right: 20px; align-items: center;">
												<div class="img-container" id="img-container-1" style="width: 70px; height: 80px; background-color: #f0f0f0; display: flex; align-items: center; justify-content: center; cursor: pointer;">
													<span class="upload-text" id="upload-text-1" style="color: #666;">사진 첨부</span>
													<img id="img-preview-1" style="display: none; width: 100%; height: 100%; object-fit: cover;"/>
												</div>
												<input type="file" id="file-input-1" style="display: none;" name="files[1]"/>
												<button type="button" id="delete-btn-1" style="background-color: transparent; border: none; font-size: 16px; color: #666666; cursor: pointer;">&times;</button>
											</div>
										</div>
										<div id="file-inputs" style="display: flex; align-items: center;">
											<div id="file-inputs-2" style="position: relative; display: flex; flex-direction: column; margin-right: 20px; align-items: center;">
												<div class="img-container" id="img-container-2" style="width: 70px; height: 80px; background-color: #f0f0f0; display: flex; align-items: center; justify-content: center; cursor: pointer;">
													<span class="upload-text" id="upload-text-2" style="color: #666;">사진 첨부</span>
													<img id="img-preview-2" style="display: none; width: 100%; height: 100%; object-fit: cover;"/>
												</div>
												<input type="file" id="file-input-2" style="display: none;" name="files[2]"/>
												<button type="button" id="delete-btn-2" style="background-color: transparent; border: none; font-size: 16px; color: #666666; cursor: pointer;">&times;</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							</div>
							<div class="review-name" style="border-bottom: 0px !important; height: auto !important; flex-grow: 2 !important; min-height: 250px !important;">
								<div class="photoreview">
									상세후기
								</div>
								<div class="product-name" style="display: flex; justify-content: center; align-items: center; height: 100% !important; padding: 20px 0px 20px 20px !important;">
									<div style="height: 100% !important; display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start; width: 100%;">
										<textarea id="rate_review" name="rate_review" class="review-text" placeholder="다른 고객님께 도움이 되도록 후기를 남겨주세요."></textarea>
										<div style="display: flex; justify-content: flex-end; gap: 10px; margin-top: 10px; width: 100%;">
											<a href="javascript:goReviewListPage();" class="cart-btn" style="background: #fff; color: #111 !important; border: 1px solid #ccc !important; margin: 0; padding: 10px 10px 10px !important;">
												취소하기
											</a>
											<a href="javascript:reviewWriteProc();" class="cart-btn" style="background: #346aff; color: white !important; border: 1px solid #346aff !important; margin: 0 ; padding: 10px 10px 10px !important;">
												등록하기
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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
		
		var stars = document.querySelectorAll('.fa-star-large');
		var rateStarHiddenInputMain = document.querySelector("input[name='rate_star']");
		var rateStarHiddenInput = document.querySelector("input[id='rate_star_check']");
		
		stars.forEach(star => {
			
			star.addEventListener('click', function() {
				
				var value = this.getAttribute('data-value');
				
				
				stars.forEach(s => {
					
					if (s.getAttribute('data-value') <= value) {
						
						s.style.setProperty('color', 'gold', 'important');
					} else {
						
						s.style.setProperty('color', '#e0e0e0', 'important');
					}
				});
				
				rateStarHiddenInput.value = value;
				rateStarHiddenInputMain.value = value;
			});
		});
	});
	
	$(document).ready(function() {
		
		$('img[id^="img-preview"]').each(function() {
			
			var src = $(this).attr('src');
			var inputId = $(this).attr('id').split('-')[2];
			if (src && src.trim() !== '') {
				
				$(this).show();
				$('#upload-text-' + inputId).hide();
			}
		});
		var uploadIndex = 0;
		var deleteIndex = 0;
		
		$('input[type="file"], input[name^="flg_del"], input[name^="review_imgs"], input[name^="review_imgIn"]').prop('disabled', true);
		$('div[id^="img-container"]').click(function() {
			
			var imgId = $(this).attr('id').split('-')[2];
			var fileInput = $('#file-input-' + imgId);
			
			fileInput.prop('disabled', false);
			fileInput.val('');
			fileInput.trigger('click');
		});
		$('input[type="file"]').change(function() {
			
			var inputId = $(this).attr('id').split('-')[2];
			var file = this.files[0];
			
			if (file) {
				
				var reader = new FileReader();
				
				reader.onload = function(e) {
					
					$('#img-preview-' + inputId).attr('src', e.target.result).show();
					$('#upload-text-' + inputId).hide();
				}
				reader.readAsDataURL(file);
				reindexFileInputs();
			}
		});
		$('button[id^="delete-btn"]').click(function() {
			
			var btnId = $(this).attr('id').split('-')[2];
			
			$('#img-preview-' + btnId).hide();
			$('#file-input-' + btnId).val('').hide();
			$('#upload-text-' + btnId).show();
			$('#file-input-' + btnId).prop('disabled', true);
			$('#review_imgIn-' + btnId).prop('disabled', true);
			$('#flg_del-' + btnId).prop('disabled', true);
			
			reindexFileInputs();
		});
		function reindexFileInputs() {
			
			var fileInputs = $('input[type="file"]');
			var newIndex = 0;
			
			fileInputs.each(function() {
				
				if ($(this).val() !== '') {
					
					$(this).attr('name', 'files[' + newIndex + ']');
					newIndex++;
				}
			});
		}
	});
</script>
</form>
</body>
</html>