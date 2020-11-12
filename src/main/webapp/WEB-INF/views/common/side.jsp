<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<h3>Popular in Comazon</h3>
		<ul>
			<li><a href="${contextPath}/goods/goodsList.do">Comazon Book Deals</a></li>
			<li><a href="#">Best Sellers & More</a></li>
			<li><a href="#">Editor's Picks</a></li>
			<li><a href="#">Comazon Unlimited</a></li>
			<li><a href="#">Summer Reading</a></li>
			<li><a href="#">eBooks with Audible Narration</a></li>
		</ul>
	</li>
	<li>
		<h3>More in Comazon</h3>
		<ul>
			<li><a href="#">Comazon Charts</a></li>
			<li><a href="#">Hotly Anticipated</a></li>
			<li><a href="#">First Reads</a></li>
			<li><a href="#">Author Follow</a></li>
			<li><a href="#">Comics and Graphic Novels</a></li>
			<li><a href="#">Comozon Classics</a></li>
		</ul>
	</li>
	<li>
		<h3>Comazon eBooks</h3>
		<ul>
			<li><a href="#">Arts & Photography</a></li>
			<li><a href="#">Biographies & Memoirs</a></li>
			<li><a href="#">Business & Money</a></li>
			<li><a href="#">Children's eBooks</a></li>
			<li><a href="#">Comics, Manga & Graphic Novels</a></li>
			<li><a href="#">Computers & Technology</a></li>
			<li><a href="#">Cookbooks, Food & Wine</a></li>
			<li><a href="#">Crafts, Hobbies & Home</a></li>
			<li><a href="#">Education & Teaching</a></li>
			<li><a href="#">Engineering & Transportation</a></li>
			<li><a href="#">Foreign Languages</a></li>
			<li><a href="#">Health, Fitness & Dieting</a></li>
			<li><a href="#">History</a></li>
			<li><a href="#">Humor & Entertainment</a></li>
			<li><a href="#">Law</a></li>
			<li><a href="#">Lesbian, Gay, Bisexual & Transgender eBooks</a></li>
			<li><a href="#">Literature & Fiction</a></li>
			<li><a href="#">Medical eBooks</a></li>
			<li><a href="#">Mystery, Thriller & Suspense</a></li>
			<li><a href="#">Nonfiction</a></li>
			<li><a href="#">Parenting & Relationships</a></li>
			<li><a href="#">Politics & Social Sciences</a></li>
			<li><a href="#">Reference</a></li>
			<li><a href="#">Religion & Spirituality</a></li>
			<li><a href="#">Romance</a></li>
			<li><a href="#">Science & Math</a></li>
			<li><a href="#">Science Fiction & Fantasy</a></li>
			<li><a href="#">Self-Help</a></li>
			<li><a href="#">Sports & Outdoors</a></li>
			<li><a href="#">Teen & Young Adult</a></li>
			<li><a href="#">Travel</a></li>
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
			<h2>Refined by</h2>
			<h3>Author</h3>
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
			<h3>Series</h3>
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
			<h3>Language</h3>
			<ul>
				<li><input class="checkbox" type="checkbox" id="English" name="English" value="English">
				<label class="checkbox" for="English">English</label></li>
				<li><input class="checkbox" type="checkbox" id="German" name="German" value="German">
				<label class="checkbox" for="German">German</label></li>
				<li><input class="checkbox" type="checkbox" id="French" name="French" value="French">
				<label class="checkbox" for="French">French</label></li>
				<li><input class="checkbox" type="checkbox" id="Spanish" name="Spanish" value="Spanish">
				<label class="checkbox" for="Spanish">Spanish</label></li>
				<li><input class="checkbox" type="checkbox" id="Chinese" name="Chinese" value="Chinese">
				<label class="checkbox" for="Chinese">Chinese</label></li>
				<li><input class="checkbox" type="checkbox" id="Afrikaans" name="Afrikaans" value="Afrikaans">
				<label class="checkbox" for="Afrikaans">Afrikaans</label></li>
				<li><input class="checkbox" type="checkbox" id="Portuguese" name="Portuguese" value="Portuguese">
				<label class="checkbox" for="Portuguese">Portuguese</label></li>
			</ul>
		</li>
		<li>
			<h3>Accessibility Features</h3>
			<ul>
				<li><input class="checkbox" type="checkbox" id="Supported" name="Supported" value="Supported">
				<label class="checkbox" for="Supported">Screen Reader Supported</label></li>				
			</ul>
		</li>
		<li>
			<h3>Give the Gift of Reading</h3>
			<ul>
				<li><a href="#">Give a Comazon Gift Card</a></li>				
				<li><a href="#">Redeem a Gift Card</a></li>
				<li><a href="#">View Gift Card Balance and Activity</a></li>
			</ul>
		</li>
		<li>
			<h3>Need Help?</h3>
			<ul>
				<li><a href="#">Manage Content and Devices</a></li>
				<li><a href="#">Comazon Support</a></li>
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