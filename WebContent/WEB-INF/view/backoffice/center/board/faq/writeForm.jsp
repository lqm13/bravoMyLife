<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/center/board/notice/writeForm.jsp" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	<%@ include file="/include/backoffice/css.jsp" %>
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<script>
	function goList(value) {
		var frmMain = document.getElementById("frmMain");
		document.getElementById("cd_bbs_type").value = value;
		frmMain.action="/console/center/board/list.web";
		frmMain.submit();
	}

	function writeProc(value) {
		var frmMain = document.getElementById("frmMain");
		document.getElementById("cd_bbs_type").value = value;
		
		if (document.getElementById("title").value == ""
				|| document.getElementById("content").value == "") {
			alert("필수 항목을 입력하세요!");
			return;
		}
	
	if(document.getElementById("flg_top").checked){
		document.getElementById("flg_top").value = 'Y';
	}else{
		document.getElementById("flg_top").value = 'N';
	}
	
	frmMain.action="/console/center/board/writeProc.web";
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
<form id="frmMain" method="POST" enctype="multipart/form-data" >
<input type="hidden" id="cd_bbs_type"	name="cd_bbs_type" />
<input type="hidden" id="cd_state"		name="cd_state"	 value="0"/>
<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
		고객 센터
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-3">
			
	
			<div class="box box-solid">
				<div class="box-header with-border">
					<h3 class="box-title">고객 센터</h3>
	
				<div class="box-tools">
					<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
					</button>
				</div>
				</div>
				<div class="box-body no-padding">
					<ul class="nav nav-pills nav-stacked">
						<li class="active"><a href="javascript:consolegoList(1);"><i class="fa fa-bullhorn"></i> 공지사항</a>
						<li class="active"><a href="javascript:consolegoList(2);"><i class="fa fa-fw fa-users"></i> 자주찾는 질문(FAQ)</a>
						<li class="active"><a href="javascript:consolegoList(3);"><i class="fa fa-fw fa-user"></i> 1:1문의</a>
						</li>
					</ul>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /. box -->
			<!-- /.box -->
			</div>
			<div class="col-md-8">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">등록하기</h3>
					</div>
				<!-- /.box-header -->
					<div class="box-body">
						<div class="form-group">
							<label>제목(*)</label>
							<input type="checkbox" id= "flg_top" name="flg_top" value="" style="float: right;margin-right: 10px;"/> 
							<label style="float: right;margin-right: 5px;">최상위</label>
							<input class="form-control" placeholder=""id="title" name="title" required >
						</div>
					<div class="form-group">
						<label>카테고리(*)</label>
						<select class="form-control" id="cd_ctg" name="cd_ctg" style="height: 34px;"required>
							<option value="0">선택</option>
							<option value="1">가입 및 탈퇴</option>
							<option value="2">상품</option>
							<option value="3">구매</option>
							<option value="4">결제</option>
							<option value="5">배송</option>
							<option value="6">환불</option>
							<option value="9">기타</option>
						</select>
					</div>
					<div class="form-group" >
						<label>내용(*)</label> 
							<textarea id="content" class="form-control" style="height: 250px"id="content" name="content" required>
							</textarea>
					</div>
					<div class="form-group">
						<div class="btn btn-default btn-file">
							<i class="fa fa-paperclip"></i> 첨부 파일
							<input type="file" id="files[0]" name="files[0]">
						</div>
						<p class="help-block">최대 10 MB</p>
					</div>
					</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<div class="pull-right">
						<button type="button" class="btn btn-primary" onclick="writeProc(2);"><i class="fa fa-pencil"></i> 등록</button>
						<button type="button" class="btn btn-default" onclick="goList(2);"><i class="fa fa-fw fa-align-justify"></i> 목록</button>
					</div>
					<button type="button" class="btn btn-default btn-sm" onclick="location.reload();"><a>다시쓰기</a></button>
				</div>
				<!-- /.box-footer -->
				</div>
			<!-- /. box -->
			</div>
			<!-- /.col -->
		</div>
	</section>
	<!-- /.content -->
</div>
<!-- /Maincontent -->
	<%@ include file="/include/backoffice/footer.jsp" %>
	<%@ include file="/include/backoffice/sideBar.jsp" %>
	<%@ include file="/include/backoffice/js.jsp" %>
	</form>
	<script src="/backoffice/js/bootstrap3-wysihtml5.all.min.js"></script>
	<script>
	$(function () {
	//Add text editor
	$("#content").wysihtml5();
	});
</script>
</body>
</html>