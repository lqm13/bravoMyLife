<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/common/error-web.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/common/header.jsp" %>
</head>
<body>
<div class="container">
	<header></header>
	<section class="content">
		<article>
			<div id="box_error">
				<p><img src="/image/icon_error.gif" /></p>
				<c:choose>
				<c:when test="${systemErrorDto.code == 'S404' or systemErrorDto.code == '404'}">
					<p>FILE NOT FOUND</p>
				</c:when>
				<c:otherwise>
					<p>SYSTEM ERROR</p>
				</c:otherwise>
				</c:choose>
				<!--
				<p>CODE: [${systemErrorDto.code}]</p>
				<p>CODE_DESC: [${systemErrorDto.code_desc}]</p>
				-->
				<p><a href="/" target="_top">[HOME]</a>&nbsp;<a href="javascript: history.back();">[BACK]</a></p>
			</div>
		</article>
	</section>
	<footer>
	</footer>
</div>
</body>
</html>