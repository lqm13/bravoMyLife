<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-lg-12" style="padding: 0 !important;">
	<div>
		<h6 class="lowgnb-title">성분별</h6>
		<h6 class="coupon__link" style="letter-spacing: 1.5px; border: none">
			<c:choose>
				<c:when test="${paging.cd_ctg_m == 0}">
					<a href="javascript:goTypeI('pol', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">폴리코사놀</a>
					<a href="javascript:goTypeI('omg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">오메가-3</a>
					<a href="javascript:goTypeI('min', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">비타민/미네랄</a>
					<a href="javascript:goTypeI('bac', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">유산균</a>
					<a href="javascript:goTypeI('msm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">글루코사민/MSM</a>
					<a href="javascript:goTypeI('rut', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">루테인</a>
					<a href="javascript:goTypeI('kou', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">코큐텐</a>
					<a href="javascript:goTypeI('arg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">아르기닌</a>
					<a href="javascript:goTypeI('mik', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">밀크씨슬</a>
				</c:when>
				<c:otherwise>
					<c:if test="${paging.cd_ctg_m == 1}">
					<a href="javascript:goTypeI('pol', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">폴리코사놀</a>
					<a href="javascript:goTypeI('omg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">오메가-3</a>
					<a href="javascript:goTypeI('min', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">비타민/미네랄</a>
					<a href="javascript:goTypeI('bac', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">유산균</a>
					<a href="javascript:goTypeI('msm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">글루코사민/MSM</a>
					<a href="javascript:goTypeI('rut', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">루테인</a>
					<a href="javascript:goTypeI('kou', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">코큐텐</a>
					<a href="javascript:goTypeI('arg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">아르기닌</a>
					<a href="javascript:goTypeI('mik', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">밀크씨슬</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 2}">
					<a href="javascript:goTypeI('pol', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">폴리코사놀</a>
					<a href="javascript:goTypeI('omg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">오메가-3</a>
					<a href="javascript:goTypeI('min', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">비타민/미네랄</a>
					<a href="javascript:goTypeI('bac', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">유산균</a>
					<a href="javascript:goTypeI('msm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">글루코사민/MSM</a>
					<a href="javascript:goTypeI('rut', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">루테인</a>
					<a href="javascript:goTypeI('kou', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">코큐텐</a>
					<a href="javascript:goTypeI('arg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">아르기닌</a>
					<a href="javascript:goTypeI('mik', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">밀크씨슬</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 3}">
					<a href="javascript:goTypeI('pol', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">폴리코사놀</a>
					<a href="javascript:goTypeI('omg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">오메가-3</a>
					<a href="javascript:goTypeI('min', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">비타민/미네랄</a>
					<a href="javascript:goTypeI('bac', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">유산균</a>
					<a href="javascript:goTypeI('msm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">글루코사민/MSM</a>
					<a href="javascript:goTypeI('rut', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">루테인</a>
					<a href="javascript:goTypeI('kou', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">코큐텐</a>
					<a href="javascript:goTypeI('arg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">아르기닌</a>
					<a href="javascript:goTypeI('mik', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">밀크씨슬</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 4}">
					<a href="javascript:goTypeI('pol', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">폴리코사놀</a>
					<a href="javascript:goTypeI('omg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">오메가-3</a>
					<a href="javascript:goTypeI('min', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">비타민/미네랄</a>
					<a href="javascript:goTypeI('bac', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">유산균</a>
					<a href="javascript:goTypeI('msm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">글루코사민/MSM</a>
					<a href="javascript:goTypeI('rut', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">루테인</a>
					<a href="javascript:goTypeI('kou', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">코큐텐</a>
					<a href="javascript:goTypeI('arg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">아르기닌</a>
					<a href="javascript:goTypeI('mik', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">밀크씨슬</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 5}">
					<a href="javascript:goTypeI('pol', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">폴리코사놀</a>
					<a href="javascript:goTypeI('omg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">오메가-3</a>
					<a href="javascript:goTypeI('min', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">비타민/미네랄</a>
					<a href="javascript:goTypeI('bac', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">유산균</a>
					<a href="javascript:goTypeI('msm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">글루코사민/MSM</a>
					<a href="javascript:goTypeI('rut', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">루테인</a>
					<a href="javascript:goTypeI('kou', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">코큐텐</a>
					<a href="javascript:goTypeI('arg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">아르기닌</a>
					<a href="javascript:goTypeI('mik', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">밀크씨슬</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 6}">
					<a href="javascript:goTypeI('pol', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">폴리코사놀</a>
					<a href="javascript:goTypeI('omg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">오메가-3</a>
					<a href="javascript:goTypeI('min', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">비타민/미네랄</a>
					<a href="javascript:goTypeI('bac', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">유산균</a>
					<a href="javascript:goTypeI('msm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">글루코사민/MSM</a>
					<a href="javascript:goTypeI('rut', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">루테인</a>
					<a href="javascript:goTypeI('kou', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">코큐텐</a>
					<a href="javascript:goTypeI('arg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">아르기닌</a>
					<a href="javascript:goTypeI('mik', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">밀크씨슬</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 7}">
					<a href="javascript:goTypeI('pol', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">폴리코사놀</a>
					<a href="javascript:goTypeI('omg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">오메가-3</a>
					<a href="javascript:goTypeI('min', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">비타민/미네랄</a>
					<a href="javascript:goTypeI('bac', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">유산균</a>
					<a href="javascript:goTypeI('msm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">글루코사민/MSM</a>
					<a href="javascript:goTypeI('rut', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">루테인</a>
					<a href="javascript:goTypeI('kou', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">코큐텐</a>
					<a href="javascript:goTypeI('arg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">아르기닌</a>
					<a href="javascript:goTypeI('mik', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">밀크씨슬</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 8}">
					<a href="javascript:goTypeI('pol', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">폴리코사놀</a>
					<a href="javascript:goTypeI('omg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">오메가-3</a>
					<a href="javascript:goTypeI('min', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">비타민/미네랄</a>
					<a href="javascript:goTypeI('bac', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">유산균</a>
					<a href="javascript:goTypeI('msm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">글루코사민/MSM</a>
					<a href="javascript:goTypeI('rut', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">루테인</a>
					<a href="javascript:goTypeI('kou', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">코큐텐</a>
					<a href="javascript:goTypeI('arg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">아르기닌</a>
					<a href="javascript:goTypeI('mik', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">밀크씨슬</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 9}">
					<a href="javascript:goTypeI('pol', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">폴리코사놀</a>
					<a href="javascript:goTypeI('omg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">오메가-3</a>
					<a href="javascript:goTypeI('min', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">비타민/미네랄</a>
					<a href="javascript:goTypeI('bac', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">유산균</a>
					<a href="javascript:goTypeI('msm', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">글루코사민/MSM</a>
					<a href="javascript:goTypeI('rut', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">루테인</a>
					<a href="javascript:goTypeI('kou', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">코큐텐</a>
					<a href="javascript:goTypeI('arg', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">아르기닌</a>
					<a href="javascript:goTypeI('mik', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">밀크씨슬</a>
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
			<li class="lowgnb-li-l"><a href="javascript:goTypeI('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
			<li class="lowgnb-li"><a href="javascript:goTypeI('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
			<li class="lowgnb-li"><a href="javascript:goTypeI('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
			<li class="lowgnb-li"><a href="javascript:goTypeI('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
			<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
				<ul class="dropdown">
					<li><a href="javascript:goTypeI('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
					<li><a href="javascript:goTypeI('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
					<li><a href="javascript:goTypeI('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
					<li><a href="javascript:goTypeI('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
					<li><a href="javascript:goTypeI('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
					<li><a href="javascript:goTypeI('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
					<li><a href="javascript:goTypeI('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
					<li><a href="javascript:goTypeI('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
					<li><a href="javascript:goTypeI('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
					<li><a href="javascript:goTypeI('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
				</ul>
			</li >
			<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
				<ul class="dropdown">
					<li><a href="javascript:goTypeI('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
					<li><a href="javascript:goTypeI('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
					<li><a href="javascript:goTypeI('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
					<li><a href="javascript:goTypeI('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
					<li><a href="javascript:goTypeI('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
					<li><a href="javascript:goTypeI('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
					<li><a href="javascript:goTypeI('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
				</ul>
			</li>
			<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeI('', '', '', '', '${paging.cd_ctg_m}', this);">
				<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
				<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
				<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
				<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
			</select>
			</c:when>
			<c:otherwise>
				<c:if test="${paging.filter == 'BestP' && paging.corp_nm == '' && paging.prd_type == ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeI('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-fontC">✔판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeI('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeI('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeI('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeI('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeI('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeI('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeI('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeI('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeI('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeI('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeI('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeI('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeI('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeI('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeI('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeI('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeI('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeI('', 'BestP', '', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == 'LowP' && paging.corp_nm == '' && paging.prd_type == ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeI('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-fontC">✔낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeI('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeI('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeI('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeI('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeI('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeI('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeI('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeI('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeI('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeI('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeI('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeI('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeI('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeI('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeI('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeI('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeI('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeI('', 'LowP', '', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == 'HighP' && paging.corp_nm == '' && paging.prd_type == ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeI('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-fontC">✔높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeI('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeI('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeI('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeI('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeI('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeI('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeI('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeI('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeI('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeI('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeI('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeI('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeI('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeI('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeI('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeI('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeI('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeI('', 'HighP', '', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == 'DtReg' && paging.corp_nm == '' && paging.prd_type == ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeI('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-fontC">✔등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeI('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeI('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeI('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeI('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeI('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeI('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeI('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeI('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeI('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeI('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeI('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeI('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeI('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeI('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeI('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeI('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeI('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeI('', 'DtReg', '', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == '' && paging.corp_nm != '' && paging.prd_type == ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeI('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-fontC">✔브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeI('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeI('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeI('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeI('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeI('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeI('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeI('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeI('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeI('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeI('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeI('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeI('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeI('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeI('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeI('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeI('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeI('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeI('', '', '${paging.corp_nm}', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == '' && paging.corp_nm == '' && paging.prd_type != ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeI('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeI('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeI('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeI('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeI('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeI('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeI('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeI('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeI('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeI('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeI('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeI('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-fontC">✔제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeI('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeI('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeI('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeI('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeI('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeI('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeI('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeI('', '', '', '${paging.prd_type}', '${paging.cd_ctg_m}', this);">
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