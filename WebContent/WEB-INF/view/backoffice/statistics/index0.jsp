<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/statistics/index1.jsp" %>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
		// Google Charts 라이브러리 로드 완료 후 실행
		google.charts.load('current', {'packages':['line']});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
			var data = new google.visualization.DataTable();
			
			// 1. [그래프] 월 및 상품명 정보
			data.addColumn('number', '월');
			<c:set var="arrayBest" value="" />
			<c:set var="columnCount" value="0" />
			<c:choose>
				<c:when test="${empty listsellingBestName}">
					data.addColumn('number', '상품-1');
					data.addColumn('number', '상품-2');
					data.addColumn('number', '상품-3');
					data.addColumn('number', '상품-4');
					data.addColumn('number', '상품-5');
					data.addColumn('number', '상품-6');
					data.addColumn('number', '상품-7');
					data.addColumn('number', '상품-8');
					data.addColumn('number', '상품-9');
					data.addColumn('number', '상품-10');
					data.addColumn('number', '상품-11');
				</c:when>
				<c:otherwise>
					<c:forEach var="item" items="${listsellingBestName}" varStatus="status_best">
						<c:set var="seq_sle">${item.seq_sle}</c:set>
						<c:if test="${status_best.index == 0}">
							<c:set var="arrayBest" value="${seq_sle}" />
						</c:if>
						<c:if test="${status_best.index != 0}">
							<c:set var="arrayBest" value="${arrayBest += ',' += seq_sle}" />
						</c:if>
						<c:set var="columnCount" value="${status_best.index +1}" />
						data.addColumn('number', '${status_best.index + 1}. ${fn:substring(item.name, 0, 10)} ...');
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
			// [참고] 상품 갯수: <c:out value="${columnCount}" />
			// [참고] 상품 목록: <c:out value="${arrayBest}" />
			<c:set var="writtenColumnCount" value="0" />
			<c:set var="rowCount" value="0" />
			
			<c:forEach var="list" items="${listsellingBestList}" varStatus="status_list">
				var list_${status_list.index} = [${list.month}
				<c:forEach var="row" items="${fn:split(arrayBest, ',')}" varStatus="status_row">
					<c:if test="${row == list.seq_sle}">
						, ${list.count}
					</c:if>
					<c:if test="${row != list.seq_sle}">
						, 0
					</c:if>
					<c:set var="writtenColumnCount" value="${writtenColumnCount + 1}" />
				</c:forEach>
				<c:if test="${writtenColumnCount == columnCount}">
					]
					<c:set var="writtenColumnCount" value="0" />
				</c:if>
				<c:set var="rowCount" value="${status_list.index}" />
			</c:forEach>
			
			var columns		= ${columnCount + 1};
			var rowsAll		= ${rowCount + 1};
			var months		= 0;
			var monthBefore	= 0;
			
			// [참고] 중복을 제외한 월(=최종 행의 갯수)
			for (loop = 0; loop < rowsAll - 1; loop++) {
				monthAfter = eval("list_" + loop + "[0]");
				if (monthBefore != monthAfter) {
					months++;
					monthBefore = monthAfter;
				}
			}
			//alert(months);
			
			// 2. [그래프] 월 및 상품 수량 정보(행=months, 열=columns)
			var matrixRows	= Array.from(new Array(months), () => new Array(columns).fill(0));
			var count		= 0;
			var month		= 0;
			
			// [참고] 모든 행
			// var matrisxAll = Array.from(new Array(rowsAll), () => new Array(columns).fill(0));
			var rowIndex	= -1;
			var monthBefore	= 0;
			for (loop1st = 0; loop1st < rowsAll; loop1st++) {
				for (loop2nd = 0; loop2nd < columns; loop2nd++) {
					
					value = eval("list_" + loop1st + "[" + loop2nd + "]");
					
					if (loop2nd == 0) monthThis = value;
					
					// 월이 바뀌면 열을 증가
					if (loop2nd == 0 && monthThis != monthBefore) {
						// alert("this:before=" + monthThis + ":" + monthBefore);
						rowIndex++;
					}
					
					// 열에 기록
					if (value > 0) {
						// alert("rowIndex=" + rowIndex);
						matrixRows[rowIndex][loop2nd] = value;
						// alert(rowIndex + ":" + loop2nd + "=" + matrixRows[rowIndex][loop2nd]);
					}
				}
				monthBefore = matrixRows[rowIndex][0];
				// alert(monthBefore + ":" + monthBefore);
			}
			
			// alert(matrixRows.length);
			// alert(matrixRows[0].length);
			
			// matrixRows[0] = [11, 8, 6, 9];
			/*
			matrixRows[0] = [6,  0,   0,   0,   0,   0,   0,   0,  11,   0,   0,    0];
			matrixRows[1] = [8,  7,   0,   0,   6,   0,   0,   0,   0,   0,   0,    0];
			matrixRows[2] = [9,  0,   0,   0,   0,   0,   5,   5,   0,   8,   7,    0];
			matrixRows[3] = [10, 0,  11,   6,   0,   5,   0,   0,   0,   0,   0,    0];
			matrixRows[4] = [11, 7,   0,   0,   0,   0,   0,   0,   0,   9,   0,   11];
			*/
			data.addRows(
				matrixRows
			);
			var options = {
				chart: {
					title: '월 판매량 TOP 3 상품',
					subtitle: '2024년 기준',
				},
				width: 1024,
				height: 500
			};
			
			var chart = new google.charts.Line(document.getElementById('linechart_material'));
			chart.draw(data, options);
		}
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST">
	
	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
	<div style="display: flex; justify-content: space-around; align-items: center;">
		<div id="linechart_material"></div>
	</div>
<!-- /Maincontent -->

	<%@ include file="/include/backoffice/footer.jsp" %>

	<%@ include file="/include/backoffice/sideBar.jsp" %>

	<%@ include file="/include/backoffice/js.jsp" %>
</form>
</body>
</html>