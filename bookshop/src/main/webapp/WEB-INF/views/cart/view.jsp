<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="container" style="padding: 30px">
		<div class="row">
			<div class="col-md-12">
			
			<h2>SHOPPING CART</h2>
			
			<table class = "table table-striped">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Unit Price</th>
						<th>Discount</th>
						<th>Quantity</th>
						<th>Amount</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="p" items="${sessionScope['scopedTarget.cartService'].items}"> 
					<tr data-id="${p.id}" data-price="${p.unitPrice}" data-discount="${p.discount}">
						<td>${p.id} </td>
						<td>${p.name} </td>		
						<td>${p.unitPrice} </td>
						<td>${p.discount} </td>
						<td><input value="${p.quantity}" type="number" min = "1" style="width:70px;" placeholder="quantity"> </td>
						<!-- discount -->
						<td class="amt">${p.quantity * p.unitPrice * (1 - p.discount)} </td>
						<td>
							<button class="btn btn-sm btn-warning btn-cart-remove">
								<i class="glyphicon glyphicon-trash"></i>
							</button>
						</td>				
					
					</tr>	
				
				</c:forEach>
				</tbody>
			
			</table>
			<button class="btn btn-sm btn-danger btn-cart-clear">Clear</button>
			<button class="btn btn-sm btn-info">Continue</button>
			<a href="/order/checkout" class="btn btn-sm btn-success">Checkout</a>
		</div>
	</div>
</div>
					