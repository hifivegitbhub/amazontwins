<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
     //치환 변수 선언합니다.
      pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
      pageContext.setAttribute("br", "<br/>"); //br 태그
%> 
<head>
 <title>Comazon.com: Search result</title>
</head>
<body>
	<div class="clear"></div>
	<div id="sorting">
		<ul>
			<li><a class="active" href="#"><spring:message code="searchpage.pricelowtohigh" text="*" /></a></li>
			<li><a href="#"><spring:message code="searchpage.pricehightolow" text="*" /></a></li>
			<li><a style="border: currentColor; border-image: none;" href="#"><spring:message code="searchpage.publicationdate" text="*" /></a></li>
		</ul>
	</div>
	<table id="list_view">
		<tbody>
		  <c:forEach var="item" items="${goodsList }"> 
			<tr>
				<td class="goods_image">
					<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}">
						<%-- <img width="140" alt="" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=main.jpg"> --%>
						<img width="140" alt="" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
					</a>
				</td>
				<td class="goods_description">
					<h2>
						<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">${item.goods_title }</a>
					</h2>
					<c:set var="goods_pub_date" value="${item.goods_published_date }" />
				   <c:set var="arr" value="${fn:split(goods_pub_date,' ')}" />
					<div class="writer_press"  ><spring:message code="searchpage.by" text="*" /> ${item.goods_writer}
						| ${item.goods_publisher} | <c:out value="${arr[0]}" />
					</div>
				</td>
				<td class="price"><span>$${item.goods_price}</span><br>
					<strong>
					 <fmt:formatNumber value="${item.goods_price*0.9}" type="number" var="discounted_price" />
			               $${discounted_price}
					</strong><br>(10% <spring:message code="searchpage.off" text="*" />)
				</td>
				<td><input type="checkbox" value=""></td>
				<td class="buy_btns">
					<UL>
						<li><a href="#"><spring:message code="searchpage.addtocart" text="*" /></a></li>
						<li><a href="#"><spring:message code="searchpage.buynow" text="*" /></a></li>
						<li><a href="#"><spring:message code="searchpage.compare" text="*" /></a></li>
					</UL>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="clear"></div>
	<div id="page_wrap">
		<ul id="page_control">
			<li><a class="no_border" href="#"><spring:message code="searchpage.prev" text="*" /></a></li>
			<c:set var="page_num" value="0" />
			<c:forEach var="count" begin="1" end="10" step="1">
				<c:choose>
					<c:when test="${count==1 }">
						<li><a class="page_contrl_active" href="#">${count+page_num*10 }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="#">${count+page_num*10 }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li><a class="no_border" href="#"><spring:message code="searchpage.next" text="*" /></a></li>
		</ul>
	</div>