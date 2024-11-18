<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/basket/index.jsp" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
		function goTypeTx(value) {
			
			var first_cd_ctgDesktop		= document.getElementById("first_cd_ctg").value;
			var second_cd_ctgDesktop	= document.getElementById("second_cd_ctg").value;
			
			var first_cd_ctgAndroid		= document.getElementById("first_cd_ctg_android").value;
			var second_cd_ctgAndroid	= document.getElementById("second_cd_ctg_android").value;
			
			var first_cd_ctg;
			var second_cd_ctg
			
			if (value == 'pc') {
				
				first_cd_ctg	= 	first_cd_ctgDesktop
				second_cd_ctg	= 	second_cd_ctgDesktop
			}
			else if (value == 'mobile') {	
				first_cd_ctg	= 	first_cd_ctgAndroid
				second_cd_ctg	= 	second_cd_ctgAndroid
			}	
			
			var searchWordDesktop = document.getElementById("_searchWord_desktop").value;
			var searchWordAndroid = document.getElementById("_searchWord_android").value;
			
			var _searchWord;
			
			if (value == 'pc') {
				_searchWord = searchWordDesktop;
			}
			else if (value == 'mobile') {
				_searchWord = searchWordAndroid;
			}
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.cd_ctg_b.setAttribute("value", first_cd_ctg);
			frmMain.cd_ctg_m.setAttribute("value", second_cd_ctg);
			frmMain.searchWord.setAttribute("value", _searchWord);
			
			frmMain.type.setAttribute("value", value);
			frmMain.action = "/front/sale/total_list.web";
			frmMain.submit();
		}
		
		function goTypeT(value, value2, value3, value4, value5) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("currentPage").value = "1";
			frmMain.type.setAttribute("value", value);
			frmMain.filter.setAttribute("value", value2);
			frmMain.corp_nm.setAttribute("value", value3);
			frmMain.prd_type.setAttribute("value", value4);
			frmMain.cd_ctg_m.setAttribute("value", value5);
			
			frmMain.action = "/front/sale/total_list.web";
			frmMain.submit();
		}
		
		function goTypeF(value, value2, value3, value4, value5) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("currentPage").value = "1";
			frmMain.type.setAttribute("value", value);
			frmMain.filter.setAttribute("value", value2);
			frmMain.corp_nm.setAttribute("value", value3);
			frmMain.prd_type.setAttribute("value", value4);
			frmMain.cd_ctg_m.setAttribute("value", value5);
			
			frmMain.action = "/front/sale/function_list.web";
			frmMain.submit();
		}
		
		function goTypeI(value, value2, value3, value4, value5) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("currentPage").value = "1";
			frmMain.type.setAttribute("value", value);
			frmMain.filter.setAttribute("value", value2);
			frmMain.corp_nm.setAttribute("value", value3);
			frmMain.prd_type.setAttribute("value", value4);
			frmMain.cd_ctg_m.setAttribute("value", value5);
			
			frmMain.action = "/front/sale/ingredient_list.web";
			frmMain.submit();
		}
		
		function goTypeG(value, value2, value3, value4, value5) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("currentPage").value = "1";
			frmMain.type.setAttribute("value", value);
			frmMain.filter.setAttribute("value", value2);
			frmMain.corp_nm.setAttribute("value", value3);
			frmMain.prd_type.setAttribute("value", value4);
			frmMain.cd_ctg_m.setAttribute("value", value5);
			
			frmMain.action = "/front/sale/gender_list.web";
			frmMain.submit();
		}
		
		function goWriteForm(value, value2, value3) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.seq_sle.setAttribute("value", value);
			frmMain.cd_ctg_m.setAttribute("value", value2);
			frmMain.cd_ctg_b.setAttribute("value", value3);
			frmMain.action="/front/buy/writeForm.web";
			frmMain.submit();
		}
		
		function checkOut() {
			
			var checkboxes = document.querySelectorAll('.selectItem');
			
			if (checkboxes.length === 0) {
				
				alert('장바구니에 담긴 상품이 없습니다.');
				return;
			}
			
			var selectedCount = 0;
			
			checkboxes.forEach((checkbox, index) => {
				
				var row = checkbox.closest('tr');
				
				if (checkbox.checked) {
					
					selectedCount++;
					
					row.querySelector('input[name*=".count"]').disabled = false;
				} else {
					
					row.querySelector('input[name*=".count"]').disabled = true;
				}
			});
			
			if (selectedCount === 0) {
				
				alert('주문할 상품을 선택하세요.');
				
				checkboxes.forEach((checkbox) => {
					
					checkbox.closest('tr').querySelector('input[name*=".count"]').disabled = false;
				});
				return;
			}
			
			var frmMain = document.getElementById('frmMain');
			frmMain.action = "/front/pay/index.web";
			frmMain.submit();
		}
		
		function toTalcheckOut() {
			
			var checkboxes = document.querySelectorAll('.selectItem');
			
			if (checkboxes.length === 0) {
				
				alert('장바구니에 담긴 상품이 없습니다.');
				restoreInputs();
				return;
			}
			
			checkboxes.forEach((checkbox) => {
				
				checkbox.checked = true;
			});
			
			document.querySelectorAll('tbody tr input').forEach((input) => {
				
				input.disabled = false;
			});
			
			updateTotal();
			
			const frmMain = document.getElementById('frmMain');
			frmMain.action = "/front/pay/index.web";
			frmMain.submit();
		}
		
		function remove() {
			var checkboxes = document.querySelectorAll('.selectItem');
			
			if (checkboxes.length === 0) {
				alert('장바구니에 담긴 상품이 없습니다.');
				restoreInputs();
				return;
			}
			
			var selectedCount = 0;
			var selectedItems = [];
			var rowsToRemove = [];
			
			checkboxes.forEach((checkbox) => {
				const row = checkbox.closest('tr');
				const inputs = row.querySelectorAll('input');
				
				if (checkbox.checked) {
					selectedCount++;
					var seqSle = row.querySelector('input[name*=".seq_sle"]').value;
					
					selectedItems.push({ seq_sle: seqSle });
					rowsToRemove.push(row);
					
					inputs.forEach((input) => {
						input.disabled = false;
					});
				} else {
					inputs.forEach((input) => {
						input.disabled = true;
					});
				}
			});
			
			if (selectedCount === 0) {
				alert('삭제할 상품을 선택하세요.');
				restoreInputs();
				return;
			}
			
			var myData = { items: selectedItems };
			
			$.ajax({
				type: 'POST',
				url: '/front/basket/remove.json',
				data: JSON.stringify(myData),
				contentType: 'application/json; charset=UTF-8',
				
				beforeSend: function () {
					$('#loadingSpinner').fadeIn(200);
				},
				success: function (response) {
					alert('선택된 상품이 삭제되었습니다.');
					
					rowsToRemove.forEach((row) => row.remove());
					restoreInputs();
					updateTotal();
					
					if ($('tbody tr').length === 0) {
						$('tbody').html(`
							<tr style="text-align: center; border-bottom: 1px solid #707070;">
								<td colspan="7">장바구니에 상품이 없습니다</td>
							</tr>
						`);
					}
				},
				error: function (error) {
					alert('상품 삭제 중 오류가 발생했습니다.');
				},
				complete: function () {
					$('#loadingSpinner').fadeOut(200);
				},
			});
		}
		
		function restoreInputs() {
			
			var inputs = document.querySelectorAll('tbody tr[data-seq-sle] input');
			
			inputs.forEach((input) => {
				input.disabled = false;
			});
		}
	</script>

	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>

