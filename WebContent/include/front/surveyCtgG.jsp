<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>

<c:if test="${cd_ctg_mG == '1'}">
		남성에 좋은 건강기능식품을 추천 드리겠습니다.
</c:if>

<c:if test="${cd_ctg_mG == '2'}">
		여성에 좋은 건강기능식품을 추천 드리겠습니다.
</c:if>

