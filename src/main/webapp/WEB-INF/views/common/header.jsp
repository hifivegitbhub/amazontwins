<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<script type="text/javascript">

	$(document).ready(function(){
		$('#localechoice').on('change', function(){
			var lang = $('#localechoice').val();
			var params = location.search.substr(location.search.indexOf("?") + 1);
			
			location.href = "${contextPath}" + "${viewName}" + ".do?lang=" + lang + "&" + params;
		})
	});
	
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
			<font size=1><a href="#"><spring:message code="header.deliverto" text="*" /></a></font><br>
			<font size=2><b><a href="#"><spring:message code="header.country" text="*" /></a></b></font>
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
		
		<div>
			<select id="localechoice" class="form-control">
				<option>
					<spring:message code="header.changelanguage" text="*" />
				</option>
				<option value="ko">
					<spring:message code="header.languagekorea" text="*" />
				</option>
				<option value="en">
					<spring:message code="header.languageenglish" text="*" />
				</option>
				<option value="de">
					<spring:message code="header.languagegermany" text="*" />
				</option>
			</select>
		</div>
		
		<div id="head_link">
			<ul>
				<c:choose>
					<c:when test="${isLogOn==true and not empty memberInfo}">
						<li><a href="${contextPath}/member/logout.do"><spring:message code="header.logout" text="*" /></a></li>
						<li><a href="${contextPath}/mypage/myPageMain.do"><spring:message code="header.mypage" text="*" /></a></li>
						<li><a href="${contextPath}/cart/myCartList.do"><spring:message code="header.cart" text="*" /></a></li>
						<li><a href="#">Delivery</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${contextPath}/member/signIn.do"><spring:message code="header.login" text="*" /></a></li>
						<li><a href="${contextPath}/member/memberForm.do"><spring:message code="header.signup" text="*" /></a></li> 
					</c:otherwise>
				</c:choose>
				
				<li><a href="#"><spring:message code="header.cscenter" text="*" /></a></li>
				
				<c:if test="${isLogOn==true and memberInfo.member_id =='admin' }">  
					<li class="no_line"><a href="${contextPath}/admin/goods/adminGoodsMain.do"><spring:message code="header.manager" text="*" /></a></li>
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
				<li><a href="${contextPath}/member/logout.do"><spring:message code="header.deal" text="*" /></a></li>
				<li><a href="${contextPath}/member/logout.do"><spring:message code="header.csservice" text="*" /></a></li>
				<li><a href="${contextPath}/member/logout.do"><spring:message code="header.giftcard" text="*" /></a></li>
				<li><a href="${contextPath}/member/logout.do"><spring:message code="header.sell" text="*" /></a></li>
				<li><a href="${contextPath}/member/logout.do"><spring:message code="header.registry" text="*" /></a></li>
			</ul>
		</nav>
	</div>
</body>
</html>