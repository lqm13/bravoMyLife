<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-lg-12" style="padding: 0 !important;">
	<div>
		<h6 class="lowgnb-title">기능별</h6>
		<h6 class="coupon__link" style="letter-spacing: 1.5px; border: none">
			<c:choose>
				<c:when test="${paging.cd_ctg_m == 0}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">위/간/갑상선</a>
				</c:when>
				<c:otherwise>
					<c:if test="${paging.cd_ctg_m == 1}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">위/간/갑상선</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 2}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">위/간/갑상선</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 3}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">위/간/갑상선</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 4}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">위/간/갑상선</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 5}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">위/간/갑상선</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 6}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">위/간/갑상선</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 7}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">위/간/갑상선</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 8}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">위/간/갑상선</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 9}">
					<a href="javascript:goTypeF('bld', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">혈당/혈행/혈압</a>
					<a href="javascript:goTypeF('imu', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">황산화/면역력</a>
					<a href="javascript:goTypeF('inf', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">염증/항염</a>
					<a href="javascript:goTypeF('jnt', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">관절/뼈/치아</a>
					<a href="javascript:goTypeF('rec', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">피로회복</a>
					<a href="javascript:goTypeF('eye', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">눈 건강</a>
					<a href="javascript:goTypeF('col', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">장 건강</a>
					<a href="javascript:goTypeF('brn', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">두뇌/기억력</a>
					<a href="javascript:goTypeF('stm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">위/간/갑상선</a>
					</c:if>
				</c:otherwise>
			</c:choose>
		</h6>
	</div>
	<h5 class="lowgnb-h5">전체 ${paging.totalLine}개[${paging.currentPage}/${paging.totalPage} 페이지]</h5>
	<h6 class="coupon__link" style="text-align: left; letter-spacing: 1.5px;">
		<ul>
		<c:choose>
		<c:when test="${paging.filter == '' && paging.corp_nm == '' && paging.prd_type == ''}">
			<li class="lowgnb-li-l"><a href="javascript:goTypeF('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
			<li class="lowgnb-li"><a href="javascript:goTypeF('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
			<li class="lowgnb-li"><a href="javascript:goTypeF('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
			<li class="lowgnb-li"><a href="javascript:goTypeF('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
			<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
				<ul class="dropdown">
					<li><a href="javascript:goTypeF('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
					<li><a href="javascript:goTypeF('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
					<li><a href="javascript:goTypeF('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
					<li><a href="javascript:goTypeF('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
					<li><a href="javascript:goTypeF('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
					<li><a href="javascript:goTypeF('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
					<li><a href="javascript:goTypeF('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
					<li><a href="javascript:goTypeF('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
					<li><a href="javascript:goTypeF('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
					<li><a href="javascript:goTypeF('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
				</ul>
			</li >
			<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
				<ul class="dropdown">
					<li><a href="javascript:goTypeF('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
					<li><a href="javascript:goTypeF('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
					<li><a href="javascript:goTypeF('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
					<li><a href="javascript:goTypeF('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
					<li><a href="javascript:goTypeF('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
					<li><a href="javascript:goTypeF('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
					<li><a href="javascript:goTypeF('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
				</ul>
			</li>
			<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeF('', '', '', '', '${paging.cd_ctg_m}', this);">
				<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
				<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
				<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
				<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
			</select>
			</c:when>
			<c:otherwise>
				<c:if test="${paging.filter == 'BestP' && paging.corp_nm == '' && paging.prd_type == ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeF('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-fontC">✔판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeF('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeF('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeF('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeF('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeF('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeF('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeF('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeF('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeF('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeF('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeF('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeF('', 'BestP', '', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == 'LowP' && paging.corp_nm == '' && paging.prd_type == ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeF('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-fontC">✔낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeF('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeF('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeF('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeF('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeF('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeF('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeF('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeF('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeF('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeF('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeF('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeF('', 'LowP', '', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == 'HighP' && paging.corp_nm == '' && paging.prd_type == ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeF('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-fontC">✔높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeF('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeF('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeF('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeF('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeF('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeF('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeF('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeF('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeF('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeF('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeF('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeF('', 'HighP', '', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == 'DtReg' && paging.corp_nm == '' && paging.prd_type == ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeF('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-fontC">✔등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeF('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeF('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeF('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeF('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeF('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeF('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeF('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeF('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeF('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeF('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeF('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeF('', 'DtReg', '', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == '' && paging.corp_nm != '' && paging.prd_type == ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeF('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-fontC">✔브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeF('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeF('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeF('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeF('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeF('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeF('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeF('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeF('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeF('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeF('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeF('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeF('', '', '${paging.corp_nm}', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == '' && paging.corp_nm == '' && paging.prd_type != ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeF('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeF('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeF('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeF('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeF('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeF('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeF('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeF('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeF('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeF('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-fontC">✔제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeF('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeF('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeF('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeF('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeF('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeF('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeF('', '', '', '${paging.prd_type}', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
			</c:otherwise>
			</c:choose>
		</ul>
	</h6>
</div>