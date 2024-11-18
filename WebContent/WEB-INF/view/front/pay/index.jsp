<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/pay/index.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">
<head>
	<%@ include file="/include/common/header.jsp" %>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
		<c:if test="${empty sessionScope.SEQ_MBR}">
		var isLogin = false;
		</c:if>
		
		<c:if test="${not empty sessionScope.SEQ_MBR}">
		var isLogin = true;
		</c:if>
	
		<c:if test="${flgMobile == 'Y'}">
			$(document).ready(function() {
				$("#btnPay").on("click", function() {
					
					if (!isLogin) {
						alert("로그인이 필요합니다!");
						return;
					}
					
					$.ajax({
						url: "/front/pay/payup/order.json",
						type: "POST",
						dataType: "json",
						data: $("#frmMain").serialize(),
						success: function(data) {
							$("input[name=ordr_idxx]").val(data.ordr_idxx);
							$("input[name=good_name]").val(data.good_name);
							$("input[name=good_mny]").val(data.good_mny);
							$("input[name=buyr_name]").val(data.buyr_name);
							$("input[name=site_cd]").val(data.site_cd);
							$("input[name=Ret_URL]").val(data.Ret_URL);
							$("input[name=approval_key]").val(data.approval_key);
							$("input[name=AppUrl]").val(data.AppUrl);
							
							document.form.submit();
						},
						error: function(data) {
							alert("[ERROR]결제 연동!");
						}
					});
				});
			});
		</c:if>
		
		<c:if test="${flgMobile != 'Y'}">
			$(document).ready(function() {
				$("#btnPay").on("click", function() {
					
					if (!isLogin) {
						alert("로그인이 필요합니다!");
						return;
					}
					
					$.ajax({
						url: "/front/pay/payup/order.json",
						type: "POST",
						dataType: "json",
						data: $("#frmMain").serialize(),
						success: function(data) {
							//console.log(data);
							$("input[name=ordr_idxx]").val(data.ordr_idxx);
							$("input[name=good_name]").val(data.good_name);
							$("input[name=good_mny]").val(data.good_mny);
							$("input[name=buyr_name]").val(data.buyr_name);
							$("input[name=site_cd]").val(data.site_cd);
							
							jsf__pay();
						},
						error: function(data) {
							alert("[ERROR]결제 연동!");
						}
					});
				});
			});
		</c:if>
	
	function goTypeT(value, value2, value3, value4, value5) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = "1";
		frmMain.type.setAttribute("value", value);
		frmMain.filter.setAttribute("value", value2);
		frmMain.corp_nm.setAttribute("value", value3);
		frmMain.prd_type.setAttribute("value", value4);
		frmMain.cd_ctg_m.setAttribute("value", value5);
		
		frmMain.action = "/front/sale/total_list.web";
		frmMain.target = "";
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
		frmMain.target = "";
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
		frmMain.target = "";
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
		frmMain.target = "";
		frmMain.submit();
	}

	function writeProc() {
		
		var frmMain = document.getElementById("frmMain");
		frmMain.action = "/front/buy/writeProc.web";
		frmMain.submit();
	}
	
	function checkMaxLength() {
		
		var input = document.getElementById("delivery_request");
		var maxLength = 50;
		
		var currentLength = input.value.length;
		
		if (currentLength > maxLength) {
			
			alert("최대 50글자까지 입력할 수 있습니다.");
			input.value = input.value.substring(0, maxLength);
		}
	}
	</script>
</head>
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>


