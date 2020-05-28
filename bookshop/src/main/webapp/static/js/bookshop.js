$(document).ready(function() {
	$(".btn-cart-clear").click(function() {
		 $.ajax({
			url : "/cart/clear",
			success : function(response) {
				$("#cart-cnt").html(0);
				$("#cart-amt").html(0);
				$("table>tbody").html("");
			}
		});
	});
	
	$(".btn-cart-remove").click(function() {
		var id = $(this).closest("tr").attr("data-id");
		 $.ajax({
			url : "/cart/remove/" + id,
			success : function(response) {
				$("#cart-cnt").html(response[0]);
				$("#cart-amt").html([1]);
			},
			error:function (e) {
				 alert("Failed: " + status.responseText);
				 console.log(status.responseText)
				//console.log(e)
		     },
		});
		$(this).closest("tr").remove();
	});
	
	$(".btn-add-to-cart").click(function() {
		var id = $(this).closest("div").attr("data-id");
		console.log(id)
		$.ajax({
			url : "/cart/add/" + id,
			type: "get",
			data:"",
			contentType: "application/json; charset=utf-8",
			success:function(response) {
				$("#cart-cnt").html(response[0]);
				$("#cart-amt").html(response[1]);
				console.log(response);
			},
			error:function (e) {
				 alert("Failed: " + status.responseText);
				 console.log(status.responseText)
				//console.log(e)
		     },
	
			
		});
		var img = $(this).closest(".thumbnail").find("a>img");
		var options = {to:'#cart-img',className:'cart-fly'}
		var cart_css = '.cart-fly{background-image: url("'+img.attr("src")+'");background-repeat: no-repeat; background-size: cover;}';
		$("style#cart-css").html(cart_css);
			
		//transfer from #cart-img to cart-img 
		img.effect('transfer', options,1000); // 1000 ms = 1s
	
	
	});
	
	
	
	$(".btn-star").click(function() {
		var id = $(this).closest("div").attr("data-id");
		 $.ajax({
//			type : "GET",
			url : "/product/add-to-favo/" + id,
//			contentType : "application/json;charset=utf-8",
//			data : "",
//			dataType : "json",
			success : function(response) {
				console.log(response);
				if (response=="1") {
					alert("Da them vao thanh cong")
				} else {
					alert("Da co san")
				}
			},
			//error : function(e) {
				//console.log(2)
				//console.log(e);
			//},
			//async : false

		})
	});
});