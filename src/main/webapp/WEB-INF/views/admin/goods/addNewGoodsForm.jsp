<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />	
<!DOCTYPE html>

<meta charset="utf-8">
<head>
<script type="text/javascript">
$(function() {
    $("#published_date, #delivery_date").datepicker();
});

var cnt=0;
function fn_addFile() {
	if(cnt == 0){
		$("#d_file").append("<br>"+"<input  type='file' name='main_image' id='f_main_image' />");	  
	}else{
		$("#d_file").append("<br>"+"<input  type='file' name='detail_image"+cnt+"' />");
	}
	
	cnt++;
}
  
function fn_add_new_goods(obj) {
	fileName = $('#f_main_image').val();
	if(fileName != null && fileName != undefined){
		obj.submit();
	}else{
		alert("메인 이미지는 반드시 첨부해야 합니다.");
	return;
}
	 
}
</script>    
</head>

<body>
	<!-- <div id="admin_new_product_add_wrap"> -->
		<div id="admin_main_product_search_wrap">
		<h3>&nbsp;새 상품 등록</h3>
		<form method="post">	
			<table class="outer_table">
				<tbody>
					<tr>
						<td class="first_td">
							상품 정보
						</td>
						<td>
							<table class="inner_table">
								<tr>
									<td width=200 >제품분류</td>
									<td width=500><select name="goods_sort">
											<option value="컴퓨터와 인터넷" selected>컴퓨터와 인터넷
											<option value="디지털 기기">디지털 기기
										</select>
									</td>
								</tr>
								
								<tr>
									<td>제품이름</td>
									<td><input name="goods_title" type="text" size="40" placeholder="Ex: Harry Potter"/></td>
								</tr>
								
								<tr>
									<td>저자</td>
									<td><input name="goods_writer" type="text" size="40" placeholder="Ex: J.K. Rowling"/></td>
								</tr>
								
								<tr>
									<td>출판사</td>
									<td><input name="goods_publisher" type="text" size="40" placeholder="Ex: Pottermore Publishing"/></td>
								</tr>
								
								<tr>
									<td>제품정가</td>
									<td><input name="goods_price" type="text" size="40" placeholder="Ex: 15"/></td>
								</tr>
								
								<tr>
									<td>제품판매가격</td>
									<td><input name="goods_sales_price" type="text" size="40" placeholder="Ex: 17"/></td>
								</tr>
								
								<tr>
									<td>제품 구매 포인트</td>
									<td><input name="goods_point" type="text" size="40" placeholder="Ex: 1"/></td>
								</tr>
								
								<tr>
									<td>제품출판일</td>
									<td><input  name="goods_published_date" type="text" id="published_date" size="40" /></td>
								</tr>
								
								<tr>
									<td>제품 총 페이지수</td>
									<td><input name="goods_total_page" type="text" size="40" placeholder="Ex: 345"/></td>
								</tr>
								
								<tr>
									<td>ISBN</td>
									<td><input name="goods_isbn" type="text" size="40" placeholder="Ex: B019ABCDEF"/></td>
								</tr>
								
								<tr>
									<td>제품 배송비</td>
									<td><input name="goods_delivery_price" type="text" size="40" placeholder="Ex: 2"/></td>
								</tr>
								
								<tr>
									<td>제품 도착 예정일</td>
									<td><input name="goods_delivery_date"  type="text" id="delivery_date" size="40" /></td>
								</tr>
								
								<tr>
									<td>제품종류</td>
									<td>
										<select name="goods_status">
											<option value="bestseller">베스트셀러</option>
											<option value="steadyseller">스테디셀러</option>
											<option value="newbook" selected>신간</option>
											<option value="on_sale">판매중</option>
											<option value="buy_out">품절</option>
											<option value="out_of_print">절판</option>
										</select>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td class="first_td">
							상품 목차
						</td>
						<td>
							<textarea rows="25" cols="100" name="goods_contents_order" placeholder="Ex:&#13;&#10;1. The Boy Who Lived&#13;&#10;2. The Vanishing Glass&#13;&#10;3. The Letters from No One&#13;&#10;4. The Keeper of the Keys&#13;&#10;5. Diagon Alley&#13;&#10;6. The Journey from Platform Nine and Three-quarters&#13;&#10;7. The Sorting Hat&#13;&#10;8. The Potions Master&#13;&#10;....."></textarea>
						</td>
					</tr>
					<tr>
						<td class="first_td">
							상품 저자 소개
						</td>
						<td>
							<textarea rows="25" cols="100" name="goods_writer_intro" placeholder="Ex:&#13;&#10;J. K. (Joanne Kathleen) Rowling was born in the summer of 1965 at Yate General Hospital in England and grew up in Chepstow, Gwent where she went to Wyedean Comprehensive. Jo left Chepstow for Exeter University, where she earned a French and Classics degree, and where her course included one year in Paris. As a postgraduate she moved to London to work at Amnesty International, doing research into human rights abuses in Francophone Africa. She started writing the Harry Potter series during a Manchester to London King's Cross train journey, and during the next five years, outlined the plots for each book and began writing the first novel. Jo then moved to northern Portugal, where she taught English as a foreign language&#13;&#10;....."></textarea>
						</td>
					</tr>
					<tr>
						<td class="first_td">
							상품 소개
						</td>
						<td>
							<textarea rows="25" cols="100" name="goods_intro" placeholder="Ex:&#13;&#10;Harry Potter has never been the star of a Quidditch team, scoring points while riding a broom far above the ground. He knows no spells, has never helped to hatch a dragon, and has never worn a cloak of invisibility.
