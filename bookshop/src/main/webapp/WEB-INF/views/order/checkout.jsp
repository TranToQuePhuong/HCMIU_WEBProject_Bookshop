<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}"/> 
<div class="container" style="padding: 30px">
		<div class="row">
			<div class="col-md-12">
			<h1>SHOPPING CART</h1>
			<table class = "table">
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
					<tr>
						<td>${p.id} </td>
						<td>${p.name} </td>		
						<td>${p.unitPrice} </td>
						<td>${p.discount} </td>
						<td>${p.quantity} </td>
						<td>${p.quantity * p.unitPrice * (1 - p.discount)} </td>		
					</tr>	
				
				</c:forEach>
				</tbody>
			</table>
			
			
			<h1>CHECKOUT</h1>
			<h2>${message}</h2>
			<form:form action="/order/checkout" modelAttribute="order">
			
				<div class="form-group">
					<label>Customer</label> 
					<form:input path="customer.id" class="form-control" readonly="true"/>
				</div>
				<div class="form-group">
					<label>Order Date</label> 
					<form:input path="orderDate" class="form-control" readonly="true"/>
				</div>
				<div class="form-group">
					<label>Total Amount</label>
					<form:input path="amount" class="form-control " readonly="true" />
				</div>
				<div class="form-group">
					<label>Shipping Address</label> 
					<form:input path="address" class="form-control" required = "true"/>
				</div>
				<div class="form-group">
					<label>Notes</label> 
					<form:textarea path="description" rows ="3" class="form-control"/>
				</div>
				<div class="form-group">
				<c:if test="${cart.amount == 0}">
						<div class="alert alert-danger" role="alert">
							There is no product in your cart!
						</div>
						<a href = "/home/index"><button type="button" class="btn btn-outline-dark">Continue to buy</button></a> 
						<br><br> 
						<button class="btn btn-default" disabled>Purchase</button>
				</c:if>
				<c:if test="${cart.amount > 0}">
					<button class="btn btn-default">Purchase</button>
				</c:if>
				</div>
				
			</form:form>
		</div>
	</div>
</div>