<body>
<form id="frmMain" method="POST">
<input type="hidden" id="item" name="item" />
<input type="hidden" name="seq_sle"			id="seq_sle"		value="0"/>
<input type="hidden" name="cd_ctg_m"		id="cd_ctg_m"/>
<input type="hidden" name="cd_ctg_b"		id="cd_ctg_b"/>
<input type="hidden" name="corp_nm"			id="corp_nm"/>
<input type="hidden" name="prd_type"		id="prd_type"/>
<input type="hidden" name="filter"			id="filter"/>
<input type="hidden" name="type"			id="type"/>
<input type="hidden" name="currentPage"		id="currentPage"	value="0"/>
	
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->

	<section class="checkout spad">
		<div class="container">
			<div class="col-lg-12">
				<h6 class="customer-main">주문/결제</h6>
			</div>
			<div class="col-lg-8" style="max-width: 100%;">
				<h5 class="customer-title">구매자정보</h5>
					<div class="shop__cart__table">
						<table class="customer-table">
							<tbody>
							<tr style="border: 0;">
								<td class="customer-td1">이름</td>
								<td class="customer-td2"><div style="display: flex; align-items: center;">${memberDto.mbr_nm} <span class="delivery_address">기본 배송정보</span></div></td>
							</tr>
							<tr style="border: 0;">
								<td class="customer-td1">이메일</td>
								<td class="customer-td2">${memberDto.email}</td>
							</tr>
							<tr style="border: 0;">
								<td class="customer-td1">연락처</td>
								<td class="customer-td2">${memberDto.phone}</td>
							</tr>
							<tr style="border: 0;">
								<td class="customer-td1">배송주소</td>
								<td class="customer-td2">
									<input class="customer-input" type="text" id="post" name="post" size="5" autocomplete="off" value="${memberDto.post}" readonly/>
									<input class="customer-input" type="hidden" id="seq_mbr_addr" name="seq_mbr_addr" value="${memberDto.seq_mbr_addr}"/>
									<label for="addr1">도로명</label>
									<input class="customer-input" style="width:300px" type="text" id="addr1" name="addr1" size="40" autocomplete="off" value="${memberDto.addr1}" readonly/>
									<span id="guide" style="color:#999; display:none"></span>
									<label for="addr2">상세</label>
									<input style="width:100px" class="customer-input" type="text" id="addr2" name="addr2" size="20" placeholder="상세 주소" autocomplete="off" value="${memberDto.addr2}" readonly/>
									<input class="customer-button" type="button" onclick="changeDeliveryAddress()" value="배송지 변경">
								</td>
							</tr>
							<tr style="border: 0;">
								<td class="customer-td1">배송 요청사항</td>
								<td class="customer-td2">
									<input class="customer-input" style="width:300px" type="text" id="delivery_request" name="delivery_request" autocomplete="off" oninput="checkMaxLength()"/> *최대 50글자까지 입력할 수 있습니다.
								</td>
							</tr>
							</tbody>
						</table>
					</div>
					<h5 class="customer-title">배송정보</h5>
					<div class="shop__cart__table">
						<table class="customer-table" style="border: 1px solid #e4e4e4 !important;">
							<thead style="border-bottom: 1px solid #dbdbdb !important;">
								<tr style="border-color: #707070 !important;">
									<th class="customer-th" style="color: #00891a !important;">${memberDto.dt_reg} <span style="font-weight: normal !important; font-size: 16px !important; color: #00891a !important;"> 도착보장</span></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="list" items="${buyList}">
							<tr style="border: 0;">
								<td class="customer-td2" style="border-bottom: 0px !important; font-size: 16px !important;">${list.sle_nm}, ${list.count}개</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<h5 class="customer-title">결제정보</h5>
					<div class="shop__cart__table">
						<table class="customer-table">
							<tbody>
								<tr style="border: 0;">
									<td class="customer-td1">총상품금액</td>
									<td class="customer-td2" style="font-weight: bold; font-size: 12px !important;">
										${formatTotalPriceSum}원
										<input type="hidden" id="totalPriceSum" value="${totalPriceSum}">
									</td>
								</tr>
								<tr style="border: 0;">
									<td class="customer-td1">포인트적립</td>
									<td class="customer-td2" style="font-weight: bold; font-size: 12px !important;">
										${formatTotalPointSum} 포인트
										<input type="hidden" id="totalPointSum" value="${totalPointSum}">
									</td>
								</tr>
								<tr style="border: 0;">
									<td class="customer-td1">포인트사용</td>
									<td class="customer-td2">
										<input name="usePoint" class="customer-input" type="text" style="width:100px; text-align: center; margin-right: 20px;" autocomplete="off" value="0" id="pointInput" />
										보유 : <span class="rate" id="totalPoint" style="margin-left: 0px !important;">
											${memberDto.total_point}
										</span> 포인트
									</td>
								</tr>
								<tr style="border: 0;">
									<td class="customer-td1">총결제금액</td>
									<td class="customer-td3" id="finalAmountCell">
									${formatTotalPriceSum}원
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div style="display: flex; justify-content: flex-end; padding-right: 15px; align-items: flex-start;">
					<div>
						<a id="btnPay" class="cart-btn" style="cursor: pointer; background: #2c2c2c; color: white !important; border: 1px solid #2c2c2c; margin: 0;">
							결제 하기
						</a>
					</div>
				</div>
			</div>
		</section>
	<div id="deliveryModal" style="border-radius: 4px !important; display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; border: 1px solid #ccc; padding: 20px; z-index: 1000; width: 400px; box-shadow: 0px 4px 6px rgba(0,0,0,0.1);">
		<button type="button" style="position: absolute; top: 10px; right: 10px; background: none; border: none; font-size: 18px; cursor: pointer;" onclick="closeModal()">×</button>
			<h3 style="margin-top: 0; text-align: center; margin-bottom: 30px;">배송지 변경</h3>
		<div id="deliveryList" style="margin-top: 15px;"></div>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<c:forEach var="list" items="${buyList}" varStatus="status">
		<input type="hidden" name="buyList[${status.index}].seq_mbr" value="${list.seq_mbr}" />
		<input type="hidden" name="buyList[${status.index}].seq_sle" value="${list.seq_sle}" />
		<input type="hidden" name="buyList[${status.index}].sle_nm" value="${list.sle_nm}" />
		<input type="hidden" name="buyList[${status.index}].price" value="${list.price}" />
		<input type="hidden" name="buyList[${status.index}].count" value="${list.count}" />
		<input type="hidden" name="buyList[${status.index}].point" value="${list.point}" />
		<input type="hidden" name="buyList[${status.index}].cd_ctg_m" value="${list.cd_ctg_m}" />
		<input type="hidden" name="buyList[${status.index}].cd_ctg_b" value="${list.cd_ctg_b}" />
	</c:forEach>
	<script>
	$(document).ready(function () {
		var totalPriceSum = Number($('#totalPriceSum').val());
		var totalPoint = Number($('#totalPoint').text());
		var pointInput = $('#pointInput');
		var finalAmountCell = $('#finalAmountCell');
		
		pointInput.on('input', function () {
			
			let inputValue = Number($(this).val());
			
			if (isNaN(inputValue) || inputValue < 0) {
				
				$(this).val('');
				alert('유효한 포인트를 입력해주세요.');
				return;
			}
			if (inputValue > totalPoint) {
				
				alert('보유한 포인트보다 큰 값을 입력할 수 없습니다.');
				inputValue = totalPoint;
				$(this).val(totalPoint); // 최대 보유 포인트로 설정
			}
			if (inputValue > totalPriceSum) {
				
				alert('사용할 포인트는 총 상품 금액을 초과할 수 없습니다.');
				inputValue = totalPriceSum;
				$(this).val(totalPriceSum);
			}
			let finalPrice = totalPriceSum - inputValue;
			finalAmountCell.text(finalPrice.toLocaleString() + '원');
		});
	});
	
	function changeDeliveryAddress() {
		$.ajax({
			type: "POST",
			url: "/front/buy/deliveryChanges.json",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			success: function(res) {
				
				var deliveryListContainer = $('#deliveryList');
				deliveryListContainer.empty();
				
				if (res && res.length > 0) {
					
					res.forEach(function(item, index) {
						
						var seqMbrAddr = item.seq_mbr_addr;
						var post = item.post;
						var addr1 = item.addr1;
						var addr2 = item.addr2;
						
						var deliveryDiv = 
							
							'<div style="border: 1px solid #e0e0e0; border-radius: 2px; font-family: 돋움, Dotum, sans-serif !important; margin-bottom: 15px;">' +
								'<div style="padding: 15px;">' +
									'<div style="font-size: 16px; line-height: 20px; white-space: nowrap; font-weight: bold; margin-bottom: 10px;">배송지 상세 정보</div>' +
									'<div style="margin-bottom: 5px; font-size: 14px;"> ' + post + '</div>' +
									'<div style="margin-bottom: 5px; font-size: 14px;"> ' + addr1 + '</div>' +
									'<div style="margin-bottom: 5px; font-size: 14px;"> ' + addr2 + '</div>' +
									'<div>' +
									'<a id="btnPay" class="cart-btn" style="font-weight: normal; cursor: pointer; background: white; color: #346aff !important; border: 1px solid #346aff; margin: 0; display: inline-block; padding: 4px 12px; text-align: center;" ' +
										'onclick="selectAddress(\'' + seqMbrAddr + '\', \'' + post + '\', \'' + addr1 + '\', \'' + addr2 + '\')">선택</a>' +
								'</div>' +
								'</div>' +
							'</div>';
							
						deliveryListContainer.append(deliveryDiv);
					});
					$('#deliveryModal').show();
					$('#modalOverlay').show();
				}
			},
		});
	}
	
	function closeModal() {
		$('#deliveryModal').hide();
		$('#modalOverlay').hide();
	}
	
	function selectAddress(seq_mbr_addr, post, addr1, addr2) {
		$('#seq_mbr_addr').val(seq_mbr_addr);
		$('#post').val(post);
		$('#addr1').val(addr1);
		$('#addr2').val(addr2);
		
		closeModal();
	}
