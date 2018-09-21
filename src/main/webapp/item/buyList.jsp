<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/buyList.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"src="../assets/js/jquery-3.3.1.min.js"></script>
<script>

    $(function () {
        $("#datepicker").datepicker({
        		
        		minDate: +2,
            	maxDate: +10
        
        });    	

        
        var item_delete = function(){
        	
        	$(this).parent().parent().detach();
        	var price_temp = 0;
			 $(".buyList").find("[name='item_price']").each(function() {
				price_temp += Number($(this).val()); 
			 });
			 $("#total_money").children().text(price_temp);
        	
        }
        
        var minus_delete = function(){
        	
			 $(".buyList").find("[name='item_qty']").each(function() {
				 
				var item_qty = Number($(this).val());
				
				if(item_qty==0){
					$(this).parent().parent().detach();
				}
			 });	 
        }
        
        $(document).on("click", ".delete", item_delete);
        
        $(document).on("click", ".item .minus", function(){
 			var cnt = $(this).next().val();
			var cntSum = Number(cnt) - 1;
			var check = true;
			
			if(cntSum==0){
				check = confirm("항목을 삭제하시겠습니까?");
			}
			
			if(check){
				$(this).next().val(cntSum);
				var price = $(this).next().next().next().attr("data-default");
				var priceMul = Number(price) * cntSum;
				$(this).next().next().next().val(priceMul);	 
			
				 var price_temp = 0;
				 $(".buyList").find("[name='item_price']").each(function() {
					price_temp += Number($(this).val()); 
				 });
				 $("#total_money").children().text(price_temp);
			}
			
			$(minus_delete);
			
        });
        
        $(document).on("change", ".item .item_qty", function(){
        	alert("1234");
        	if($(this).val()==0){
	        	$(this).parent().parent().detach();
	        	var price_temp = 0;
				 $(".buyList").find("[name='item_price']").each(function() {
					price_temp += Number($(this).val()); 
				 });
				 $("#total_money").children().text(price_temp);
        	}
        });
        
        
        $(document).on("click", ".item .plus", function(){
 			var cnt = $(this).prev().val();
			var cntSum = Number(cnt) + 1;
		    $(this).prev().val(cntSum);
			
			var price = $(this).next().attr("data-default");
			var priceMul = Number(price) * cntSum;
			$(this).next().val(priceMul); 
			
			 var price_temp = 0;
			 $(".buyList").find("[name='item_price']").each(function() {
				price_temp += Number($(this).val()); 
			 });
			 $("#total_money").children().text(price_temp);
        });
        
        
        
        $("#addButton").click(function(){
        	alert("142");
        	
        	   var queryString = $("form[name=testForm]").serialize() ;

               $.ajax({
                   type : 'post',
                   url : 'cartAdd?category=${param.category}',
                   data : {
                	   p_store:'강남점',
                	   p_request_date:'11/11/11',
                	   p_request_time:'12:00 ~ 13:00',
                	   item_num:'2',
                	   item_qty:'3',
                	   item_tot:'33000'
                	   
                   },

                   success : function(json){
                	   alert("123");
                       alert(json.item_num)
                   },
                   error: function(xhr, status, error){
                	   alert(error);
                   }
               });
        	
        	
/* 			 $(".buyList").find("[name='item_name']").each(function() {
					
					var item_name = $(this).val();
					var item_num = $(this).parent().next().children().val();
					var item_qty = $(this).parent().next().children().next().next().val();
					var item_price = $(this).parent().next().children().next().next().next().next().val();
				 }); */
        	
        	
        });
        

    });
</script>

</head>
<body>
	<div class="buyList">
		<form action="cartAdd?category=${param.category}" method="post" name="cartAddForm">
			<ul>
				<li>
					<span>ADD PRODUCT</span>
				</li>

				<li id="total_money"><!-- 토탈가격 디스플레이만-->
				Total : <span><strong>0</strong></span>
				</li>
				<li>픽업요청날짜</li>
				<li><input class="buyButton" type="text" name="p_request_date" id="datepicker"></li>
				<li>픽업요청시간</li>
				<li>
					<select class="buyButton" name="p_request_time">
						<option selected>--- 선택하세요 ---</option>
						<option value="12:00 ~ 13:00">12:00 ~ 13:00</option>
						<option value="13:00 ~ 14:00">13:00 ~ 14:00</option>
						<option value="14:00 ~ 15:00">14:00 ~ 15:00</option>
						<option value="15:00 ~ 16:00">15:00 ~ 16:00</option>
						<option value="16:00 ~ 17:00">16:00 ~ 17:00</option>
						<option value="17:00 ~ 18:00">17:00 ~ 18:00</option>
					</select>
				</li>
				<li>픽업할 매장</li>
					<li>
						<select class="buyButton" name="p_store">
							<option selected>--- 선택하세요 ---</option>
							<option value="종로점">종로점</option>
							<option value="강남점">강남점</option>
							<option value="가산점">가산점</option>
						</select>
					</li>
				
		
				<li>
				<input type="button" value="장바구니 담기" id="addButton">
				</li>
				<li>
				<input type="reset" value="목록비우기" class="buyButton">
				</li>
			</ul>
		</form>
	</div>
</body>
</html>