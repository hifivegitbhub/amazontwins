<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<script>
$(function() {
    var dateFormat = "mm/dd/yy",
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 3
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 3
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
});
    
function search_goods_list(fixeSearchPeriod){
	var formObj=document.createElement("form");
	var i_fixedSearch_period = document.createElement("input");
	
	i_fixedSearch_period.name="fixedSearchPeriod";
	i_fixedSearch_period.value=searchPeriod;
    formObj.appendChild(i_fixedSearch_period);
    document.body.appendChild(formObj); 
    formObj.method="get";
    formObj.action="${contextPath}/admin/goods/adminGoodsMain.do";
    formObj.submit();
}


function  calcPeriod(search_period){
	var dt = new Date();
	var beginYear,endYear;
	var beginMonth,endMonth;
	var beginDay,endDay;
	var beginDate,endDate;
	
	endYear = dt.getFullYear();
	endMonth = dt.getMonth()+1;
	endDay = dt.getDate();
	if(search_period=='today'){
		beginYear=endYear;
		beginMonth=endMonth;
		beginDay=endDay;
	}else if(search_period=='one_week'){
		beginYear=dt.getFullYear();
		beginMonth=dt.getMonth()+1;
		dt.setDate(endDay-7);
		beginDay=dt.getDate();
		
	}else if(search_period=='two_week'){
		beginYear = dt.getFullYear();
		beginMonth = dt.getMonth()+1;
		dt.setDate(endDay-14);
		beginDay=dt.getDate();
	}else if(search_period=='one_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-1);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='two_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-2);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='three_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-3);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='four_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-4);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}
	
	if(beginMonth <10){
		beginMonth='0'+beginMonth;
		if(beginDay<10){
			beginDay='0'+beginDay;
		}
	}
	if(endMonth <10){
		endMonth='0'+endMonth;
		if(endDay<10){
			endDay='0'+endDay;
		}
	}
	endDate=endYear+'-'+endMonth +'-'+endDay;
	beginDate=beginYear+'-'+beginMonth +'-'+beginDay;
	//alert(beginDate+","+endDate);
	return beginDate+","+endDate;
}
</script>
</head>
<body>
	<div id="admin_main_product_search_wrap">
		<h3>&nbsp;상품 조회</h3>
		<form method="post">	
			<table class="outer_table">
				<tbody>
					<tr>
						<td class="first_td">
							조회 구분
						</td>
						<td>
							<input type="radio" name="r_search" checked/> 등록일로조회 &nbsp;&nbsp;&nbsp;
							<input type="radio" name="r_search" /> 상세조회 &nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td rowspan="2" class="first_td">
							조회 기간
						</td>
						<td>
							<button type="button" onclick="search_goods_list('today')" class="search_period" >당일</button>
							<button type="button" onclick="search_goods_list('one_week')" class="search_period" >1주</button>
							<button type="button" onclick="search_goods_list('two_week')" class="search_period" >2주</button>
							<button type="button" onclick="search_goods_list('one_month')" class="search_period" >1개월</button>
							<button type="button" onclick="search_goods_list('two_month')" class="search_period" >2개월</button>
							<button type="button" onclick="search_goods_list('three_month')" class="search_period" >3개월</button>
							<button type="button" onclick="search_goods_list('four_month')" class="search_period" >4개월</button>
							&nbsp;
						</td>
					</tr>
					<tr>						
						<td>
							<input type="text" id="from" name="from" style="width: 100px">
							<label for="to">~</label>
							<input type="text" id="to" name="to">						 
						</td>
					</tr>
					<tr>
						<td class="first_td">
							조회 상세
						</td>
						<td>
							<select name="search_condition" disabled >
								<option value="전체" checked>전체</option>
								<option value="제품번호">상품번호</option>
								<option value="제품이름">상품이름</option>
								<option value="제조사">제조사</option>
							</select>
							<input type="text"  size="30"  disabled/>  
							<input type="button"  value="조회" disabled/>
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="clear"></div>
			
		</form>
	</div>
<div class="clear"></div>

<div id="admin_main_product_add">
	<form action="${contextPath}/admin/goods/addNewGoodsForm.do">
		<input type="submit" class="btn" value="상품 등록하기">
	</form>
</div>

<table class="list_view">
	<thead>
		<tr>
			<td>상품번호</td>
			<td>상품이름</td>
			<td>저자</td>
			<td>출판사</td>
			<td>상품가격</td>
			<td>입고일자</td>
			<td>출판일</td>
		</tr>
	</thead>
	<tbody align = center >
		<c:choose>   
		<c:when test="${empty newGoodsList }">			
			<tr>
		       <td colspan=8 class="fixed">
				  <strong>조회된 상품이 없습니다.</strong>
			   </td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="item" items="${newGoodsList }">
				<TR>       
					<td>
					  <strong>${item.goods_id }</strong>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/admin/goods/modifyGoodsForm.do?goods_id=${item.goods_id}">
							<strong>${item.goods_title } </strong>
						</a> 
					</td>
					<td>
						<strong>${item.goods_writer }</strong> 
					</td>
					<td>
						<strong>${item.goods_publisher }</strong> 
					</td>
					<td>
						<strong>${item.goods_sales_price }</strong>
					</td>
					<td>
						<strong>${item.goods_credate }</strong> 
					</td>
					<td>
						<c:set var="pub_date" value="${item.goods_published_date}" />
						<c:set var="arr" value="${fn:split(pub_date,' ')}" />
						<strong>
						   <c:out value="${arr[0]}" />
						</strong>
					</td>
				</TR>
			</c:forEach>
		</c:otherwise>
		</c:choose>
		<tr>
			<td colspan=8 class="fixed">
				<c:forEach   var="page" begin="1" end="10" step="1" >
					<c:if test="${section >1 && page==1 }">
						<a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp; &nbsp;</a>
					</c:if>
					<a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
					<c:if test="${page ==10 }">
						<a href="${contextPath}/admin/goods/adminGooodsMain.do?chapter=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
					</c:if> 
				</c:forEach> 
			</td>
		</tr>
	</tbody>
</table>
	
<div class="clear"></div>
	<br><br><br>
</body>
</html>