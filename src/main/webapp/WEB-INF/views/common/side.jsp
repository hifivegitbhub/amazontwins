<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
	
<nav>
<ul>
<c:choose>
<c:when test="${side_menu=='admin_mode' }">
   <li>
		<H3>주요기능</H3>
		<ul>
			<li><a href="${contextPath}/admin/goods/adminGoodsMain.do">상품관리</a></li>
			<li><a href="${contextPath}/admin/order/adminOrderMain.do">주문관리</a></li>
			<li><a href="${contextPath}/admin/member/adminMemberMain.do">회원관리</a></li>
			<li><a href="#">배송관리</a></li>
			<li><a href="#">게시판관리</a></li>
		</ul>
	</li>
</c:when>
<c:when test="${side_menu=='my_page' }">
	<li>
		<h3>주문내역</h3>
		<ul>
			<li><a href="${contextPath}/mypage/listMyOrderHistory.do">주문내역/배송 조회</a></li>
			<li><a href="#">반품/교환 신청 및 조회</a></li>
			<li><a href="#">취소 주문 내역</a></li>
			<li><a href="#">세금 계산서</a></li>
		</ul>
	</li>
	<li>
		<h3>정보내역</h3>
		<ul>
			<li><a href="${contextPath}/mypage/myDetailInfo.do">회원정보관리</a></li>
			<li><a href="#">나의 주소록</a></li>
			<li><a href="#">개인정보 동의내역</a></li>
			<li><a href="#">회원탈퇴</a></li>
		</ul>
	</li>
</c:when>
<c:otherwise>
	<li>
		<h3><spring:message code="side.popularincomazon" text="*" /></h3>
		<ul>
			<li><a href="#"><spring:message code="side.comazonbookdeals" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.bestseller" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.editorpick" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.comazonunlimited" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.summerreading" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.ebooksaudible" text="*" /></a></li>
		</ul>
	</li>
	<li>
		<h3><spring:message code="side.moreincomazon" text="*" /></h3>
		<ul>
			<li><a href="#"><spring:message code="side.comazoncharts" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.hotlyanticipared" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.firstreads" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.authorfollow" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.comicsandnovels" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.comazonclassics" text="*" /></a></li>
		</ul>
	</li>
	<li>
		<h3><spring:message code="side.comazonbooks" text="*" /></h3>
		<ul>
			<li><a href="#"><spring:message code="side.artsphotography" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.biographiesmemoirs" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.businessmoney" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.chilrenebooks" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.comicsmanga" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.computertechnology" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.cookbooksfood" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.craftshobbies" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.educationteaching" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.engineering" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.foreignlanguages" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.healthfitness" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.history" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.humor" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.law" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.lesbiangay" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.literature" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.medicalebooks" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.mystery" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.nonfiction" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.parenting" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.politics" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.reference" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.religion" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.romance" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.sciencemath" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.sciencefiction" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.selfhelp" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.sportsoutdoors" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.teenyoung" text="*" /></a></li>
			<li><a href="#"><spring:message code="side.travel" text="*" /></a></li>
		</ul>
	</li>
 </c:otherwise>
