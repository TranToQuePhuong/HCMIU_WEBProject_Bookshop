$(document).ready(function() {
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