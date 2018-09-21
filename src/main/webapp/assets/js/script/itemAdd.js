
    var tot_list = 0;

	$(function(){
		/**마우스 커서가 들어감*/
		$(".item_image").mouseenter(function(){
			$(this).parent().next().css("visibility","visible");
			
		});
		
		$(".hidden_layer").mouseleave(function(){
			$(this).css("visibility","hidden");
		});
		
		
		$(".hidden_form > .plus").click(function(){
			var cnt = $(this).prev().text();
			var cntSum = Number(cnt) + 1;
			$(this).prev().text(cntSum);
			
			var price = $(this).next().attr("data-default");
			var priceMul = Number(price) * cntSum;
			$(this).next().text(priceMul);
				
		});
		
		$(".hidden_form > .minus").click(function(){
			var cnt = $(this).next().text();
			var cntSum = Number(cnt) - 1;
			$(this).next().text(cntSum);
			var price = $(this).next().next().next().attr("data-default");
			var priceMul = Number(price) * cntSum;
			$(this).next().next().next().text(priceMul);
		});
		
 		$(".hidden_form > .item_add").click(function(){
 			 
 			 var item_num = $(this).parent().children().eq(0).text();
 			 var item_name = $(this).parent().children().eq(1).text();
             var item_qty = $(this).parent().children().eq(3).text();
			 var default_price = $(this).parent().children().eq(5).attr("data-default");
			 var price = Number(default_price) * Number(item_qty);
			 var check = true;
			 if(tot_list !=0){
				 
				 $(".buyList").find("[name='item_num']").each(function() {
					 if($(this).val() == item_num){
						 $(this).next().next().val(item_qty);
						 $(this).next().next().next().next().val(price); 
						 check = false;
					 }
				 });
			 }
			 
			 if(check){
				 var str_content = "";
				 str_content += "<span class=\"item\">";
				 str_content += "<li><input class=\"item_name\" type=\"text\" name=\"item_name\" value=\""+item_name+"\" readonly>";
				 str_content += "<input type=\"button\" class=\"delete\" value=\"x\">";
				 str_content += "</li>";
				 str_content += "<li>";
				 str_content += "<input type=\"hidden\" name=\"item_num\" value=\""+item_num+"\">";
				 str_content += "<input type=\"button\" class=\"minus\" value=\"-\">";
				 str_content += "<input class=\"item_qty\" type=\"text\" name=\"item_qty\" id=\"item_qty\" value=\""+item_qty+"\" readonly>";
				 str_content += "<input type=\"button\" class=\"plus\" value=\"+\">";
				 str_content += "<input class=\"item_price\" type=\"text\" name=\"item_price\" id=\"item_price\" value=\""+price+"\" data-default = \""+default_price+"\" readonly>";
				 str_content += "</li>";
				 str_content += "<li><hr></li>";
				 str_content += "</span>";
				 $(".buyList").children().children().children().eq(0).append(str_content);
	 			 tot_list = tot_list + 1;
			 }
			 
			 var price_temp = 0;
			 $(".buyList").find("[name='item_price']").each(function() {

					 price_temp += Number($(this).val());
					 
			 });
			 $("#total_money").children().text(price_temp);
			 
		});
 		
 		
		
	});
	