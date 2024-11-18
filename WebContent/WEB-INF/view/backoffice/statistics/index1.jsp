<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/statistics/index1.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
	
		function consolegoList(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.cd_bbs_type.setAttribute("value", value);
			frmMain.action = "/console/center/board/list.web";
			frmMain.submit();
		}
		// Google Charts 라이브러리 로드 완료 후 실행
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
			var data = new google.visualization.DataTable();
			
			// 월 및 상품명들
			data.addColumn('number', '월');
			<c:forEach var="item" items="${listsellingBestName}">
				data.addColumn('number', '${item.name}');
			</c:forEach>
			
			// 월 및 상품들의 판매 수량
			data.addRows([
				<c:forEach var="item" items="${listsellingBestList}" varStatus="status">
					<c:set var="month_new" value="${item.month}" />
						<c:if test="${month_new != month_old}">
						[
							${item.month} 
							<c:forEach var="nameItem" items="${listsellingBestName}">
								, <c:choose>
									<c:when test="${nameItem.seq_sle == item.seq_sle}">${item.count}</c:when>
									<c:otherwise>0</c:otherwise>
								</c:choose>
							</c:forEach>
						],
						</c:if>
					<c:set var="month_old" value="${item.month}" />
				</c:forEach>
			]);
			
			var options = {
				chart: {
					title: '2024년 많이 팔린 상품 TOP 10',
					subtitle: '월별 판매량',
				},
				width: 1200,
				height: 800,
				hAxis: {
					title: '월',
					ticks: [{v: 1, f: '1월'}, {v: 2, f: '2월'}, {v: 3, f: '3월'}, {v: 4, f: '4월'}, {v: 5, f: '5월'}, {v: 6, f: '6월'}, {v: 7, f: '7월'}, {v: 8, f: '8월'}, {v: 9, f: '9월'}, {v: 10, f: '10월'}, {v: 11, f: '11월'}, {v: 12, f: '12월'}]
				},
				vAxis: {
					title: '판매 수량',
					format: '0',
					maxValue: 20
				}
			};
			
			var chart = new google.visualization.LineChart(document.getElementById('linechart_material'));
			chart.draw(data, options);
		}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST">
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" value="${paging.cd_bbs_type}" />
	
	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
<div class="content-wrapper">
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h1 class="box-title">인기 상품 통계</h1>
					</div>
					<div style="display: flex; justify-content: space-around; align-items: center;">
						<div id="linechart_material"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<!-- /Maincontent -->

	<%@ include file="/include/backoffice/footer.jsp" %>

	<%@ include file="/include/backoffice/sideBar.jsp" %>

	<%@ include file="/include/backoffice/js.jsp" %>
</form>
</body>
</html>