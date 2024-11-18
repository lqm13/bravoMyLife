<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/login/loginForm.jsp" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	
<script>

	function search() {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.action="/console/center/board/ list.web";
			
		frmMain.submit();
		}

	function goWriteForm(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action="/console/center/board/writeForm.web";
		frmMain.submit();
	}
	
	
	function goView(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("seq_bbs").value = value;
		
		frmMain.action="/console/center/board/view.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("searchWord").value = "";
		document.getElementById("currentPage").value = "1";
		document.getElementById("cd_bbs_type").value = value;
		
		frmMain.action="/console/center/board/list.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function goPage(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = value;
		
		frmMain.action="/console/center/board/list.web";
		frmMain.target = "";
		frmMain.submit();
	}
	
	function consolegoList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/console/center/board/list.web";
		frmMain.submit();
	}
	
	
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST">
<input type="hidden" id="type"			name="type" />
<input type="hidden" name="seq_bbs"		id="seq_bbs" 		value="0"/>
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" 	value="${paging.cd_bbs_type}" />
<input type="hidden" name="currentPage" id="currentPage" 	value="${paging.currentPage}" />
<input type="hidden" name="cd_state"	id="cd_state" 		value="0"/>
<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
		맞춤 건강 등록
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-3">
				<div class="box box-solid">
					<div class="box-header with-border">
						<h3 class="box-title">맞춤 건강 등록</h3>
						<div class="box-tools">
							<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
							</button>
						</div>
					</div>
					<div class="box-body no-padding">
						<ul class="nav nav-pills nav-stacked">
							<li class="active"><a href="javascript:consolegoList(4);"><i class="fa fa-circle-o"></i> 새소식</a>
							<li class="active"><a href="javascript:consolegoList(6);"><i class="fa fa-circle-o"></i> 건강정보</a>
							<li class="active"><a href="javascript:consolegoList(7);"><i class="fa fa-circle-o"></i> 성분사전</a>
							</li>
						</ul>
					</div>
					<!-- /.box-body -->
				</div>
			<!-- /. box -->
			<!-- /.box -->
			</div>
			<!-- /.col -->
			<div class="col-md-8">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">성분사전</h3>&nbsp;&nbsp;&nbsp;
						<div class="box-tools pull-right">
							<div class="has-feedback">
								<div style="display: flex; align-items: center;">&nbsp;&nbsp;
									<select class="form-control" name="searchKey" style="height: 30px;">
										<option value="title" <c:if test="${paging.searchKey == 'title'}">  selected</c:if>>제목</option>
										<option value="contents" <c:if test="${paging.searchKey == 'contents'}">  selected</c:if>>내용</option>
										<option value="title+contents" <c:if test="${paging.searchKey == 'title+contents'}">  selected</c:if>>제목 또는 내용</option>
									</select>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="text" name="searchWord" id="searchWord" class="form-control input-sm" value="${paging.searchWord}" required onKeyPress="if (event.keyCode == 13) search();" />
									&nbsp;&nbsp;
									<input type="submit" value="검색"/>
								</div>
							</div>
						</div>
				<!-- /.box-tools -->
					</div>
				<!-- /.box-header -->
				<div class="box-body no-padding">
					<div class="table-responsive mailbox-messages">
						<table class="table table-hover table-striped">
							<tbody>
								<tr>
									<th style="text-align: center;width: 5% ">NO</th>
									<th style="text-align: center;">제목</th>
									<th style="text-align: center;width: 15%">등록일</th>
									<th style="text-align: center;width: 7%">조회수</th>
								</tr>
								<c:choose>
									<c:when test="${empty list}">
										<tr>
											<td colspan="4" style="text-align:center">등록된 글이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list}" var="list">
											<tr>
												<td style="text-align: center;">
													${list.rnum}
												</td>
												<td style="text-align: left">
													<a href="javascript:goView(${list.seq_bbs});">
														${list.title}
													</a>
												</td>
												<td style="text-align: center;">
													${list.dt_reg}
												</td>
												<td style="text-align: center;">
													${list.readed}
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					<!-- /.table -->
					</div>
					<!-- /.mail-box-messages -->
				</div>
				<!-- /.box-body -->
				<div class="box-footer no-padding">
					<div class="mailbox-controls">
					<!-- /.btn-group -->
					<button type="button" class="btn btn-default btn-sm" onclick="location.reload();"><i class="fa fa-refresh"></i></button>
						<span style="float: right;margin-right: 10px;margin-top: 5px;justify-content: center; ">전체 ${paging.totalLine}개 [${paging.currentPage}/${paging.totalPage} 페이지]</span>
					
					<div class="pull-right">
					<div class="btn-group">
					</div>
					<!-- /.btn-group -->
					</div>
					<!-- /.pull-right -->
					</div>
				</div>
				</div>
			  <!-- /. box -->
			</div>
			<div class="col-md-3"></div>
			<div class="col-md-8">
				<div style="text-align: center;">
					<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPage" />
				</div>
				<div style="text-align: center;">
					<a href="javascript:goWriteForm(6);" class="btn btn-primary" style="width: 150px;">등 록</a>
				</div>
			</div>
		<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /Maincontent -->

	<%@ include file="/include/backoffice/footer.jsp" %>

	<%@ include file="/include/backoffice/sideBar.jsp" %>

	<%@ include file="/include/backoffice/js.jsp" %>
	
	</form>
</body>
</html>
