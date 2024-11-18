<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-lg-12" style="padding: 0 !important;">
	<div>
		<h6 class="lowgnb-title">대상별</h6>
		<h6 class="coupon__link" style="letter-spacing: 1.5px; border: none">
			<c:choose>
				<c:when test="${paging.cd_ctg_m == 0}">
					<a href="javascript:goTypeG('M', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">남성</a>
					<a href="javascript:goTypeG('F', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">여성</a>
				</c:when>
				<c:otherwise>
					<c:if test="${paging.cd_ctg_m == 1}">
						<a href="javascript:goTypeG('M', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">남성</a>
						<a href="javascript:goTypeG('F', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">여성</a>
					</c:if>
					<c:if test="${paging.cd_ctg_m == 2}">
						<a href="javascript:goTypeG('M', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link default">남성</a>
						<a href="javascript:goTypeG('F', '', '', '', '${paging.cd_ctg_m}', '');" class="ctg-link selected">여성</a>
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
			<li class="lowgnb-li-l"><a href="javascript:goTypeG('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
			<li class="lowgnb-li"><a href="javascript:goTypeG('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
			<li class="lowgnb-li"><a href="javascript:goTypeG('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
			<li class="lowgnb-li"><a href="javascript:goTypeG('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
			<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
				<ul class="dropdown">
					<li><a href="javascript:goTypeG('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
					<li><a href="javascript:goTypeG('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
					<li><a href="javascript:goTypeG('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
					<li><a href="javascript:goTypeG('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
					<li><a href="javascript:goTypeG('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
					<li><a href="javascript:goTypeG('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
					<li><a href="javascript:goTypeG('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
					<li><a href="javascript:goTypeG('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
					<li><a href="javascript:goTypeG('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
					<li><a href="javascript:goTypeG('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
				</ul>
			</li >
			<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
				<ul class="dropdown">
					<li><a href="javascript:goTypeG('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
					<li><a href="javascript:goTypeG('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
					<li><a href="javascript:goTypeG('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
					<li><a href="javascript:goTypeG('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
					<li><a href="javascript:goTypeG('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
					<li><a href="javascript:goTypeG('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
					<li><a href="javascript:goTypeG('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
				</ul>
			</li>
			<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeG('', '', '', '', '${paging.cd_ctg_m}', this);">
				<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
				<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
				<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
				<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
			</select>
			</c:when>
			<c:otherwise>
				<c:if test="${paging.filter == 'BestP' && paging.corp_nm == '' && paging.prd_type == ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeG('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-fontC">✔판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeG('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeG('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeG('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeG('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeG('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeG('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeG('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeG('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeG('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeG('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeG('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeG('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeG('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeG('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeG('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeG('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeG('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeG('', 'BestP', '', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == 'LowP' && paging.corp_nm == '' && paging.prd_type == ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeG('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-fontC">✔낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeG('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeG('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeG('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeG('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeG('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeG('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeG('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeG('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeG('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeG('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeG('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeG('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeG('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeG('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeG('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeG('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeG('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeG('', 'LowP', '', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == 'HighP' && paging.corp_nm == '' && paging.prd_type == ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeG('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-fontC">✔높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeG('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeG('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeG('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeG('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeG('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeG('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeG('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeG('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeG('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeG('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeG('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeG('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeG('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeG('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeG('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeG('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeG('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeG('', 'HighP', '', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == 'DtReg' && paging.corp_nm == '' && paging.prd_type == ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeG('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-fontC">✔등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeG('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeG('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeG('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeG('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeG('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeG('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeG('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeG('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeG('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeG('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeG('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeG('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeG('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeG('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeG('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeG('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeG('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeG('', 'DtReg', '', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == '' && paging.corp_nm != '' && paging.prd_type == ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeG('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-fontC">✔브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeG('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeG('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeG('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeG('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeG('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeG('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeG('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeG('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeG('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeG('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-font">제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeG('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeG('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeG('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeG('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeG('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeG('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeG('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeG('', '', '${paging.corp_nm}', '', '${paging.cd_ctg_m}', this);">
					<option value="10" <c:if test="${paging.linePerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20" <c:if test="${paging.linePerPage == 20}">selected</c:if>>20개씩보기</option>
					<option value="30" <c:if test="${paging.linePerPage == 30}">selected</c:if>>30개씩보기</option>
					<option value="40" <c:if test="${paging.linePerPage == 40}">selected</c:if>>40개씩보기</option>
				</select>
				</c:if>
				<c:if test="${paging.filter == '' && paging.corp_nm == '' && paging.prd_type != ''}">
					<li class="lowgnb-li-l"><a href="javascript:goTypeG('', 'BestP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">판매인기순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'LowP', '', '', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">낮은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'HighP', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">높은가격순</a></li>
					<li class="lowgnb-li"><a href="javascript:goTypeG('', 'DtReg', '','', '${paging.cd_ctg_m}', ${paging.linePerPage});" class="lowgnb-font">등록일순</a></li>
					<li class="lowgnb-li"><a class="lowgnb-font">브랜드</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeG('', '', 'YS에코비팜', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">YS에코비팜</a></li>
							<li><a href="javascript:goTypeG('', '', '나우푸드', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나우푸드</a></li>
							<li><a href="javascript:goTypeG('', '', '나트롤', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">나트롤</a></li>
							<li><a href="javascript:goTypeG('', '', '네오셀', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네오셀</a></li>
							<li><a href="javascript:goTypeG('', '', '네이처스웨이', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">네이처스웨이</a></li>
							<li><a href="javascript:goTypeG('', '', '노르딕내추럴스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">노르딕내추럴스</a></li>
							<li><a href="javascript:goTypeG('', '', '뉴트렉스', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트렉스</a></li>
							<li><a href="javascript:goTypeG('', '', '블루보넷', '', $'${paging.cd_ctg_m}', ${paging.linePerPage});">블루보넷</a></li>
							<li><a href="javascript:goTypeG('', '', '뉴트리콜로지', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">뉴트리콜로지</a></li>
							<li><a href="javascript:goTypeG('', '', '닥터스베스트', '', '${paging.cd_ctg_m}', ${paging.linePerPage});">닥터스베스트</a></li>
						</ul>
					</li >
					<li class="lowgnb-li"><a class="lowgnb-fontC">✔제품타입</a>
						<ul class="dropdown">
							<li><a href="javascript:goTypeG('', '', '', '1', '${paging.cd_ctg_m}', ${paging.linePerPage});">액상</a></li>
							<li><a href="javascript:goTypeG('', '', '', '2', '${paging.cd_ctg_m}', ${paging.linePerPage});">정</a></li>
							<li><a href="javascript:goTypeG('', '', '', '3', '${paging.cd_ctg_m}', ${paging.linePerPage});">캡슐</a></li>
							<li><a href="javascript:goTypeG('', '', '', '4', '${paging.cd_ctg_m}', ${paging.linePerPage});">베지 켑슐</a></li>
							<li><a href="javascript:goTypeG('', '', '', '5', '${paging.cd_ctg_m}', ${paging.linePerPage});">젤리</a></li>
							<li><a href="javascript:goTypeG('', '', '', '6', '${paging.cd_ctg_m}', ${paging.linePerPage});">분말</a></li>
							<li><a href="javascript:goTypeG('', '', '', '7', '${paging.cd_ctg_m}', ${paging.linePerPage});">츄어볼</a></li>
						</ul>
					</li>
				<select name="linePerPage" id="linePerPage" class="sale-select" onchange="javascript:goTypeG('', '', '', '${paging.prd_type}', '${paging.cd_ctg_m}', this);">
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