All he knows is a miserable life with the Dursleys, his horrible aunt and uncle, and their abominable son, Dudley - a great big swollen spoiled bully. Harry's room is a closet at the foot of the stairs, and he hasn't had a birthday party in eleven years.

But all that is about to change when a mysterious letter arrives by owl messenger: a letter with an invitation to an incredible place that Harry - and anyone who reads about him - will find unforgettable.

For it's there that he finds not only friends, aerial sports, and magic in everything from classes to meals, but a great destiny that's been waiting for him... if Harry can survive the encounter.&#13;&#10;....."></textarea>
						</td>
					</tr>
					<tr>
						<td class="first_td">
							출판사 상품 평가
						</td>
						<td>
							<textarea rows="25" cols="100" name="goods_publisher_comment" placeholder="Ex:&#13;&#10;The breakaway bestseller is now in paperback. In a starred review, PW said, 'Readers are in for a delightful romp with this debut from a British author who dances in the footsteps of P.L. Travers and Roald Dahl.' Ages 8-12.
- Publishers Weekly

Grade 4-7-Harry Potter has spent 11 long years living with his aunt, uncle, and cousin, surely the vilest household in children's literature since the family Roald Dahl created for Matilda (Viking, 1988). But like Matilda, Harry is a very special child; in fact, he is the only surviving member of a powerful magical family. His parents were killed by the evil Voldemort, who then mysteriously vanished, and the boy grew up completely ignorant of his own powers, until he received notification of his acceptance at the Hogwarts School of Witchcraft and Wizardry. Once there, Harry's life changes dramatically. Hogwarts is exactly like a traditional British boarding school, except that the professors are all wizards and witches, ghosts roam the halls, and the surrounding woods are inhabited by unicorns and centaurs. There he makes good friends and terrible enemies. However, evil is lurking at the very heart of Hogwarts, and Harry and his friends must finally face the malevolent and powerful Voldemort, who is intent on taking over the world. The delight of this book lies in the juxtaposition of the world of Muggles (ordinary humans) with the world of magic. A whole host of unique characters inhabits this world, from the absentminded Head Wizard Dumbledore to the sly and supercilious student Draco Malfoy to the loyal but not too bright Hagrid. Harry himself is the perfect confused and unassuming hero, whom trouble follows like a wizard's familiar. After reading this entrancing fantasy, readers will be convinced that they, too, could take the train to Hogwarts School, if only they could find Platform Nine and Three Quarters at the King's Cross Station.
- School Library Journal&#13;&#10;....."></textarea>
						</td>
					</tr>
					<tr>
						<td class="first_td">
							추천사
						</td>
						<td>
							<textarea rows="25" cols="100" name="goods_recommendation" placeholder="Ex:&#13;&#10;Harry Potter has no idea how famous he is. That's because he's being raised by his miserable muggle aunt and uncle who are terrified Harry will learn that he's a wizard, just as his parents were.
