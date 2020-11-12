<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<div id="footer_menu_wrap">
	<ul>
		<li><a href="#">Careers</a></li>
		<li><a href="#">Blog</a></li>
		<li><a href="#">About Comazon</a></li>
		<li><a href="#">Sustainability</a></li>
		<li><a href="#">Investor Relations</a></li>
		<li><a href="#">Comazon Assistant</a></li>
		<li><a href="#">Help</a></li>
	</ul>
</div>
<!-- <div class="clear"></div> -->
<div id="footer_wrap">
	<div id="logo">
		<a href="${contextPath}/main/main.do">
			<img height="70" alt="comazon" src="${contextPath}/resources/image/comazon_logo.png">
		</a>
	</div>
	<%-- <a href="#"><img width="147px"  height="62px" alt="Booktopia" src="${contextPath}/resources/image/Booktopia_Logo2.jpg" /></a> --%>
	<div id="company">
		<ul>
			<li><a href="#">Conditions of Use</a></li>
			<li><a href="#">Privacy Notice</a></li>
			<li><a href="#">Interest-Based</a></li>
			<li>Ads© 1996-2020, Amazon.com, Inc. or its affiliates</li>
		</ul>
	</div>
</div>