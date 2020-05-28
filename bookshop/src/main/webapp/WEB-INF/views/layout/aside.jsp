<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}"/> 
<div class="panel panel-default">
  <div class="panel-heading">SHOPPING CART</div>
  <div class="panel-body">
  	<img id="cart-img" src="/static/shoppingcart.jpg" class="col-sm-5">
  	<ul class="col-sm-7">
  		<li><b id="cart-cnt">${cart.count}</b> items </li>
  		<li><b id="cart-amt">${cart.amount}</b>VND</li>
  		<li>
  			<a href="/cart/view">YOUR CART</a>
  		</li>
  	</ul>
  </div>
</div>

<div class="panel panel-default">
  <div class="panel-heading">SEARCH</div>
  <div class="panel-body">
  	<form action="/product/list-by-keywords" method="post">
  		<input value="${param.keywords}"class="form-control" name="keywords" placeholder="Keywords" >
  	</form>
  </div>
</div>

<div class="panel panel-default">
  <div class="panel-heading">SHOP BY CATEGORY</div>
  <div class="list-group">
  <c:forEach var="c" items="${cates}">
  	<a href="/product/list-by-category/${c.id}" class="list-group-item">${c.nameVN}</a>
  </c:forEach>
  </div>
</div>

<div class="panel panel-default">
  <div class="panel-heading">FILTER BY</div>
  <div class="list-group">
  	<a href="/product/list-by-special/0" class="list-group-item">New arrivals</a>
  	<a href="/product/list-by-special/1" class="list-group-item">Best-selling</a>
 	<a href="/product/list-by-special/2" class="list-group-item">Most viewed</a>
 	<a href="/product/list-by-special/3" class="list-group-item">Sale</a>
  </div>
</div>

<style id="cart-css"></style>


