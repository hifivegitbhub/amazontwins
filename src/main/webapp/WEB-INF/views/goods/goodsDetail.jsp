<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 	isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="goods"  value="${goodsMap.goodsVO}"  />
<c:set var="imageList"  value="${goodsMap.imageList }"  />
 <%
     //치환 변수 선언합니다.
      //pageContext.setAttribute("crcn", "\r\n"); //개행문자
      pageContext.setAttribute("crcn" , "\n"); //Ajax로 변경 시 개행 문자 
      pageContext.setAttribute("br", "<br/>"); //br 태그
%>  
<html>
<head>
<style>
#layer {
	z-index: 50;
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
	background-color: rgb(0, 0, 0,0.5);
}

#popup{
	z-index: 3;
	position: fixed;
	text-align: left;
	left: 20%;
	top: 15%;
	width: 900px;
	height: 400px;
	background-color: #ffffff;
	/* border: 1px solid #111111; */
	border-radius: 5px;
}

#popup_title{
	font-size: 2rem;
	color: #111111;
	display: block;
	padding: 0px 0px 0px 15px;
	/* border: 1px solid #111111; */
}

#popup_image{
	width: 150px;
	padding: 0px 15px 35px 55px;
	/* border: 1px solid #111111; */
}

#popup_subject{
	display: inline-block; 
	padding-top: 0px;
  	padding-right: 0px;
  	padding-bottom: 170px;
  	padding-left: 20px;
  	color: #0055AA;
}

#popup_subject:hover{
	color: #F46142;
	text-decoration: underline;
}

#popup_block1{
	display: inline-block;
	font-size: 1rem;
}
#popup_block2{
	display: inline-block;
	/* border: 1px solid #999999; */
	float: right;
	padding: 0px 10px 0px 0px;
	width: 300px;
}

#popup_block3{
	width: 300px;
}

#popup_block4{
	width: 300px;
}

#close {
	z-index: 4;
	float: right;
	display: inline-block;
}

#category_book{
	text-align:left;
	font-size: 1rem;
	color:#565959;
}
#goods_title{
	color:#0F1111;
	font-size: 24px;
}

#good_writer{
	text-align:left;
	font-size: 1rem;
}


#ggw{
	color:#007185;
	font-weight: normal ;
}

#ggw:hover{
	color:#CE4A2D;
	text-decoration: underline;
}

#goods_status{
	text-align:left;
	font-size: 1rem;
}

.gsr{
	color:#007185;
	font-weight: normal ;
}    
.gsr:hover{
	color:#CE4A2D;
	text-decoration: underline;
}
</style>
<script type="text/javascript">
	function add_cart(goods_id) {
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/cart/addGoodsInCart.do",
			data : {
				goods_id:goods_id
				
			},
			success : function(data, textStatus) {
				//alert(data);
			//	$('#message').append(data);
				if(data.trim()=='add_success'){
					imagePopup('open', '.layer01');	
				}else if(data.trim()=='already_existed'){
					alert("Item that already existed in.");	
				}
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
			}
		}); //end ajax	
	}

	function imagePopup(type) {
		if (type == 'open') {
			// 팝업창을 연다.
			jQuery('#layer').attr('style', 'visibility:visible');

			// 페이지를 가리기위한 레이어 영역의 높이를 페이지 전체의 높이와 같게 한다.
			jQuery('#layer').height(jQuery(document).height());
		}

		else if (type == 'close') {

			// 팝업창을 닫는다.
			jQuery('#layer').attr('style', 'visibility:hidden');
		}
	}
	
function fn_order_each_goods(goods_id,goods_title,goods_sales_price,fileName){
	var _isLogOn=document.getElementById("isLogOn");
	var isLogOn=_isLogOn.value;
	
	 if(isLogOn=="false" || isLogOn=='' ){
		alert("Login!!!");
	} 
	
	
	var total_price,final_total_price;
	var order_goods_qty=document.getElementById("order_goods_qty");
		
	var formObj=document.createElement("form");
	var i_goods_id = document.createElement("input"); 
    var i_goods_title = document.createElement("input");
    var i_goods_sales_price=document.createElement("input");
    var i_fileName=document.createElement("input");
    var i_order_goods_qty=document.createElement("input");
    
    i_goods_id.name="goods_id";
    i_goods_title.name="goods_title";
    i_goods_sales_price.name="goods_sales_price";
    i_fileName.name="goods_fileName";
    i_order_goods_qty.name="order_goods_qty";
    
    i_goods_id.value=goods_id;
    i_order_goods_qty.value=order_goods_qty.value;
    i_goods_title.value=goods_title;
    i_goods_sales_price.value=goods_sales_price;
    i_fileName.value=fileName;
    
    formObj.appendChild(i_goods_id);
    formObj.appendChild(i_goods_title);
    formObj.appendChild(i_goods_sales_price);
    formObj.appendChild(i_fileName);
    formObj.appendChild(i_order_goods_qty);

    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/order/orderEachGoods.do";
    formObj.submit();
	}	

	function bookDescription() {
	  var dots = document.getElementById("dots");
	  var moreText = document.getElementById("more");
	  var btnText = document.getElementById("myBtn");

	  if (dots.style.display === "none") {
	    dots.style.display = "inline";
	    btnText.innerHTML = "Read more"; 
	    moreText.style.display = "none";
	  } else {
	    dots.style.display = "none";
	    btnText.innerHTML = "Read less"; 
	    moreText.style.display = "inline";
	  }
	}

