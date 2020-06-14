<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container" style="padding: 30px">
		<div class="row">
			<div class="col-md-12">
				<h2>ORDER INFORMATION</h2>
				<h4>${message}</h4>
				<form:form action="/order/checkout" modelAttribute="order">
					<div class="form-group">
						<label>Order ID</label> 
						<form:input path="id" class="form-control" readonly="true"/>
					</div>
					<div class="form-group">
						<label>Customer</label> 
						<form:input path="customer.id" class="form-control" readonly="true"/>
					</div>
					<div class="form-group">
						<label>Order Date</label> 
						<form:input path="orderDate" class="form-control" readonly="true"/>
					</div>
					<div class="form-group">
						<label>Shipping Address</label> 
						<form:input path="address" class="form-control" readonly="true"/>
					</div>
					<div class="form-group">
						<label>Total Amount</label> 
						<form:input path="amount" class="form-control" readonly="true"/>
					</div>
					<div class="form-group">
						<label>Notes</label> 
						<form:textarea path="description" rows ="3" class="form-control" readonly="true"/>
					</div>
					
				</form:form>
				
				<h2>ORDER DETAIl</h2>
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
					<c:forEach var="d" items="${details}"> 
						<tr>
							<td>${d.product.id} </td>
							<td>${d.product.name} </td>		
							<td>${d.unitPrice} </td>
							<td>${d.discount} </td>
							<td>${d.quantity} </td>
							<td>${d.quantity * d.unitPrice * (1 - d.discount)} </td>		
						</tr>	
					
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
</div>
