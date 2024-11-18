<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/basket/index.jsp" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
	$(function() {
		location.reload();
	});
	
	function remove(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		
		frmMain.action="/front/member/likeRemove.web";
		frmMain.target = "";
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
	
	function goPages(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.currentPage.setAttribute("value", value);

		frmMain.action="/front/member/myLike.web";
		frmMain.submit();
	}
	
	function setBasket(value, value2, value3,value4, value5, value6, value7, value8, value9, value10) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.sle_nm.setAttribute("value", value2);
		frmMain.discount_sale.setAttribute("value", value3);
		frmMain.basketCount.setAttribute("value", value4);
		frmMain.img.setAttribute("value", value5);
		frmMain.point_stack.setAttribute("value", value6);
		frmMain.basketCd_ctg_m.setAttribute("value", value7);
		frmMain.basketCd_ctg_b.setAttribute("value", value8);
		frmMain.price_sale.setAttribute("value", value9);
		frmMain.discount.setAttribute("value", value10);
		frmMain.basketSeq_sle.setAttribute("value", value);
		
		frmMain.action = "/front/basket/setBasket.web";
		frmMain.target = "frmBlank";
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
<input type="hidden" name="basketList[0].point_stack"	id="point_stack"		value="0"/>
<input type="hidden" name="basketList[0].discount_sale"	id="discount_sale"		value="0"/>
<input type="hidden" name="basketList[0].img"			id="img"			/>
<input type="hidden" name="basketList[0].seq_sle"		id="basketSeq_sle"		value="0"/>
<input type="hidden" name="basketList[0].sle_nm"		id="sle_nm"			/>
<input type="hidden" name="basketList[0].cd_ctg_m"		id="basketCd_ctg_m"		/>
<input type="hidden" name="basketList[0].cd_ctg_b"		id="basketCd_ctg_b"		/>
<input type="hidden" name="basketList[0].price_sale"	id="price_sale"			value="0"/>
<input type="hidden" name="basketList[0].discount"		id="discount"			value="0"/>
<input type="hidden" name="basketList[0].count"			id="basketCount"		value="0"/>
<input type="hidden" name="cd_bbs_type"					id="cd_bbs_type"		value="0"/>
<input type="hidden" name="type"						id="type"/>
<input type="hidden" name="searchWord"					id="searchWord"/>
<input type="hidden" name="seq_sle"						id="seq_sle"			value="0"/>
<input type="hidden" name="cd_ctg_m"					id="cd_ctg_m"			/>
<input type="hidden" name="cd_ctg_b"					id="cd_ctg_b"			/>
<input type="hidden" name="count"						id="count"				value="0"/>
<input type="hidden" name="currentPage"					id="currentPage" value="${paging.currentPage}" />

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

	<!-- Shop Cart Section Begin -->
	<section class="shop-cart spad" style="min-height: calc(100vh - 1px);" >
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h6 class="lowgnb-title" style="padding-bottom: 20px; text-align: left; font-size: 35px;">찜 목록</h6>
					<h6 class="cart-title">*이미지를 클릭하면 상품으로 이동합니다</h6>
						<div class="shop__cart__table" style="border: 1px solid #dbdbdb; border-radius: 4px;">
							<table id="productBasket" class="cart-table">
								<thead style="border-bottom: 1px solid #dbdbdb !important;">
									<tr style="border-color: #707070 !important;">
										<th class="cart-th" style="width: 5%">
										<th class="cart-th" >상품정보</th>
										<th class="cart-th" style="width: 20%">상품금액</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${empty list}">
										<tr style="text-align: center; border-bottom: 1px solid #707070;">
											<td colspan="7">찜한 상품이 없습니다</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="list" items="${list}">
											<tr style="border: 0;">
												<td class="cart-td" style="text-align: center; vertical-align: middle;">
													<div class="cart-div" style="width: 80px; height: 80px; overflow: hidden; display: inline-block;">
														<a href="javascript:goWriteForm('${list.seq_sle}', '${list.cd_ctg_m}', '${list.cd_ctg_b}');">
															<img class="cart-img" src="/img/product/${list.img}" class="cart-img">
														</a>
													</div>
												</td>
												<td class="cart-td" style="text-align: center !important;">
													${list.sle_nm}
												</td>
												<td class="cart-td">
													<fmt:formatNumber value="${list.price_sale}" type="number" />원
												</td>
												<td class="cart-td">
													<div style="display: flex; flex-direction: column; align-items: center;">
														<a href="javascript:setBasket('${list.seq_sle}', '${list.sle_nm}', '${list.discount_sale}', '1'
																	, '/img/product/${list.img}', '${list.point_stack}', '${list.cd_ctg_m}', '${list.cd_ctg_b}', '${list.price_sale}', '${list.discount}');" 
														class="cart-btn" style="background: #2c2c2c; color: white !important; border: 1px solid #2c2c2c;margin-top:0px">장바구니 담기</a>
														<a href="javascript:remove('${list.seq_sle}')" class="cart-btn" style="background: white; color: #2c2c2c; border: 1px solid #2c2c2c;padding: 10px 45px 10px;">삭제</a>
													</div>
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
				<div class="col-lg-6 col-md-6 col-sm-6" style="max-width: 100% !important; flex: 0 0 100% !important; border-bottom: none;">
					<div style="display: flex; justify-content: flex-end;">
						<div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;">
			<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPages" />
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
</script>
</form>
<iframe name="frmBlank" id="frmBlank" width="0" height="0"></iframe>
</body>
</html>