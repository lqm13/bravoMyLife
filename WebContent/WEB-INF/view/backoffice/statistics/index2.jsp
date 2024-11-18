<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/statistics/index2.jsp" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
<script>
function consolegoList(value) {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.cd_bbs_type.setAttribute("value", value);
	frmMain.action = "/console/center/board/list.web";
	frmMain.submit();
}

function goYear(year) {
	
	var frmMain = document.getElementById("frmMain");

	document.getElementById("year").value = year;
	frmMain.action="/console/statistics/index2.web";
	frmMain.submit();

}
</script>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST">
<input type="hidden" name="year" id="year" />
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" value="${paging.cd_bbs_type}" />
<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
	<div class="content-wrapper">
	<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
			통계
			<small>월별</small>
			</h1>
			<a href="javascript:goYear(2023);" class="btn btn-primary" style="width: 150px;">2023</a>
			<a href="javascript:goYear(2024);" class="btn btn-primary" style="width: 150px;">2024</a>
			<a href="javascript:goYear(2025);" class="btn btn-primary" style="width: 150px;">2025</a>
			<a href="javascript:goYear(2026);" class="btn btn-primary" style="width: 150px;">2026</a>
			<a href="javascript:goYear(2026);" class="btn btn-primary" style="width: 150px;">2027</a>
			<a href="javascript:goYear(2026);" class="btn btn-primary" style="width: 150px;">2028</a>
		</section>
		
	
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-12">
				<!-- AREA CHART -->
					<div class="box box-primary">
					<div class="box-header with-border">
					  <h3 class="box-title">매출과 원가를 통한 판매 수익 추이</h3>
		
					  <div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
						</button>
						<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
					  </div>
					</div>
					<div class="box-body chart-responsive">
					  <div class="chart" id="revenue-chart" style="height: 400px;"></div>
					</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="/include/backoffice/footer.jsp" %>
	<%@ include file="/include/backoffice/sideBar.jsp" %>
	<%@ include file="/include/backoffice/js.jsp" %>
<script>
	$(function () {
	"use strict";

	var area = new Morris.Area({
		element: 'revenue-chart',
		parseTime: false, 
		resize: true,
		data: [
		<c:choose>
			<c:when test="${empty list}">
				/* 데이터 없음*/
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="list">
					{y: '${list.moon}월', 원가: ${list.total_cost}, 매출: ${list.total_sale}, 이익: ${list.total_income_point}
					},
				</c:forEach>
			</c:otherwise>
		</c:choose>
		],
		xkey: 'y',
		ykeys: ['원가', '매출', '이익'],
		labels: ['원가', '매출', '이익'],
		lineColors: ['#2ECC71 ', '#3498DB','#CB4335'],
		hideHover: 'auto'
	  });
				});
</script>
</form>
</body>
</html>