<body>
<form id="frmMain" method="POST">
<input type="hidden" name="seq_sle"			id="seq_sle"		value="0"/>
<input type="hidden" name="cd_ctg_m"		id="cd_ctg_m"/>
<input type="hidden" name="cd_ctg_b"		id="cd_ctg_b"/>
<input type="hidden" name="corp_nm"			id="corp_nm"/>
<input type="hidden" name="prd_type"		id="prd_type"/>
<input type="hidden" name="filter"			id="filter"/>
<input type="hidden" name="type"			id="type"/>
<input type="hidden" name="searchWord"		id="searchWord"		value="${paging.searchWord}"/>
<input type="hidden" name="currentPage"		id="currentPage"	value="${paging.currentPage}"/>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->

	<!-- Shop Cart Section Begin -->
	<section class="shop-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h6 class="lowgnb-title" style="padding-bottom: 20px; text-align: left; font-size: 24px;">장바구니</h6>
					<h6 class="cart-title">*이미지를 클릭하면 상품으로 이동합니다</h6>
						<div class="shop__cart__table" style="border: 1px solid #dbdbdb; border-radius: 4px;">
							<table id="productBasket" class="cart-table">
								<thead style="border-bottom: 1px solid #dbdbdb !important;">
									<tr style="border-color: #707070 !important;">
										<th class="cart-th" style="width: 5%"><input type="checkbox" id="selectAll" checked/></th>
										<th class="cart-th" colspan="2">상품정보</th>
										<th class="cart-th" style="width: 15%">수량</th>
										<th class="cart-th" style="width: 10%">상품금액</th>
										<th class="cart-th" style="width: 10%">개별포인트</th>
										<th class="cart-th" style="width: 10%">합계포인트</th>
										<th class="cart-th" style="width: 10%">합계금액</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${empty list}">
										<tr style="text-align: center; border-bottom: 1px solid #707070;">
											<td colspan="7">장바구니에 상품이 없습니다</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="list" items="${list}" varStatus="status">
											<tr style="border: 0;" data-seq-sle="${list.seq_sle}">
												<td class="cart-td">
													<input style="background: white !important;" type="checkbox" class="selectItem" checked/>
												</td>
												<td class="cart-td" style="text-align: center; vertical-align: middle;">
													<input type="hidden" name="buyList[${status.index}].seq_sle" value="${list.seq_sle}" />
													<input type="hidden" name="buyList[${status.index}].cd_ctg_b" value="${list.cd_ctg_b}" />
													<input type="hidden" name="buyList[${status.index}].cd_ctg_m" value="${list.cd_ctg_m}" />
													<div class="cart-div" style="width: 80px; height: 80px; overflow: hidden; display: inline-block;">
														<a href="javascript:goWriteForm('${list.seq_sle}', '${list.cd_ctg_m}', '${list.cd_ctg_b}');">
															<img class="cart-img" src="/img/product/${list.img}" class="cart-img">
														</a>
													</div>
												</td>
												<td class="cart-td" style="white-space: normal !important; text-align: left !important;">
													${list.sle_nm}
													<input type="hidden" name="buyList[${status.index}].sle_nm" value="${list.sle_nm}">
												</td>
												<td class="cart-td">
													<div class="pro-qty" style="border: 1.5px solid #c4cdd5; background: white !important;">
														<input style="background: white !important;" type="text" class="quantityCart" name="buyList[${status.index}].count" value="${list.count}">
													</div>
												</td>
												<td class="cart-td">
													<div>
														<span><fmt:formatNumber value="${list.price}" type="number" />원</span>
														<input type="hidden" name="buyList[${status.index}].price" value="${list.price}">
													</div>
													<c:if test="${list.discount != null && list.discount != 0}">
													<div>
														<span class="discount-rate">${list.discount}% 할인</span> <span style="font-family: Dotum, \\B3CB\C6C0, sans-serif !important; font-size: 13px !important; text-decoration: line-through !important; color: #b1b0b0 !important;"><fmt:formatNumber value="${list.price_sale}" type="number" /></span>
													</div>
													</c:if>
												</td>
												<td class="cart-td">
													<div>
														<span style="color: #346aff !important;"><fmt:formatNumber value="${list.point_value}" type="number" /></span> 포인트
														<input type="hidden" name="buyList[${status.index}].point" value="${list.point_value}">
													</div>
													<c:if test="${list.point_stack != null && list.point_stack != 0}">
													<div style="padding-top: 1px !important; margin-bottom: 1px !important;">
														<span class="discount-rate" style="background: #346aff !important;">${list.point_stack}% 적립</span>
													</div>
													</c:if>
												</td>
												<td class="cart-td" data-total-point="${list.total_point}">
													<span class="totalPointDisplay" style="color: #346aff !important; font-size: 13px !important; font-weight: bold !important;">${list.format_total_point}</span> 포인트
													<input type="hidden" name="buyList[${status.index}].total_point_sum" value="${list.total_point}">
												</td>
												<td class="cart-td" style="font-size: 16px !important; color: #707070 !important; font-weight: bold;" data-total-price="${list.total_price}">
													<span class="totalPriceDisplay" style="font-size: 16px !important; color: #707070 !important; font-weight: bold;">
														${list.format_total_price}원
														<input type="hidden" name="buyList[${status.index}].total_price_sum" value="${list.total_price}">
													</span>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6" style="border-bottom: none;">
					<div class="cart__btn">
						<a href="/">◃ 쇼핑 계속하기</a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6" style="max-width: 100% !important; flex: 0 0 100% !important; border-bottom: none;">
					<div class="cart__total__procced" style="text-align: right;">
						<p style="margin-top: 15px;">
							<span style="font-size: 16px;">총 <strong id="totalItems" style="font-size: 20px;"></strong>개의 상품금액 
							<strong id="totalPrice" style="font-size: 20px;"></strong>원
							<img src="/img/cartbtn/total.png" style="padding-left: 10px; padding-right: 10px; vertical-align: -4px;">
							<strong id="totalPriceFinal" style="font-size: 20px;"></strong>원
							</span>
						</p>
						<p>
							<span style="font-size: 14px; color: #ff4c2e;">적립 포인트 : </span><span id="totalPoints" style="font-size: 14px; color: #ff4c2e;"></span>
						</p>
					</div>
					<div style="display: flex; justify-content: flex-end;">
						<div>
							<a href="javascript:remove()" class="cart-btn" style="background: white; color: #2c2c2c; border: 1px solid #2c2c2c;">선택 상품 삭제</a>
							<a href="javascript:checkOut()" class="cart-btn" style="background: white; color: #2c2c2c; border: 1px solid #2c2c2c;">선택 상품 주문</a>
							<a href="javascript:toTalcheckOut();" class="cart-btn" style="background: #2c2c2c; color: white !important; border: 1px solid #2c2c2c;">전체 상품 주문</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<div id="loadingSpinner" style=" display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999;">
	<img src="https://i.gifer.com/ZZ5H.gif" alt="Loading..." style="width: 50px; height: 50px;">
