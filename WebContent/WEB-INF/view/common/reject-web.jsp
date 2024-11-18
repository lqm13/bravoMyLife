<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/common/reject-web.jsp" %>
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
				<p>ACCESS REJECT(Reason: You have to re-login or You don't have rights)</p>
				<p><a href="/" target="_top">[HOME]</a>&nbsp;<a href="javascript: history.back();">[BACK]</a></p>
			</div>
		</article>
	</section>
	<footer>
		<%@ include file="/include/common/footer.jsp" %>
	</footer>
</div>
</body>
</html>