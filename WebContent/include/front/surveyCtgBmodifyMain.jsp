<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>

<c:if test="${surveyDatas.cd_ctg_b == '3' && surveyDatas.cd_ctg_m == '1'}">
	<h1 class="survey-h1-3">
		<br>남성이신 고객님께
		<br>추천드리는 건강기능 식품
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '3' && surveyDatas.cd_ctg_m == '2'}">
	<h1 class="survey-h1-3">
		<br>여성이신 고객님께 
		<br>추천드리는 건강기능 식품
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '1'}">
	<h1 class="survey-h1-3">
		<br>혈관·혈액 순환에 걱정되는 고객님께
		<br>추천드리는 건강기능식품
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '2'}">
	<h1 class="survey-h1-3">
		<br>항산화·면역력에 필요를 느끼는 고객님께
		<br>추천드리는 건강기능식품
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '3'}">
	<h1 class="survey-h1-3">
		<br>염증·항염에 걱정되는 고객님께
		<br>추천드리는 건강기능식품
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '4'}">
	<h1 class="survey-h1-3">
		<br>뼈·관절건강에 걱정되는 고객님께
		<br>추천드리는 건강기능식품
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '5'}">
	<h1 class="survey-h1-3">
		<br>피로감을 느끼시는 고객님께
		<br>추천드리는 건강기능식품
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '6'}">
	<h1 class="survey-h1-3">
		<br>눈건강에 걱정되는 고객님께
		<br>추천드리는 건강기능식품
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '7'}">
	<h1 class="survey-h1-3">
		<br>소화·장운동에 걱정되는 고객님께
		<br>추천드리는 건강기능식품
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '8'}">
	<h1 class="survey-h1-3">
		<br>두뇌 활동에 걱정되는 고객님께
		<br>추천드리는 건강기능식품
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '1' && surveyDatas.cd_ctg_m == '9'}">
	<h1 class="survey-h1-3">
		<br>위·간건강에 걱정되는 고객님께
		<br>추천드리는 건강기능식품
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '1'}">
	<h1 class="survey-h1-3">
		<br>곡물류를 자주 드시지 않은 고객님께 
		<br>추천하는 건강기능식품 - 폴리코사놀
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '2'}">
	<h1 class="survey-h1-3">
		<br>생선을 자주 드시지 않은 고객님께
		<br>추천하는 건강기능식품 - 오메가-3
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '3'}">
	<h1 class="survey-h1-3">
		<br>브로콜리를 자주 드시지 않은 고객님께
		<br>추천하는 건강기능식품 - 비타민/미네랄
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '4'}">
	<h1 class="survey-h1-3">
		<br>요거트를 자주 드시지 않은 고객님께
		<br>추천하는 건강기능식품 - 유산균
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '5'}">
	<h1 class="survey-h1-3">
		<br>조개류를 자주 드시지 않은 고객님께
		<br>추천하는 건강기능식품 - 글루코사민/MSM
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '6'}">
	<h1 class="survey-h1-3">
		<br>시금치를 자주 드시지 않은 고객님께
		<br>추천하는 건강기능식품 - 루테인
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '7'}">
	<h1 class="survey-h1-3">
		<br>소고기를 자주 드시지 않은 고객님께
		<br>추천하는 건강기능식품 - 코큐텐
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '8'}">
	<h1 class="survey-h1-3">
		<br>호두를 자주 드시지 않은 고객님께
		<br>추천하는 건강기능식품 - 아르기닌
	</h1>
</c:if>

<c:if test="${surveyDatas.cd_ctg_b == '2' && surveyDatas.cd_ctg_m == '9'}">
	<h1 class="survey-h1-3">
		<br>밀크씨슬 씨앗을 자주 드시지 않은 고객님께
		<br>추천하는 건강기능식품 - 밀크씨슬
	</h1>
</c:if>
