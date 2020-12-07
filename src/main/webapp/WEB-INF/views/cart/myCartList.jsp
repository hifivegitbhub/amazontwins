<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="myCartList"  value="${cartMap.myCartList}"  />
<c:set var="myGoodsList"  value="${cartMap.myGoodsList}"  />

<c:set  var="totalGoodsNum" value="0" />  <!--주문 개수 -->
<c:set  var="totalDeliveryPrice" value="0" /> <!-- 총 배송비 --> 
<c:set  var="totalDiscountedPrice" value="0" /> <!-- 총 할인금액 -->
<head>
<script type="text/javascript">
function calcGoodsPrice(bookPrice,obj){
	var totalPrice,final_total_price,totalNum;
	var goods_qty=document.getElementById("select_goods_qty");
	//alert("총 상품금액"+goods_qty.value);
	var p_totalNum=document.getElementById("p_totalNum");
	var p_totalPrice=document.getElementById("p_totalPrice");
	var p_final_totalPrice=document.getElementById("p_final_totalPrice");
	var h_totalNum=document.getElementById("h_totalNum");
	var h_totalPrice=document.getElementById("h_totalPrice");
	var h_totalDelivery=document.getElementById("h_totalDelivery");
	var h_final_total_price=document.getElementById("h_final_totalPrice");
	if(obj.checked==true){
	//	alert("체크 했음")
		
		totalNum=Number(h_totalNum.value)+Number(goods_qty.value);
		//alert("totalNum:"+totalNum);
		totalPrice=Number(h_totalPrice.value)+Number(goods_qty.value*bookPrice);
		//alert("totalPrice:"+totalPrice);
		final_total_price=totalPrice+Number(h_totalDelivery.value);
		//alert("final_total_price:"+final_total_price);

	}else{
	//	alert("h_totalNum.value:"+h_totalNum.value);
		totalNum=Number(h_totalNum.value)-Number(goods_qty.value);
	//	alert("totalNum:"+ totalNum);
		totalPrice=Number(h_totalPrice.value)-Number(goods_qty.value)*bookPrice;
	//	alert("totalPrice="+totalPrice);
		final_total_price=totalPrice-Number(h_totalDelivery.value);
	//	alert("final_total_price:"+final_total_price);
	}
	
	h_totalNum.value=totalNum;
	
	h_totalPrice.value=totalPrice;
	h_final_total_price.value=final_total_price;
	
	p_totalNum.innerHTML=totalNum;
	p_totalPrice.innerHTML=totalPrice;
	p_final_totalPrice.innerHTML=final_total_price;
}