</script>
</form>
<iframe name="frmBlank" id="frmBlank" width="0" height="0"></iframe>
<c:if test="${flgMobile == 'Y'}">
	<script type="text/javascript" src="https://testpay.kcp.co.kr/plugin/payplus_web.jsp"></script>
	<%
	// <script type="text/javascript" src="https://pay.kcp.co.kr/plugin/payplus_web.jsp"></script>
	%>
	<form name="form" action="https://testsmpay.kcp.co.kr/pay/mobileGW.kcp" method="post" accept-charset="euc-kr">
		<input type="hidden" name="ordr_idxx" value="">
		<input type="hidden" name="good_name" value="">
		<input type="hidden" name="good_mny" value="">
		<input type="hidden" name="buyr_name" value="">
		<input type="hidden" name="site_cd" value="">
		
		<input type="hidden" name="Ret_URL" value="">
		<input type="hidden" name="approval_key" value="">
		
		<input type="hidden" name="req_tx" value="pay">
		<input type="hidden" name="pay_method" value="CARD">
		<input type="hidden" name="currency" value="410">
		<input type="hidden" name="escw_used" value="N">
		<input type="hidden" name="AppUrl" value="testApp://kr.co.himedia.ecommerce.buyer.activity.WebViewActivity">
	</form>
