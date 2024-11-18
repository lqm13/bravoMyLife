<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="main-header">
	<a href="javascript:goIndex()" class="logo">
	<span class="logo-lg"><b>관리자</b></span>
	</a>
</header>
<span style="float:right;line-height:43px;vertical-align:middle;">

</span>
<script>
function goIndex() {
	
	var frmMain = document.getElementById("frmMain");
	
	frmMain.action = "/console/index.web";
	frmMain.submit();
}
</script>