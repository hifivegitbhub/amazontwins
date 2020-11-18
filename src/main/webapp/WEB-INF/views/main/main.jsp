<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  

<div id="ad_main_banner">
	<ul class="bjqs">	 	
		<li><img width="994" height="180" src="${contextPath}/resources/image/main_banner1.jpg"></li>
		<li><img width="994" height="180" src="${contextPath}/resources/image/main_banner2.jpg"></li>
		<li><img width="994" height="180" src="${contextPath}/resources/image/main_banner3.jpg"></li> 
	</ul>
</div>
<div class="main_book">
	<c:set var="goods_count" value="0" />
	<a href="#" class="more"><spring:message code="main.seemore" text="*" /></a>
	<h3><spring:message code="main.bestsellers" text="*" /></h3>	
	<c:forEach var="item" items="${goodsMap.bestseller }">
		<c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}">
				<img class="link"  src="${contextPath}/resources/image/1px.gif"> 
			</a>
			 
			<img src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=main.jpg">
			<%-- <img src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"> --%>
			
			<div class="title">
				<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}">${item.goods_title }</a>
			</div> 
			
			<div class="price">
		    	<fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
				<span class="comazon"><spring:message code="main.comazonprice" text="*" /></span> <span class="goods">$${goods_price}</span>
			</div>
		</div>
  </c:forEach>
</div>
<!-- <div class="clear"></div> -->
<%-- <div id="ad_sub_banner">
	<img width="770" height="117" src="${contextPath}/resources/image/sub_banner01.jpg">
</div> --%>
<div class="main_book" >
<c:set  var="goods_count" value="0" />
	<a href="#" class="more"><spring:message code="main.seemore" text="*" /></a>
	<h3><spring:message code="main.newreleases" text="*" /></h3>
	<c:forEach var="item" items="${goodsMap.newbook }" >
		<c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
				<img class="link"  src="${contextPath}/resources/image/1px.gif"> 
			</a>
		<img src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=main.jpg">
		 <%-- <img src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"> --%>
		
		<div class="title">
			<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}">${item.goods_title }</a>
		</div>
			 
		<div class="price">
			<fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
			<span class="comazon"><spring:message code="main.comazonprice" text="*" /></span> <span class="goods">$${goods_price}</span>
		</div>
	</div>
	 <c:if test="${goods_count==15   }">
     <!-- <div class="book">
       <font size=20> <a href="#">more</a></font>
     </div> -->
   </c:if>
	</c:forEach>
</div>

<!-- <div class="clear"></div> -->
<%-- <div id="ad_sub_banner">
	<img width="770" height="117" src="${contextPath}/resources/image/sub_banner02.jpg">
</div> --%>


<div class="main_book" >
<c:set  var="goods_count" value="0" />
	<a href="#" class="more"><spring:message code="main.seemore" text="*" /></a>
	<h3><spring:message code="main.steadysellers" text="*" /></h3>
	<c:forEach var="item" items="${goodsMap.steadyseller }" >
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
		  <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
	       <img class="link" src="${contextPath}/resources/image/1px.gif"> 
	      </a>
		 <img src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=main.jpg">
		 <%-- <img src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"> --%>
		
		<div class="title">
			<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}">${item.goods_title }</a>
		</div> 
		
		<div class="price">
	    	<fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
			<span class="comazon"><spring:message code="main.comazonprice" text="*" /></span> <span class="goods">$${goods_price}</span>
		</div>
	</div>
	 <%-- <c:if test="${goods_count==15   }">
     <div class="book">
       <font size=20> <a href="#">See more</a></font>
     </div>
   </c:if> --%>
	</c:forEach>
</div>

   
   