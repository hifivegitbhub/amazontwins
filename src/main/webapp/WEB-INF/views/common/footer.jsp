<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<div id="footer_menu_wrap">
	<ul>
		<li><a href="#"><spring:message code="footer.careers" text="*" /></a></li>
		<li><a href="#"><spring:message code="footer.blog" text="*" /></a></li>
		<li><a href="#"><spring:message code="footer.aboutcomazon" text="*" /></a></li>
		<li><a href="#"><spring:message code="footer.sustainability" text="*" /></a></li>
		<li><a href="#"><spring:message code="footer.investorrelations" text="*" /></a></li>
		<li><a href="#"><spring:message code="footer.comazonassistant" text="*" /></a></li>
		<li><a href="#"><spring:message code="footer.help" text="*" /></a></li>
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
			<li><a href="#"><spring:message code="footer.conditionsofuse" text="*" /></a></li>
			<li><a href="#"><spring:message code="footer.privacynotice" text="*" /></a></li>
			<li><a href="#"><spring:message code="footer.interestbased" text="*" /></a></li>
			<li><spring:message code="footer.comazon" text="*" /></li>
		</ul>
	</div>
</div>