<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<script type="text/javascript">
</script>
<body>
	<div id="headerSignIn_wrap">	
		<div id="logo">
			<a href="${contextPath}/main/main.do">
				<img height="65" alt="comazon" src="${contextPath}/resources/image/comazon_logo_signIn.png">
			</a>
		</div>
	</div>
</body>
</html>