</c:if>

<c:if test="${flgMobile != 'Y'}">
	<script type="text/javascript">
		function m_Completepayment(FormOrJson, closeEvent) {
			var frm = document.kcp_order_info;
			GetField(frm, FormOrJson);
			//console.log(frm);
			if (frm.res_cd.value == "0000") {
				frm.action = "/front/pay/payup/pay.web";
				frm.submit();
				closeEvent();
			}
			else {
				closeEvent();
			}
		}
		
		function jsf__pay() {
			try {
				var form = document.kcp_order_info;
				KCP_Pay_Execute(form);
			}
			catch (e) {	}
		}
	</script>	
	

	<script type="text/javascript" src="https://testpay.kcp.co.kr/plugin/payplus_web.jsp"></script>
	<form name="kcp_order_info" method="post" accept-charset="utf-8">
		<input type="hidden" name="ordr_idxx" value="">
		<input type="hidden" name="good_name" value="">
		<input type="hidden" name="good_mny" value="">
		<input type="hidden" name="buyr_name" value="">
		<input type="hidden" name="site_cd" value="">
		
		<input type="hidden" name="req_tx" value="pay">
		<input type="hidden" name="pay_method" value="100000000000">
		<input type="hidden" name="site_name" value="payup" />
		<!-- <input type="hidden" name="kakaopay_direct" value="Y"> -->
		
		<input type="hidden" name="res_cd" value="" />
		<input type="hidden" name="res_msg" value="" />
		<input type="hidden" name="enc_info" value="" />
		<input type="hidden" name="enc_data" value="" />
		<input type="hidden" name="ret_pay_method" value="" />
		<input type="hidden" name="tran_cd" value="" />
		<input type="hidden" name="use_pay_method" value="" />
		<input type="hidden" name="buyr_mail" value="">
		<input type="hidden" name="ordr_chk" value="" />
		<input type="hidden" name="good_expr" value="0">
		<input type="hidden" name="module_type" value="01" />
		<input type="hidden" name="currency" value="WON" />
	</form>
</c:if>
</body>
</html>