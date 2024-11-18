	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="main-header">
    <!-- Logo -->
    <a href="javascript:goMain()" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>관리</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>BRAVO My Life 관리자</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          
          <!-- Notifications: style can be found in dropdown.less -->
         
          <!-- Tasks: style can be found in dropdown.less -->
          
          <!-- User Account: style can be found in dropdown.less -->

          <!-- Control Sidebar Toggle Button -->

        <!-- 세션이 있으면 -->
        <c:if test="${not empty sessionScope.SEQ_MNG}">
          <li class="dropdown user user-menu">
            <a href="javascript:goMyPage()"  title="<%=session.getAttribute("NAME")%>" style="font-weight: bold; font-size: 1.2em;">[마이페이지]</a>
              <span class="hidden-xs">          
              </span>
            </a>
          </li>
          <li class="dropdown user user-menu">
            <a href="javascript:goLogout()" class="menuTop" style="font-weight: bold; font-size: 1.2em;">[로그아웃]</a>
              <span class="hidden-xs">          
              </span>
            </a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
<span style="float:right;line-height:43px;vertical-align:middle;">
		 <!-- Left side column. contains the logo and sidebar -->
			<aside class="main-sidebar">
				<!-- sidebar: style can be found in sidebar.less -->
				<section class="sidebar" style="padding-bottom: 0px;">
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="treeview">
					<a href="">
						<i class="fa fa-dashboard"></i> <span>사용자 관리</span>
						<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li class="active"><a href="javascript:goMemberList()"><i class="fa fa-circle-o"></i> 회원 관리</a></li>
						<li><a href="javascript:goManagersList()"><i class="fa fa-circle-o"></i> 관리자 관리</a></li>
					</ul>
					</li>
					<li class="treeview">
					<a href="javascript:goBuyList()">
						<i class="fa fa-files-o"></i>
						<span>주문관리</span>
						<span class="pull-right-container">
						<span class="label label-primary pull-right"></span>
						</span>
					</a>
					<!-- 
					<ul class="treeview-menu">
						<li><a href="#"><i class="fa fa-circle-o"></i> Top Navigation</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Boxed</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Fixed</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
					</ul>
					 -->
					</li>
					<li class="treeview">
					<a href="#">
						<i class="fa fa-edit"></i> <span>상품 관리</span>
						<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="javascript:goProductList()"><i class="fa fa-circle-o"></i> 상품 목록</a></li>
						<li><a href="javascript:goProductReg()"><i class="fa fa-circle-o"></i> 상품 등록</a></li>
					</ul>
					</li>
					<li class="treeview">
					<a href="">
						<i class="fa fa-fw fa-volume-up"></i> <span>고객 센터 관리</span>
						<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="javascript:consolegoList(1)"><i class="fa fa-bullhorn"></i> 공지사항</a></li>
						<li><a href="javascript:consolegoList(2)"><i class="fa fa-fw fa-users"></i> 자주찾는 질문(FAQ)</a></li>
						<li><a href="javascript:consolegoList(3)"><i class="fa fa-fw fa-user"></i> 1:1문의</a></li>
					</ul>
					</li>
					<li class="treeview">
					<a href="#">
						<i class="fa fa-book"></i> <span>맞춤 건강 등록 관리</span>
						<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="javascript:consolegoList(4)"><i class="fa fa-circle-o"></i> 새소식</a></li>
						<li><a href="javascript:consolegoList(6)"><i class="fa fa-circle-o"></i> 건강정보</a></li>
						<li><a href="javascript:consolegoList(7)"><i class="fa fa-circle-o"></i> 성분사전</a></li>
					</ul>
					</li>
					<li class="treeview">
					<a href="javascript:consolegoList(5)">
						<i class="fa fa-fw fa-commenting-o"></i>
						<span>소개 관리</span>
						<span class="pull-right-container">
						<span class="label label-primary pull-right"></span>
						</span>
					</a>
					<!-- 
					<ul class="treeview-menu">
						<li><a href="#"><i class="fa fa-circle-o"></i> Top Navigation</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Boxed</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Fixed</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
					</ul>
					 -->
					</li>
					<li class="treeview">
					<a href="">
						<i class="fa fa-laptop"></i>
						<span>통계</span>
						<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="javascript:goStatistics()"><i class="fa fa-circle-o"></i> 회원별 통계</a></li>
						<li><a href="javascript:goStatistics1()"><i class="fa fa-circle-o"></i> 인기 상품 통계</a></li>
						<li><a href="javascript:goStatistics2()"><i class="fa fa-circle-o"></i> 수익 통계</a></li>
					</ul>
					</li>
					<li>
					<a href="#">
						<span style="color: #333;">page</span>
						<span class="pull-right-container">
						<small class="label pull-right bg-green"></small>
						</span>
					</a>
					</li>
					<li class="treeview">
					<a href="#">
						
						<span style="color: #333;">page</span>
						<span class="pull-right-container">
						
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="#"><i class="fa fa-circle-o"></i> ChartJS</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Morris</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Flot</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Inline charts</a></li>
					</ul>
					</li>

					
					<li>
					<a href="#">
						<span style="color: #333;">page</span>
						<span class="pull-right-container">
						<small class="label pull-right bg-red"></small>
						<small class="label pull-right bg-blue"></small>
						</span>
					</a>
					</li>
					<li>
					<a href="#">
						<span style="color: #333;">page</span>
						<span class="pull-right-container">
						<small class="label pull-right bg-yellow"></small>
						<small class="label pull-right bg-green"></small>
						<small class="label pull-right bg-red"></small>
						</span>
					</a>
					</li>
					<li class="treeview">
					<a href="#">
						<span style="color: #333;">page</span>
						<span class="pull-right-container">
						
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="#"><i class="fa fa-circle-o"></i> Invoice</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Profile</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Login</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Register</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Lockscreen</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> 404 Error</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> 500 Error</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Blank Page</a></li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Pace Page</a></li>
					</ul>
					</li>
					<li class="treeview">
					<a href="#">
						<span style="color: #333;">page</span>
						<span class="pull-right-container">
						
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
						<li>
						<a href="#"><i class="fa fa-circle-o"></i> Level One
							<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
							</span>
						</a>
						<ul class="treeview-menu">
							<li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
							<li>
							<a href="#"><i class="fa fa-circle-o"></i> Level Two
								<span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
								</span>
							</a>
							<ul class="treeview-menu">
								<li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
								<li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
							</ul>
							</li>
						</ul>
						</li>
						<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
					</ul>
					</li>
					<li><a href="#"><span style="color: #333;">page</span></a></li>
					<li class="header">LABELS</li>
					<li><a href="#"><span style="color: #333;">Important</span></a></li>
					<li><a href="#"><span style="color: #333;">Warning</span></a></li>
					<li><a href="#"><span style="color: #333;">Information</span></a></li>
				</ul>
				</section>
				<!-- /.sidebar -->
			</aside>
	</c:if>
	<!-- 세션이 없으면 -->
	<c:if test="${empty sessionScope.SEQ_MNG}">
	</c:if>
</span>
<script>
function goMain() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/console/login/main.web";
	frmMain.submit();
}

function goMyPage() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/console/myPage/index.web";
	frmMain.submit();
}

function goLogout() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/console/login/logout.web";
	frmMain.submit();
}

function goMemberList() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/console/users/member/list.web";
	frmMain.submit();
}

function goManagersList() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/console/users/managers/list.web";
	frmMain.submit();
}

function goProductList() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/console/product/list.web";
	frmMain.submit();
}

function goProductReg() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/console/product/productReg.web";
	frmMain.submit();
}

function goStatistics() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/console/statistics/index.web";
	frmMain.submit();
}

function goStatistics1() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/console/statistics/index1.web";
	frmMain.submit();
}

function goStatistics2() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/console/statistics/index2.web";
	frmMain.submit();
}


function goBuyList() {
	
	var frmMain = document.getElementById("frmMain");
	
	document.getElementById("cd_state").value = "";
	frmMain.action = "/console/buy/list.web";
	frmMain.submit();
}

function consolegoList(value) {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.cd_bbs_type.setAttribute("value", value);
	frmMain.action = "/console/center/board/list.web";
	frmMain.submit();
}
</script>