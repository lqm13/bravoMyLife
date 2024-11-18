<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>

<c:if test="${surveyDatas.cd_ctg_b == '3' && surveyDatas.cd_ctg_m == '1'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>남성에 더 알맞은 제품</span>
		<span><span style="color: #858585;"># </span>고객님께 추천 드리는 남성용 1위 인기 상품</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '3' && surveyDatas.cd_ctg_m == '2'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>여성에 더 알맞은 제품</span>
		<span><span style="color: #858585;"># </span>고객님께 추천 드리는 여성용 1위 인기 상품</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '1'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>혈당상승 억제에 도움을 줍니다</span>
		<span><span style="color: #858585;"># </span>혈행 개선에 도움을 줍니다</span>
		<span><span style="color: #858585;"># </span>높은 혈압감소에 도움을 줍니다</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '2'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>항산화 질병예방에 도움을 줍니다</span>
		<span><span style="color: #858585;"># </span>감염과 싸우는 면역 체계를 강화합니다</span>
		<span><span style="color: #858585;"># </span>노화 방지,만성질환이 예방됩니다</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '3'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>암과 심장 질환, 천식의 위험을 낮춥니다</span>
		<span><span style="color: #858585;"># </span>자가 면역질환 위험을 낮춥니다</span>
		<span><span style="color: #858585;"># </span>몸속의 염증 수치를 낮추는 데 도움이 됩니다</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '4'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>뼈의 유지에 필요한 구성 성분을 공급합니다.</span>
		<span><span style="color: #858585;"># </span>골다공증 발생위험 을 감소합니다</span>
		<span><span style="color: #858585;"># </span>치아 건강에 도움줍니다</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '5'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>피로 예방에 도웁됩니다</span>
		<span><span style="color: #858585;"># </span>피로해소에 도움줍니다</span>
		<span><span style="color: #858585;"># </span>영양이 풍부합니다</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '6'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>황반색소 밀도 유지에 도움을 줍니다</span>
		<span><span style="color: #858585;"># </span>눈건강 과 생활 확력에도 도움을 받을수 있습니다</span>
		<span><span style="color: #858585;"># </span>야맹증에 도웁됩니다</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '7'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>장운동성을 높혀줍니다</span>
		<span><span style="color: #858585;"># </span>영양소를 잘 흡수해 줍니다</span>
		<span><span style="color: #858585;"># </span>배변에 도웁을 줍니다</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '8'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>치매 예방에 도웁됩니다</span>
		<span><span style="color: #858585;"># </span>인지력을 개선해줍니다</span>
		<span><span style="color: #858585;"># </span>유해 산소로 부터 세포를 보호합니다</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '9'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>에너지 생성 및 신경발달에 도웁됩니다</span>
		<span><span style="color: #858585;"># </span>간세포를 보호해줍니다</span>
		<span><span style="color: #858585;"># </span>갑상선 호르몬을 합성해줍니다</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '1'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>콜레 스테롤 조절에 도움줍니다</span>
		<span><span style="color: #858585;"># </span>심혈관 건강을 증진시킵니다</span>
		<span><span style="color: #858585;"># </span>혈당을 조절 합니다</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '2'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>중성지방 수치를 감소합니다</span>
		<span><span style="color: #858585;"># </span>혈행 개선, 혈중 중성지질 개선</span>
		<span><span style="color: #858585;"># </span>기억력 개선</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '3'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>항산화 작용과 면역력 증진</span>
		<span><span style="color: #858585;"># </span>시력보호 와 면역력 강화</span>
		<span><span style="color: #858585;"># </span>뼈 건강과 칼슘흡수</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '4'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>소화를 촉진합니다</span>
		<span><span style="color: #858585;"># </span>염증성 장질환 등의 여러 질환을 개선합니다</span>
		<span><span style="color: #858585;"># </span>각종 감염성 질환의 억제에 도웁됩니다</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '5'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>관절 건강에 도웁됩니다</span>
		<span><span style="color: #858585;"># </span>염증 및 통증 완화에 도움줍니다</span>
		<span><span style="color: #858585;"># </span>항균 효과가 있어서 감영 예방에 도웁됩니다</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '6'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>눈의 피로획복,시력을 개선합니다</span>
		<span><span style="color: #858585;"># </span>백내장 예방과 개선에 도움줍니다</span>
		<span><span style="color: #858585;"># </span>황반변성 예방과 개선에 도움줍니다</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '7'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>동맥의 경화 증상을 완화시킵니다</span>
		<span><span style="color: #858585;"># </span>이명(귀의 울림)을 개선해줍니다</span>
		<span><span style="color: #858585;"># </span>피부 주름 개선에 도웁됩니다</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '8'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>근육 회복 및 강화를 도와줍니다</span>
		<span><span style="color: #858585;"># </span>면역력을 강화시킵니다</span>
		<span><span style="color: #858585;"># </span>혈관 확장 및 혈액순환 개선에 도웁됩니다</span>
	</div>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '9'}">
	<div class="survey-ingredient-describe" >
		<span><span style="color: #858585;"># </span>해독 작용이 있습니다</span>
		<span><span style="color: #858585;"># </span>당뇨에 효과를 보입니다</span>
		<span><span style="color: #858585;"># </span>노화 방지에 좋습니다</span>
	</div>
</c:if>
