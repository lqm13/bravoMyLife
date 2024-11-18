<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/buy/view.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/backoffice.js"></script>
	
	<script>

	function consolegoList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/console/center/board/list.web";
		frmMain.submit();
	}
	
	function goBuyList() {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/console/buy/list.web";
		frmMain.submit();
	}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST" >
<input type="hidden" name="seq_buy_mst" id="seq_buy_mst" 		value="0"/>
<input type="hidden" name="seq_mbr" id="seq_mbr" 				value="0"/>
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" 		value="0" />
<input type="hidden" name="cd_state"	id="cd_state" 			value="0"/>
	<%@ include file="/include/backoffice/mainSide.jsp" %>

	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header" style="display: flex; align-items: center; margin-left: 215px;">
		<h1>
		판매 상품 상세 페이지
		</h1>
	</section>

		<!-- Main content -->
		<section class="content" style="display: flex; justify-content: center; align-items: center;">
			<div class="col-md-9">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">${param.mbr_nm} 고객님의 상품 상세 목록</h3>
					</div>
					<div class="box-body no-padding">
						<div class="table-responsive mailbox-messages">
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th style="width: 5%; text-align: center;">NO</th>
										<th style="text-align: center;">판매 상품명</th>
										<th style="width: 15%; text-align: center;">판매 상품 개수</th>
										<th style="width: 15%; text-align: center;">판매 상품 가격</th>
										<th style="width: 15%; text-align: center;">개별 포인트</th>
										<th style="width: 15%; text-align: center;">리뷰 작성 유무</th>
										<th style="width: 15%; text-align: center;">구매 일자</th>
									</tr>
								</thead>
									<c:forEach items="${buyDtoList}" var="item">
										<tr>
											<td style="text-align: center;">
												${item.rnum}
											</td>
											<td style="text-align: center;">
												${item.sle_nm}
											</td>
											<td style="text-align: center;">
												${item.count}
											</td>
											<td style="text-align: center;">
												${item.price}
											</td>
											<td style="text-align: center;">
												${item.point}
											</td>
											<td style="text-align: center;">
												<c:choose>
													<c:when test="${item.flg_review == 'Y'}">YES</c:when>
													<c:otherwise>NO</c:otherwise>
												</c:choose>
											</td>
											<td style="text-align: center;">
												${item.dt_reg}
											</td>
										</tr>
								</c:forEach>
							</table>
						</div>
						<div class="modal-footer" style="text-align: center; padding-top: 10px; padding-bottom: 10px;">
							<input type="button" value="목록" class="btn btn-primary" onclick="javascript:goBuyList()" />
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="/include/backoffice/footer.jsp" %>

	<%@ include file="/include/backoffice/sideBar.jsp" %>

	<%@ include file="/include/backoffice/js.jsp" %>
</form>
</body>
</html>