</c:choose>	
</ul>
</nav>
<div class="clear"></div>
<div id="refine">
	<ul>
		<li>
			<h2><spring:message code="side.refiendby" text="*" /></h2>
			<h3><spring:message code="side.author" text="*" /></h3>
			<ul>
				<li><a href="#">John Grisham</a></li>
				<li><a href="#">Lee Child</a></li>
				<li><a href="#">Janet Evanovich</a></li>
				<li><a href="#">Brandon Sanderson</a></li>
				<li><a href="#">Tana French</a></li>
				<li><a href="#">Ken Follett</a></li>
				<li><a href="#">Katie Sise</a></li>
			</ul>
		</li>
		<li>
			<h3><spring:message code="side.series" text="*" /></h3>
			<ul>
				<li><input class="checkbox" type="checkbox" id="John_Grisham" name="John_Grisham" value="John Grisham">
				<label class="checkbox" for="John_Grisham">John Grisham</label></li>
				<li><input class="checkbox" type="checkbox" id="Lee_Child" name="Lee_Child" value="Lee Child">
				<label class="checkbox" for="Lee_Child">Lee Child</label></li>
				<li><input class="checkbox" type="checkbox" id="Janet_Evanovich" name="Janet_Evanovich" value="Janet Evanovich">
				<label class="checkbox" for="Janet_Evanovich">Janet Evanovich</label></li>
				<li><input class="checkbox" type="checkbox" id="Brandon_Sanderson" name="Brandon_Sanderson" value="Brandon Sanderson">
				<label class="checkbox" for="Brandon_Sanderson">Brandon Sanderson</label></li>
				<li><input class="checkbox" type="checkbox" id="Tana_French" name="Tana_French" value="Tana French">
				<label class="checkbox" for="Tana_French">Tana French</label></li>
				<li><input class="checkbox" type="checkbox" id="Ken_Follett" name="Ken_Follett" value="Ken Follett">
				<label class="checkbox" for="Ken_Follett">Ken Follett</label></li>
				<li><input class="checkbox" type="checkbox" id="Katie_Sise" name="Katie_Sise" value="Katie Sise">
				<label class="checkbox" for="Katie_Sise">Katie Sise</label></li>
			</ul>
		</li>
		<li>
			<h3><spring:message code="side.language" text="*" /></h3>
			<ul>
				<li><input class="checkbox" type="checkbox" id="English" name="English" value="English">
				<label class="checkbox" for="English"><spring:message code="side.languageenglish" text="*" /></label></li>
				<li><input class="checkbox" type="checkbox" id="German" name="German" value="German">
				<label class="checkbox" for="German"><spring:message code="side.languagegerman" text="*" /></label></li>
				<li><input class="checkbox" type="checkbox" id="French" name="French" value="French">
				<label class="checkbox" for="French"><spring:message code="side.languagefrench" text="*" /></label></li>
				<li><input class="checkbox" type="checkbox" id="Spanish" name="Spanish" value="Spanish">
				<label class="checkbox" for="Spanish"><spring:message code="side.languagespanish" text="*" /></label></li>
				<li><input class="checkbox" type="checkbox" id="Chinese" name="Chinese" value="Chinese">
				<label class="checkbox" for="Chinese"><spring:message code="side.languagechinese" text="*" /></label></li>
				<li><input class="checkbox" type="checkbox" id="Afrikaans" name="Afrikaans" value="Afrikaans">
				<label class="checkbox" for="Afrikaans"><spring:message code="side.languageafrikaans" text="*" /></label></li>
				<li><input class="checkbox" type="checkbox" id="Portuguese" name="Portuguese" value="Portuguese">
				<label class="checkbox" for="Portuguese"><spring:message code="side.languageportuguese" text="*" /></label></li>
			</ul>
		</li>
		<li>
			<h3><spring:message code="side.accessibility" text="*" /></h3>
			<ul>
				<li><input class="checkbox" type="checkbox" id="Supported" name="Supported" value="Supported">
				<label class="checkbox" for="Supported"><spring:message code="side.screenreader" text="*" /></label></li>				
			</ul>
		</li>
		<li>
			<h3><spring:message code="side.giftofreading" text="*" /></h3>
			<ul>
				<li><a href="#"><spring:message code="side.comazongiftcard" text="*" /></a></li>				
				<li><a href="#"><spring:message code="side.redeengiftcard" text="*" /></a></li>
				<li><a href="#"><spring:message code="side.giftcardbalance" text="*" /></a></li>
			</ul>
		</li>
		<li>
			<h3><spring:message code="side.needhelp" text="*" /></h3>
			<ul>
				<li><a href="#"><spring:message code="side.managecontent" text="*" /></a></li>
				<li><a href="#"><spring:message code="side.comazonsupport" text="*" /></a></li>
			</ul>
		</li>
	</ul>
</div>
<%-- <div id="banner">
	<a href="#"><img width="190" height="163" src="${contextPath}/resources/image/n-pay.jpg"> </a>
</div> --%>
<%-- <div id="notice">
	<h2>공지사항</h2>
	<ul>
	<c:forEach var="i" begin="1" end="5" step="1">
		<li><a href="#">공지사항입니다.${ i}</a></li>
	</c:forEach>
	</ul>
</div> --%>


<%-- <div id="banner">
	<a href="#"><img width="190" height="362" src="${contextPath}/resources/image/side_banner1.jpg"></a>
</div>
<div id="banner">
	<a href="#"><img width="190" height="104" src="${contextPath}/resources/image/call_center_logo.jpg"></a>
</div>
<div id="banner">
	<a href="#"><img width="190" height="69" src="${contextPath}/resources/image/QnA_logo.jpg"></a>
</div> --%>
</html>