<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<c:if test='${not empty message }'>
<script>
window.onload=function()
{
  result();
}

function result(){
	alert("To better protect your account, please re-enter your ID or password");
}
</script>
</c:if>
</head>
<body>
	<div id="outer_wrap">
		<div id="wrap">
			<h1>Sign-In</h1>
			<div id="detail_table">
				<form action="${contextPath}/member/login.do" method="post">
					<spring:message code="mainSignIn.id" text="*" /><br>
					<input name="member_id" type="text" size="20" class="input"/>
					<br><spring:message code="mainSignIn.pw" text="*" /><br>
					<input name="member_pw" type="password" size="20" class="input"/>
					
					<br>
					
					<input type="submit" value="<spring:message code="mainSignIn.continue" text="*" />" class="signIn_btn"/>
					
					<br><br>
					
						<spring:message code="mainSignIn.agree" text="*" />
						<a href="#"><spring:message code="mainSignIn.condition" text="*" /></a> <spring:message code="mainSignIn.and" text="*" />
						<a href="#"><spring:message code="mainSignIn.privacy" text="*" /></a>
					
					<br><br>   
					   <a href="#"><spring:message code="mainSignIn.needhelp" text="*" /></a> 
				</form>
			</div>
		</div>
		<div id="sub_wrap">
			<spring:message code="mainSignIn.new" text="*" /><br><br><hr>
			<br>
			<input type="button" value="<spring:message code="mainSignIn.createaccount" text="*" />" class="signUp_btn" onclick="location.href='${contextPath}/member/addMember.do'">
		</div>
	</div>
</body>
</html>