function modify_cart_qty(goods_id,bookPrice,index){
	//alert(index);
   var length=document.frm_order_all_cart.cart_goods_qty.length;
   var _cart_goods_qty=0;
	if(length>1){ //카트에 제품이 한개인 경우와 여러개인 경우 나누어서 처리한다.
		_cart_goods_qty=document.frm_order_all_cart.cart_goods_qty[index].value;		
	}else{
		_cart_goods_qty=document.frm_order_all_cart.cart_goods_qty.value;
	}
		
	var cart_goods_qty=Number(_cart_goods_qty);
	//alert("cart_goods_qty:"+cart_goods_qty);
	//console.log(cart_goods_qty);
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/cart/modifyCartQty.do",
		data : {
			goods_id:goods_id,
			cart_goods_qty:cart_goods_qty
		},
		
		success : function(data, textStatus) {
			//alert(data);
			if(data.trim()=='modify_success'){
				alert("수량을 변경했습니다!!");	
			}else{
				alert("다시 시도해 주세요!!");	
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

function delete_cart_goods(cart_id){
	var cart_id=Number(cart_id);
	var formObj=document.createElement("form");
	var i_cart = document.createElement("input");
	i_cart.name="cart_id";
	i_cart.value=cart_id;
	
	formObj.appendChild(i_cart);
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/cart/removeCartGoods.do";
    formObj.submit();
}

function fn_order_each_goods(goods_id,goods_title,goods_sales_price,fileName){
	var total_price,final_total_price,_goods_qty;
	var cart_goods_qty=document.getElementById("cart_goods_qty");
	
	_order_goods_qty=cart_goods_qty.value; //장바구니에 담긴 개수 만큼 주문한다.
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
    i_order_goods_qty.value=_order_goods_qty;
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

function fn_order_all_cart_goods(){
//	alert("모두 주문하기");
	var order_goods_qty;
	var order_goods_id;
	var objForm=document.frm_order_all_cart;
	var cart_goods_qty=objForm.cart_goods_qty;
	var h_order_each_goods_qty=objForm.h_order_each_goods_qty;
	var checked_goods=objForm.checked_goods;
	var length=checked_goods.length;
	
	
	//alert(length);
	if(length>1){
		for(var i=0; i<length;i++){
			if(checked_goods[i].checked==true){
				
				order_goods_id=checked_goods[i].value;
				order_goods_qty=cart_goods_qty[i].value;
				cart_goods_qty[i].value="";
				cart_goods_qty[i].value=order_goods_id+":"+order_goods_qty;
				
				console.log(cart_goods_qty[i].value);
			}
		}	
	}else{
		order_goods_id=checked_goods.value;
		order_goods_qty=cart_goods_qty.value;
		cart_goods_qty.value=order_goods_id+":"+order_goods_qty;
		//alert(select_goods_qty.value);
	}
		
 	objForm.method="post";
 	objForm.action="${contextPath}/order/orderAllCartGoods.do";
	objForm.submit();
}

</script>
</head>
<body>
	
	<input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
    <label id="label_tab1" for="tab1">Your List</label>

    <input id="tab2" type="radio" name="tabs">
    <label id="label_tab2" for="tab2">Your Idea List</label>

    <input id="tab3" type="radio" name="tabs">
    <label id="label_tab3" for="tab3">Your Friends</label>

    <input id="tab4" type="radio" name="tabs">
    <label id="label_tab4" for="tab4">List Help</label>

    <section id="content1">
        <table class="list_view">
		<tbody align=center >
			<tr style="background:#eeeeee" >
				<td class="tbl_txt">Book</td>
				<td class="tbl_txt" colspan=2 class="fixed">Book Name</td>
				<td class="tbl_txt">Selling Price</td>
				<td class="tbl_txt">Discounted Price</td>
				<td class="tbl_txt">Quantity</td>
				<td class="tbl_txt">Total</td>
				<td class="tbl_txt">Order</td>
			</tr>
			
			<c:choose>
				<c:when test="${ empty myCartList }">
					<tr>
				       <td colspan=8 class="fixed">
				         	<strong>Empty shopping basket</strong>
				       </td>
				    </tr>
				</c:when>
			<c:otherwise>
			<tr>       
            	<form name="frm_order_all_cart">
					<c:forEach var="item" items="${myGoodsList }" varStatus="cnt">
				    	<c:set var="cart_goods_qty" value="${myCartList[cnt.count-1].cart_goods_qty}" />
				        <c:set var="cart_id" value="${myCartList[cnt.count-1].cart_id}" />
						<td><input type="checkbox" name="checked_goods"  checked  value="${item.goods_id }"  onClick="calcGoodsPrice(${item.goods_sales_price },this)"></td>
						<td class="goods_image">
						<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
							<img width="100" alt="" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"  />
						</a>
					</td>
					<td class="tbl_cnt">
						<h2>
							<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_sales_price }">${item.goods_title }</a>
						</h2>
					</td>
					<td class="tbl_cnt_price"><span>$${item.goods_sales_price }</span></td>
					<td class="tbl_cnt">
					   <strong>
					      <fmt:formatNumber  value="${item.goods_sales_price}" type="number" var="discounted_price" />
				            $${discounted_price} (Discount 10%)
				         </strong>
					</td>
					<td class="tbl_cnt">
					    <input type="text" id="cart_goods_qty" name="cart_goods_qty" size=3 value="${cart_goods_qty}"><br>
						<a href="javascript:modify_cart_qty(${item.goods_id },${item.goods_sales_price },${cnt.count-1 });" >
							<img width=25 alt=""  src="${contextPath}/resources/image/btn_modify_qty.jpg">
						</a>
					</td>
					<td class="tbl_cnt">
						<strong>
						    <fmt:formatNumber  value="${item.goods_sales_price*cart_goods_qty}" type="number" var="total_sales_price" />
					         $${total_sales_price}
						</strong> </td>
					<td class="tbl_cnt">
						<a href="javascript:fn_order_each_goods('${item.goods_id }','${item.goods_title }','${item.goods_sales_price}','${item.goods_fileName}');">
					    	<input class="buyButton" type="button" value="order">
						</a><br>
					 	
						<a href="javascript:delete_cart_goods('${cart_id}');""> 
							<input class="ListButton" type="button" value="delete">
					   	</a>
					</td>
				</tr>
				<c:set  var="totalGoodsPrice" value="${totalGoodsPrice+item.goods_sales_price*cart_goods_qty }" />  <!-- by me -->
				<c:set  var="totalGoodsNum" value="${totalGoodsNum+1 }" />
			   </c:forEach>
		    
		</tbody>
		</table>
     	
		<div class="clear"></div>
		 </c:otherwise>
		</c:choose> 
		<br>
		<br>
		
		<table  width=80%   class="list_view" style="background:#ffffff">
		<tbody>
			<tr  align=center  class="fixed" >
		    	<td class="tbl_txt">Total Products </td>
		       	<td class="tbl_txt">Total Product Price</td>
		       	<td>  </td>
		       	<td class="tbl_txt">Total shipping</td>
		       	<td>  </td>
		       	<td class="tbl_txt">Total discount</td>
		       	<td>  </td>
		       	<td class="tbl_txt">Total Payment Price</td>
		    </tr>
			<tr cellpadding=40  align=center >
				<td class="tbl_cnt" id="">
					<p id="p_totalGoodsNum"> ${totalGoodsNum}ea </p>
				  	<input id="h_totalGoodsNum"type="hidden" value="${totalGoodsNum}"  />
				</td>
		       	<td class="tbl_cnt">
		        	<p id="p_totalGoodsPrice">
		          	<fmt:formatNumber  value="${totalGoodsPrice}" type="number" var="total_goods_price" />
					         $ ${total_goods_price}
		          	</p>
		          	<input id="h_totalGoodsPrice"type="hidden" value="${totalGoodsPrice}" />
		       	</td>
		       	<td class="tbl_cnt"> 
		        	<img width="25" alt="" src="${contextPath}/resources/image/plus.jpg">  
		       	</td>
		       	<td class="tbl_cnt">
		        	<p id="p_totalDeliveryPrice">$ ${totalDeliveryPrice }  </p>
		         	<input id="h_totalDeliveryPrice"type="hidden" value="${totalDeliveryPrice}" />
		       	</td>
		       	<td class="tbl_cnt"> 
		        	<img width="25" alt="" src="${contextPath}/resources/image/minus.jpg"> 
		       	</td>
		       	<td class="tbl_cnt">  
		        	<p id="p_totalSalesPrice"> 
						$ ${totalDiscountedPrice}
		         	</p>
		         	<input id="h_totalSalesPrice"type="hidden" value="${totalGoodsPrice}" /> <!-- totalSalesPrice -->
		       	</td>
		       	<td class="tbl_cnt">  
		        	<img width="25" alt="" src="${contextPath}/resources/image/equal.jpg">
		       	</td>
		       	<td class="tbl_cnt">
		        	<p id="p_final_totalPrice">
		          	<fmt:formatNumber  value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" type="number" var="total_price" />
		            	$ ${total_price}
		          	</p>
		          	<input id="h_final_totalPrice" type="hidden" value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" />
		       	</td>
			</tr>
		</tbody>
	</table>
	<center>
	<br><br>	
	<a href="javascript:fn_order_all_cart_goods()">
		<input class="buyButton" type="button" value="Buy now with 1-Click" >
	</a>
	<a href="${contextPath}/main/main.do">
		<input class="ListButton" type="button" value="Continue shopping">
	</a>
	<center>
	</form>
    </section>

    <section id="content2">
        <p>Comazon web shopping</p>
    </section>

    <section id="content3">
        <p>Jonas</p>
        <p>Jenny</p>
        <p>Wilhelm</p>
        <p>Peter</p>
        <p>Sharon</p>
    </section>

    <section id="content4">
        <p>List Help!!</p>
    </section>
	
