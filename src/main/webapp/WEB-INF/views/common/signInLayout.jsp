<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<link href="${contextPath}/resources/css/comazon_signIn.css" rel="stylesheet" type="text/css" media="screen">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
</script>
	<title><tiles:insertAttribute name="title" /></title>
</head>

<body>
	<div id="outer_wrap">
		<div id="wrap">
			<header>
				 <tiles:insertAttribute name="header" />
			</header>
			
			<div class="clear"></div>
			
			<article>
			 	<tiles:insertAttribute name="body" />
			</article>
			
			<div class="clear"></div>
			
			<footer>
        		<tiles:insertAttribute name="footer" />
        	</footer>
		</div>
    </div>        	
</body>      
        
        