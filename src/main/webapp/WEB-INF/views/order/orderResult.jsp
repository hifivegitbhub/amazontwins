<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
</head>
<BODY>
	<div class="order_result_title">Final Order Statement</div>
	<table class="list_view">
		<tbody align=center>
			<tr style="background: #eeeeee">
			    <td>Order num </td>
				<td colspan=2 class="fixed">Product name</td>
				<td>Quantity</td>
				<td>Payment</td>
				<td>Shipping fee</td>
				<td>Points</td>
				<td>Total price</td>
			</tr>
			<tr>
				<c:forEach var="item" items="${myOrderList }">
			    <td> ${item.order_id }</td>
				<td class="goods_image">
				  <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
				  	<IMG width="75" alt=""  src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
				  </a>
				</td>
				<td>
				  <h2>
				  	<A href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">${item.goods_title }</A>
				  </h2>
				</td>
				<td>
					<h2>${item.order_goods_qty }ea<h2>
				</td>
				<td><h2>$${item.order_goods_qty *item.goods_sales_price} (discount 0%)</h2></td>
				<td><h2>$0</h2></td>
				<td><h2>${150 *item.order_goods_qty}p</h2></td>
				<td>
					<h2>$${item.order_goods_qty *item.goods_sales_price}</h2>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="clear"></div>
	<form name="form_order">
	
	<div class="order_result_title">Review your order</div>
	<div id="order_result_contents">
		<ul>
			<li class="omit_list">
				<span class="product_price5"><strong>Shipping Method: </strong></span>
				<span class="product_price6">${myOrderInfo.delivery_method} </span>
			</li>
			<li class="list_sty">
				<span class="product_price5"><strong>Orderer: </strong></span>
				<span class="product_price6">${myOrderInfo.receiver_name} </span>
			</li>
			<li class="list_sty">
				<span class="product_price5"><strong>Phone Num: </strong></span>
				<span class="product_price6">${myOrderInfo.receiver_hp1}-${myOrderInfo.receiver_hp2}-${myOrderInfo.receiver_hp3} </span>
			</li>
			<li class="omit_list">
				<span class="product_price5"><strong>Tel Num: </strong></span>
				<span class="product_price6">${myOrderInfo.receiver_tel1}-${myOrderInfo.receiver_tel2}-${myOrderInfo.receiver_tel3} </span>
			</li>
			<li class="list_sty">
				<span class="product_price5"><strong>Address: </strong></span>
				<span class="product_price6">${myOrderInfo.delivery_address} </span>
			</li>
			<li class="omit_list">
				<span class="product_price5"><strong>delivery msg: </strong></span>
				<span class="product_price6">${myOrderInfo.delivery_message}</span>
			</li>
			<li class="omit_list">
				<span class="product_price5"><strong>Orderer name: </strong></span>
				<span class="product_price6">${orderer.member_name}</span>
			</li>
			<li class="omit_list">
				<span class="product_price5"><strong>Phone num: </strong></span>
				<span class="product_price6">${orderer.hp1}-${orderer.hp2}-${orderer.hp3}</span>
			</li>
			<li class="omit_list">
				<span class="product_price5"><strong>Email: </strong></span>
				<span class="product_price6">${orderer.email1}@${orderer.email2}</span>
			</li>
			<li class="list_sty">
				<span class="product_price5"><strong>Pay method: </strong></span>
				<span class="product_price6">${myOrderInfo.pay_method}</span>
			</li>
			<li class="list_sty">
				<span class="product_price5"><strong>Card name: </strong></span>
				<span class="product_price6">${myOrderInfo.card_com_name}</span>
			</li>
			<li class="list_sty">
				<span class="product_price5"><strong>Card pay month: </strong></span>
				<span class="product_price6">${myOrderInfo.card_pay_month }</span>
			</li>
		</ul>
	</div>
	
	
	<div class="clear"></div>
	</form>
	
    <div class="clear"></div>

	<center>
		<br> 
		<a href="${contextPath}/main/main.do"> 
			<input class="ListButton" type="button" value="Continue">
		</a>
	<div class="clear"></div>		
	
			
			
			