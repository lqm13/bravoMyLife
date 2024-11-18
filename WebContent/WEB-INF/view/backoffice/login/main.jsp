<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/login/main.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
		
		// Google Charts 라이브러리 로드 완료 후 실행
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawCharts);
		
		function drawCharts() {
			
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
				width: 800,
				height: 350,
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
			
			
			
			
			// 남성, 여성 데이터 초기화
			var maleDataArray = [['나이대', '수']];
			var femaleDataArray = [['나이대', '수']];
	
			// JSP에서 남성과 여성 데이터를 JavaScript 배열로 추가
			<c:forEach items="${listMemberAge}" var="listx">
				<c:choose>
					<c:when test="${listx.gender == 'M'}">
						maleDataArray.push(['${listx.ageGroup}', ${listx.sumAge}]);
					</c:when>
					<c:when test="${listx.gender == 'F'}">
						femaleDataArray.push(['${listx.ageGroup}', ${listx.sumAge}]);
					</c:when>
				</c:choose>
			</c:forEach>
			
			// 남성 데이터 차트
			var maleData = google.visualization.arrayToDataTable(maleDataArray);
			var optionsMale = {
				title: '남성 나이대 통계',
				width: 500,
				height: 400,
				colors: ['#0033ff', '#0099ff', '#00ccff','#00ffff', '#3300ff', '#3333ff'] ,
				pieSliceTextStyle: {
					color: 'black'
					,fontSize: 13
				}
				
			};
			var chartMale = new google.visualization.PieChart(document.getElementById('chart_div_male'));
			chartMale.draw(maleData, optionsMale);
	
			// 여성 데이터 차트
			var femaleData = google.visualization.arrayToDataTable(femaleDataArray);
			var optionsFemale = {
				title: '여성 나이대 통계',
				width: 500,
				height: 400,
				colors: ['#e39bcf', '#f778c3', '#fc00a8', '#ee5cd4', '#e792e3', '#ee548b'],
				pieSliceTextStyle: {
					color: 'black'
					,fontSize: 13
				}
				
			};
			var chartFemale = new google.visualization.PieChart(document.getElementById('chart_div_female'));
			chartFemale.draw(femaleData, optionsFemale);
		}
		

	
		function goYear(year) {
			
	
			var frmMain = document.getElementById("frmMain");
	
			document.getElementById("year").value = year;
			frmMain.action="/console/login/main.web";
			frmMain.submit();
	
		}
	</script>
	
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST">
<input type="hidden" name="year" id="year" value="0" />
<input type="hidden" name="cd_state"	id="cd_state" value="0"/>
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" />
	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
	<div class="content-wrapper" >
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
			통계
			<small>월별</small>
			</h1>
			<a href="javascript:goYear(2023);" class="btn btn-primary" style="width: 130px;">2023</a>
			<a href="javascript:goYear(2024);" class="btn btn-primary" style="width: 130px;">2024</a>
			<a href="javascript:goYear(2025);" class="btn btn-primary" style="width: 130px;">2025</a>
			<a href="javascript:goYear(2026);" class="btn btn-primary" style="width: 130px;">2026</a>
			<a href="javascript:goYear(2026);" class="btn btn-primary" style="width: 130px;">2027</a>
			<a href="javascript:goYear(2026);" class="btn btn-primary" style="width: 130px;">2028</a>
		</section>
		
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">매출과 원가를 통한 판매 수익 추이</h3>
								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
									<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
								</div>
						</div>
						<div class="box-body chart-responsive">
							<div class="chart" id="revenue-chart" style="height: 300px;"></div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="box box-primary">
						<div class="box-body chart-responsive">
							<div class="chart" id="linechart_material" style="height: 400px;"></div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="box box-primary">
						<div class="box-body chart-responsive">
							<div style="display: flex;">
								<div id="chart_div_male" style="width: 400px; height: 400px;"></div>
								<div id="chart_div_female" style="width: 500px; height: 400px;"></div>
							</div>
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