</script>
</head>
<body>
	<hgroup>
		<!-- <h1>Insert Image</h1> -->
		<div id="banner_image">
			<a href="/amazontwins/main/main.do">
				<figure>
					<img height="60" alt="BANNER IMAGE"
						src="/amazontwins/resources/image/banner.png">
				</figure>
			</a>
		</div>
		<h2 id="category_book"><a href="">Comazon Store </a> <span class="spr1">></span> <a href="">Comazon eBooks </a> <span class="spr2">></span> <a href="">Literature & Fiction</a></h2>
		<br> <!-- 너무 메인 그림이 붙어 있어요. 그래서 라인 하나 넣었어요.-->
	</hgroup>
	<div id="goods_image">
		<figure>
			<span>
				<a href="">
					<img alt="lookInside IMAGE"
					src="/amazontwins/resources/image/lookInside.png">
				</a>
			</span>
		</figure>
		
		<figure>
			<a href="">
				<img alt="BOOK IMAGE"
				src="${contextPath}/thumbnails.do?goods_id=${goods.goods_id}&fileName=${goods.goods_fileName}">
			</a>
		</figure>
	</div>
	<div class="clear">
		<table border="2">
			<tr>
				<td class="product_price">Print List Price: </td>
				<td id="pptext" class="product_price">
					<span>
						<fmt:formatNumber value="${goods.goods_price}" type="number" var="goods_price" />
				        $${goods_price}
					</span>
				</td>
			</tr>
			<tr>
				<td class="product_price2">Comazon Price: </td>
				<td id="cptext" class="product_price2">
					<span>
					   <fmt:formatNumber  value="${goods.goods_price*0.9}" type="number" var="discounted_price" />
				        $${discounted_price}
				    </span>
				</td>
			</tr>
			<tr>
				<td colspan="1" class="product_price2"></td>
				<td id="dptext" class="product_price2">
				    <p>
				    	<fmt:formatNumber  value="${goods.goods_price - goods.goods_price*0.9}" type="number" var="saved_price" />
				        Save $${saved_price} (10%)
				    
				    </p>
				</td>
			</tr>
			<tr>
				<td class="product_price2"></td>
				<td class="product_price2">
					includes free<br>
					international wireless<br>
					delivery via <i id="itaic">Amazon<br>
					Whispernet</i>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="product_price2">
					<input class="buyButton" type="button" value="             Buy now with 1-Click            " onclick="javascript:fn_order_each_goods('${goods.goods_id }','${goods.goods_title }','${goods.goods_sales_price}','${goods.goods_fileName}');">
					<%-- <a class="buy" href="javascript:fn_order_each_goods('${goods.goods_id }','${goods.goods_title }','${goods.goods_sales_price}','${goods.goods_fileName}');">Buy now with 1-Click </a> --%>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="product_price3">
					Deliver to your Kindle or other device
				</td>
			</tr>
		</table>
		<table border="2">
						
			<tr>
				<td colspan="2" class="product_price2">
					<input class="sampleButton" type="button" value="             Send a free sample               " onclick="#">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="product_price4">
					Deliver to your Kindle or other
				</td>
				
			</tr>
			<tr>
				<td colspan="2" class="product_price4">
					device
				</td>
			</tr>
		</table>
		
		<table border="2" id="listButtionTable">	
			<tr>
				<td colspan="2" class="product_price2">
					<input class="ListButton" type="button" value="                    Add to List                      " onclick="javascript:add_cart('${goods.goods_id }');">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="product_price2">
					<input class="ListButton" type="button" value="             Shopping Wish List               " onclick="#">
				</td>
			</tr>
		</table>
	</div>
	
	<h3 id="goods_title">${goods.goods_title }</h3>
	<h4 id="good_writer"> by <a href=""><span id="ggw">${goods.goods_writer}</span></a>  <span>|</span>  <span>${goods.goods_publisher}</span></h4>
	<h4 id="goods_status"><span>${goods.goods_status }</span> <a href=""><span class="gsr">1,753 ratings</span></a></h4>
	<!-- goods.goods_status의 자리에 새로운 DB Table을 생성하고 별의 갯수를 가져오는 기능을 구현할 것입니다. -->
	<h4 id="goods_points"><span>Book Points</span> <a href=""><span class="gsr">${goods.goods_point}p</span></a></h4>
	<h4 id="goods_tag">
		<span id="goods_status_bck">
			Comazon ${goods.goods_status }
		</span> 
		<a href="">
			<span class="gsr">
				#1 this week
			</span>
		</a>
	</h4>
	<div id="border_sign">
		<a href="">
			<table border="1" id="Ebook_1">	
				<tr>
					<td class="product_price2" id="ebb">
						E-Book                 
					</td>
				</tr>
				<tr>
					<td class="product_price2" id="ebb2">
						<c:set var="ebook_price" value="${goods.goods_price*0.5}" />
						$<c:out value="${ ebook_price }" />
					</td>
				</tr>
			</table>
		</a>
		
		<a href="">
			<table border="1" id="HardCover_1">	
				<tr>
					<td class="product_price2" id="hcb">
						Hard Cover
					</td>
				</tr>
				<tr>
					<td class="product_price2" id="hcb2">
						<c:set var="hardCover_price" value="${goods.goods_price*1.2}" />
						$<c:out value="${ hardCover_price }" />
					</td>
				</tr>
			</table>
		</a>
		
		<a href="">
			<table border="1" id="Audio_1">	
				<tr>
					<td class="product_price2" id="abb">
						Audio Book
					</td>
				</tr>
				<tr>
					<td class="product_price2" id="abb2">
						<c:set var="AudioBook_price" value="${goods.goods_price*0}" />
						$<c:out value="${ AudioBook_price }" />
					</td>
				</tr>
			</table>
		</a>
	</div>
	
	<div id="detail_description">
		<a href="">
			<span id="read_with">Read with Our</span> 
			<span id="free_app">Free App</span>
		</a>
	</div>
	<div id="book_description">
		We've all been there: stuck in a cycle of what-ifs, plagued by indecision, paralyzed by the fear of getting it wrong. Nobody wants to live a life of constant overthinking, but it doesn't feel like something we can choose to stop doing. It feels like something we're wired to do, something we just can't escape. But is it? <br>
		<span id="dots">...</span><span id="more">Anne Bogel's answer is no. Not only can you overcome negative thought patterns that are repetitive, unhealthy, and unhelpful, you can replace them with positive thought patterns that will bring more peace, joy, and love into your life. In Don't Overthink It, you'll find actionable strategies that can make an immediate and lasting difference in how you deal with questions both small--Should I buy these flowers?--and large--What am I doing with my life? More than a book about making good decisions, Don't Overthink It offers you a framework for making choices you'll be comfortable with, using an appropriate amount of energy, freeing you to focus on all the other stuff that matters in life.</span>
		<button onclick="bookDescription()" id="myBtn">Read more</button>
	</div>
	
	<div id="product_detailed">
		<h2 id="pdt">Product details</h2>
		<ul>
			<li class="list_sty">
				<span class="product_price5"><strong>Published date: </strong></span>
				<span class="product_price6">
					<c:set var="pub_date" value="${goods.goods_published_date}" />
					<c:set var="arr" value="${fn:split(pub_date,' ')}" />
					<c:out value="${arr[0]}" />
				</span>
			</li>
			<li class="list_sty">
				<span class="product_price5"><strong>Number of pages: </strong></span>
				<span class="product_price6">${goods.goods_total_page} pages</span>
			</li>
			<li class="list_sty">
				<span class="product_price5"><strong>ISBN: </strong></span>
				<span class="product_price6">${goods.goods_isbn}</span>
			</li>
			<li class="list_sty">
				<span class="product_price5"><strong>Shopping: </strong></span>
				<span class="product_price6">free</span>
			</li>
			<li class="list_sty">
				<span class="product_price5"><strong>Shopping description: </strong></span>
				<span class="product_price6"><strong>[Daily shopping]</strong> Start Service<br> <strong>[Tomorrow]</strong>
						ASAP shopping Bookshop</span>
			</li>
			<li class="list_sty">
				<span class="product_price5"><strong>Quantity: </strong></span>
				<span class="product_price6">
					<select style="width: 60px;" id="order_goods_qty">
				    	<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
			     	</select>
				</span>
			</li>
		</ul>
	</div>
	
	<div class="clear"></div>
	<div id="layer" style="visibility: hidden">
		<div id="popup">
			<!-- 팝업창 닫기 버튼 -->
			<a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');"> 
				<img src="${contextPath}/resources/image/close.png" id="close" />
			</a> 
			<br> 
			<font id="popup_title">
				Add to List
			</font>
			<br>
			
			<div>
				<span id="popup_block1">
					<figure id="popup_image">
						<img alt="BOOK IMAGE" 
						src="${contextPath}/thumbnails.do?goods_id=${goods.goods_id}&fileName=${goods.goods_fileName}">
					</figure>
				</span>
				
				<a href="" ><span id="popup_subject">${goods.goods_title}</span></a>
				
				<span id="popup_block2">
					<form action='${contextPath}/cart/myCartList.do'>				
						<input id="popup_block3" class="ListButton" type="submit" value="View Your List">
					</form>	
					<button id="popup_block4" class="ListButton" onClick="javascript:imagePopup('close', '.layer01');">Continue shopping</button>
				</span>
			</div>
					
</body>
</html>
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>