But everything changes when Harry is summoned to attend an infamous school for wizards and he begins to discover some clues about his illustrious birthright.
From the surprising way he is greeted by a lovable giant, to the unique curriculum and colorful faculty at his unusual school, Harry finds himself drawn deep inside a mystical world he never knew existed and closer to his own noble destiny. --This text refers to an out of print or unavailable edition of this title.&#13;&#10;....."></textarea>
						</td>
					</tr>
					<tr>
						<td class="first_td">
							상품이미지
						</td>
						<td>
							<table class="inner_table">
								<tr>
									<td align="right">이미지파일 첨부</td>
						            
						            <td  align="left"> <input type="button" class="btn" value="파일 추가" onClick="fn_addFile()"/></td>
						            <td>
							            <div id="d_file">
							            </div>
						            </td>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
			
			<div id="newproduct_add_btn_wrapper">
				<input type="button" class="btn_medium" value="등록하기" onClick="fn_add_new_goods(this.form)">
			</div>
			
		</form>
	</div>
		<%-- <div id="head_wrapper">
			<div id="head_wrapper_title">
				<h3>&nbsp;새상품 등록창</h3>
			</div>
			<div id="head_wrapper_btn">
				<input type="button" class="btn" value="등록하기" onClick="fn_add_new_goods(this.form)">
			</div>
		</div>
		<form action="${contextPath}/admin/goods/addNewGoods.do" method="post"  enctype="multipart/form-data">
			<div class="tab_container">
				<div class="tab_container" id="container">
					<ul class="tabs">
						<li><a href="#tab1">상품정보</a></li>
						<li><a href="#tab2">상품목차</a></li>
						<li><a href="#tab3">상품저자소개</a></li>
						<li><a href="#tab4">상품소개</a></li>
						<li><a href="#tab5">출판사 상품 평가</a></li>
						<li><a href="#tab6">추천사</a></li>
						<li><a href="#tab7">상품이미지</a></li>
					</ul>
					<div class="tab_container">
						<div class="tab_content" id="tab1">
							<table id="productinfo_form">
								<tr>
									<td width=200 >제품분류</td>
									<td width=500><select name="goods_sort">
											<option value="컴퓨터와 인터넷" selected>컴퓨터와 인터넷
											<option value="디지털 기기">디지털 기기
										</select>
									</td>
								</tr>
								
								<tr>
									<td>제품이름</td>
									<td><input name="goods_title" type="text" size="40" placeholder="Ex: Harry Potter"/></td>
								</tr>
								
								<tr>
									<td>저자</td>
									<td><input name="goods_writer" type="text" size="40" placeholder="Ex: J.K. Rowling"/></td>
								</tr>
								
								<tr>
									<td>출판사</td>
									<td><input name="goods_publisher" type="text" size="40" placeholder="Ex: Pottermore Publishing"/></td>
								</tr>
								
								<tr>
									<td>제품정가</td>
									<td><input name="goods_price" type="text" size="40" placeholder="Ex: 15"/></td>
								</tr>
								
								<tr>
									<td>제품판매가격</td>
									<td><input name="goods_sales_price" type="text" size="40" placeholder="17"/></td>
								</tr>
								
								<tr>
									<td>제품 구매 포인트</td>
									<td><input name="goods_point" type="text" size="40" placeholder="1"/></td>
								</tr>
								
								<tr>
									<td>제품출판일</td>
									<td><input  name="goods_published_date"  type="date" size="40" /></td>
								</tr>
								
								<tr>
									<td>제품 총 페이지수</td>
									<td><input name="goods_total_page" type="text" size="40" placeholder="Ex: 345"/></td>
								</tr>
								
								<tr>
									<td>ISBN</td>
									<td><input name="goods_isbn" type="text" size="40" placeholder="Ex: B019ABCDEF"/></td>
								</tr>
								
								<tr>
									<td>제품 배송비</td>
									<td><input name="goods_delivery_price" type="text" size="40" placeholder="Ex: 2"/></td>
								</tr>
								
								<tr>
									<td>제품 도착 예정일</td>
									<td><input name="goods_delivery_date"  type="date" size="40" /></td>
								</tr>
								
								<tr>
									<td>제품종류</td>
									<td>
										<select name="goods_status">
											<option value="bestseller">베스트셀러</option>
											<option value="steadyseller">스테디셀러</option>
											<option value="newbook" selected>신간</option>
											<option value="on_sale">판매중</option>
											<option value="buy_out">품절</option>
											<option value="out_of_print">절판</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>
									<br>
									</td>
								</tr>
							</table>	
						</div>
						
						<div class="tab_content" id="tab2">
							<H4>책목차</H4>
							<table>	
							 <tr>
								<td></td>
								<td><textarea  rows="100" cols="80" name="goods_contents_order"></textarea></td>
							</tr>
							</table>	
						</div>
						<div class="tab_content" id="tab3">
							<H4>제품 저자 소개</H4>
							 <table>
			  				 <tr>
								<td></td>
								<td><textarea  rows="100" cols="80" name="goods_writer_intro"></textarea></td>
						    </tr>
						   </table>
						</div>
						<div class="tab_content" id="tab4">
							<H4>제품소개</H4>
							<table>
								<tr>
									<td ></td>
									<td><textarea  rows="100" cols="80" name="goods_intro"></textarea></td>
							    </tr>
						    </table>
						</div>
						<div class="tab_content" id="tab5">
							<H4>출판사 제품 평가</H4>
							<table>
							 <tr>
								<td></td>
								<td><textarea  rows="100" cols="80" name="goods_publisher_comment"></textarea></td>
						    </tr>
						</table>
						</div>
						<div class="tab_content" id="tab6">
							<H4>추천사</H4>
							 <table>
								 <tr>
								   <td></td>
								    <td><textarea  rows="100" cols="80" name="goods_recommendation"></textarea></td>
							    </tr>
						    </table>
						</div>
						<div class="tab_content" id="tab7">
							<h4>상품이미지</h4>
							<table >
								<tr>
									<td align="right">이미지파일 첨부</td>
						            
						            <td  align="left"> <input type="button"  value="파일 추가" onClick="fn_addFile()"/></td>
						            <td>
							            <div id="d_file">
							            </div>
						            </td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</form> --%>
	<!-- </div> -->
</body>