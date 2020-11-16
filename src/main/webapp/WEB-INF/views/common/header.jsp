<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<script type="text/javascript">
	var loopSearch=true;

	function keywordSearch() {
		
		if(loopSearch == false)
			return;
		
		var value = document.frmSearch.tags.value;
		
		$.ajax({
			type	: "get",
			async	: true,
			url		: "${contextPath}/goods/keywordSearch.do",
			data	: {keyword:value},
			success : function(data, textStatus) {
							var jsonInfo = JSON.parse(data);
							displayResult(jsonInfo);
			},
			error	: function(data, textStatus) {
							alert("There is an error." + data);
			},
			complete : function(data, textStatus) {
				//alert("completed");
			}
		}); //end ajax	
	}

	function displayResult(jsonInfo) {
		
		var count = jsonInfo.keyword.length;
		
		if(count > 0) {
		    var availableTags = "";		    		    
		    
		    $("#tags").autocomplete({ // https://jqueryui.com/autocomplete/
		        source: jsonInfo.keyword
			});
		} 
	}
	
	function select(selectedKeyword) {
		 document.frmSearch.searchWord.value=selectedKeyword;
		 loopSearch = false;
		 hide('suggest');
	}
		
	function show(elementId) {
		 var element = document.getElementById(elementId);
		 if(element) {
		  element.style.display = 'block';
		 }
		}
	
	function hide(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.style.display = 'none';
	   }
	}
</script>
<body>
	<div id="header_wrap">
		<!-- <button type="button" id="list_btn">List</button> -->
		<div class='nav-icons default'>
			<span></span>
			<span></span>
			<span></span>
		</div>
		
		<div id="logo">
			<a href="${contextPath}/main/main.do">
				<img height="70" alt="comazon" src="${contextPath}/resources/image/comazon_logo.png">
			</a>
		</div>
		
		<div id="deliver_to">
			<font size=1><a href="#">Deliver to</a></font><br>
			<font size=2><b><a href="#">Korea, Republic of</a></b></font>
        </div>
		
		<div id="search" >
			<form name="frmSearch" action="${contextPath}/goods/searchGoods.do" >
				<input name="searchWord" id="tags" type="text"  onKeyUp="keywordSearch()">
				<!-- <input type="submit" name="search" class="btn1"  value="search" > -->
				<button type="submit" name="search" class="btn1"><i class="fa fa-search"></i></button>
			</form>
		</div>
		
		<div id="suggest">
	        <div id="suggestList"></div>
	   	</div>
		
		<div id="head_link">
			<ul>
				<c:choose>
					<c:when test="${isLogOn==true and not empty memberInfo}">
						<li><a href="${contextPath}/member/logout.do">Logout</a></li>
						<li><a href="${contextPath}/mypage/myPageMain.do">Mypage</a></li>
						<li><a href="${contextPath}/cart/myCartList.do">Cart</a></li>
						<li><a href="#">Delivery</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${contextPath}/member/loginForm.do">Login</a></li>
						<li><a href="${contextPath}/member/memberForm.do">Sign Up</a></li> 
					</c:otherwise>
				</c:choose>
				
				<%-- <fmt:setLocale value="en_US" /> --%>
				<fmt:setLocale value="de_DE" />
				
				<li><a href="#"><fmt:bundle basename="resource.member"><fmt:message key="header.cscenter" /></fmt:bundle></a></li>
				<!-- <li><a href="#">Customer Center</a></li> -->
				
				<c:if test="${isLogOn==true and memberInfo.member_id =='admin' }">  
					<li class="no_line"><a href="${contextPath}/admin/goods/adminGoodsMain.do">Manager</a></li>
				</c:if>
			</ul>
		</div>

	   <!-- <div id="suggest">
	        <div id="suggestList"></div>
	   </div> -->
	</div>
	
	<div id="header_menu_wrap">
		<nav id="header_menu">
			<ul>
				<li><a href="${contextPath}/member/logout.do">Today's Deals</a></li>
				<li><a href="${contextPath}/member/logout.do">Customer Service</a></li>
				<li><a href="${contextPath}/member/logout.do">Gift Cards</a></li>
				<li><a href="${contextPath}/member/logout.do">Sell</a></li>
				<li><a href="${contextPath}/member/logout.do">Registry</a></li>
			</ul>
		</nav>
	</div>
	
</body>
</html>