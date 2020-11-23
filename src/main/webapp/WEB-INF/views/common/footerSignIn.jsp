<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<div id="footer_wrap">
	<div id="company">
		<ul>
			<li><a href="#"><spring:message code="footer.conditionsofuse" text="*" /></a></li>
			<li><a href="#"><spring:message code="footer.privacynotice" text="*" /></a></li>
			<li><a href="#"><spring:message code="footer.interestbased" text="*" /></a></li>
		</ul>
		<spring:message code="footer.comazon" text="*" />
	</div>
</div>