</div>
	<!-- Shop Cart Section End -->

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
	document.addEventListener('DOMContentLoaded', function () {
		
		var selectAllCheckbox = document.getElementById('selectAll');
		var itemCheckboxes = document.querySelectorAll('.selectItem');
		
		selectAllCheckbox.addEventListener('change', function (e) {
			
			itemCheckboxes.forEach(function (checkbox) {
				checkbox.checked = e.target.checked;
			});
			updateTotal();
		});
		
		itemCheckboxes.forEach(function (checkbox) {
			
			checkbox.addEventListener('change', updateTotal);
		});
	
		updateTotal();
	});
	
	function updateTotal() {
		
		var totalPrice = 0;
		var totalPoints = 0;
		var totalItems = 0;
		
		document.querySelectorAll('.selectItem:checked').forEach(function (checkbox) {
			
			var row = checkbox.closest('tr');
			
			var priceElement = row.querySelector('td[data-total-price]');
			var pointElement = row.querySelector('td[data-total-point]');
			
			var itemPrice = parseInt(priceElement.getAttribute('data-total-price')) || 0;
			var itemPoints = parseInt(pointElement.getAttribute('data-total-point')) || 0;
			
			totalPrice += itemPrice;
			totalPoints += itemPoints;
			totalItems++;
		});
		
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
		document.getElementById('totalPriceFinal').innerText = totalPrice.toLocaleString();
		document.getElementById('totalPoints').innerText = totalPoints.toLocaleString();
		document.getElementById('totalItems').innerText = totalItems;
	}
	
	$(document).ready(function () {
		
		$('.dec.qtybtn').off('click');
		$('.inc.qtybtn').off('click');
		
		$('.dec.qtybtn').on('click', function () {
			
			var parentRow = $(this).closest('tr');
			var seq_sle = parentRow.data('seq-sle');
			var currentValue = parseInt(parentRow.find('.quantityCart').val());
			
			if (currentValue > 1) {
				
				parentRow.find('.quantityCart').val(currentValue);
				
				var newValue = currentValue - 1;
				
				sendValueToServer(newValue, seq_sle);
			}
		});
		
		$('.inc.qtybtn').on('click', function () {
			
			var parentRow = $(this).closest('tr');
			var seq_sle = parentRow.data('seq-sle');
			var currentValue = parseInt(parentRow.find('.quantityCart').val());
			
			parentRow.find('.quantityCart').val(currentValue);
			
			var newValue = currentValue + 1;
			
			sendValueToServer(newValue, seq_sle);
		});
		
		$('.quantityCart').off('keypress').on('keypress', function (e) {
			
			if (e.which == 13) {
				
				e.preventDefault();
				
				var parentRow = $(this).closest('tr');
				var seq_sle = parentRow.data('seq-sle');
				var newValue = parseInt($(this).val());
				
				if (!isNaN(newValue) && newValue >= 1) {
				
					sendValueToServer(newValue, seq_sle);
					console.log(`수량 변경: ${newValue}, 상품 번호: ${seq_sle}`);
				} else {
					
					alert('유효한 수량을 입력하세요.');
					$(this).val(1);
				}
			}
		});
		
		function sendValueToServer(value, seq_sle) {
			
			var myData = { count: value, seq_sle: seq_sle };
			
			$.ajax({
				type: "POST",
				url: "/front/basket/basketCount.json",
				dataType: "json",
				contentType: "application/json; charset=UTF-8",
				data: JSON.stringify(myData),
				success: function (res) {
					
					var resArray = Array.isArray(res) ? res : [res];
					
					resArray.forEach((item) => {
						
						var row = $('tr[data-seq-sle="' + item.seq_sle + '"]');
						if (row.length) {
							
							row.find('input[name*=".count"]').val(item.count);
							
							var formattedPrice = new Intl.NumberFormat().format(item.total_price) + "원";
							var formattedPoint = new Intl.NumberFormat().format(item.total_point);
							
							row.find('td[data-total-price] span.totalPriceDisplay').text(formattedPrice);
							row.find('td[data-total-point] span.totalPointDisplay').text(formattedPoint);
							
							row.find('td[data-total-price]').attr('data-total-price', item.total_price);
							row.find('td[data-total-point]').attr('data-total-point', item.total_point);
						}
					});
					updateTotal();
				},
			});
		}
	});
</script>
</form>
</body>
</html>