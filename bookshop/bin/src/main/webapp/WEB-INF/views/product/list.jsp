<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:forEach var="p" items="${list}"> 
	<div class="col-sm-4">
		<div class="thumbnail">
      		<a href="/product/detail/${p.id}">
        		<img class="bookshop-prod" src="/static/products/${p.image}">
        	</a>   
        	<div class="caption" >   
     			<p class="overflow-fix">${p.name}</p>
        		<div data-id="${p.id}" class="pull-right">
         			<button class="btn btn-sm btn-danger">
         				<i class="glyphicon glyphicon-shopping-cart"></i>
         			</button>
         			<button class="btn btn-sm btn-warning btn-star">
         			<!-- btn-star la cua minh, dung jQuery de viet -->
         				<i class="glyphicon glyphicon-star"></i>
         			</button>
       			</div>  
 				<p>${p.unitPrice}</p>
       		</div>
       		 	
		</div>
	</div>
</c:forEach>