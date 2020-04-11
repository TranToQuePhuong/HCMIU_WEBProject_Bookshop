<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel panel-default">
  <div class="panel-heading">SHOPPING CART</div>
  <div class="panel-body">
  	<img src="/static/shoppingcart.jpg" class="col-sm-5">
  	<ul class="col-sm-7">
  		<li> 10 </li>
  		<li> 150$ </li>
  		<li>
  			<a href="">YOUR CART</a>
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
  	<a href="#" class="list-group-item">New</a>
  	<a href="#" class="list-group-item">Best-selling</a>
 	<a href="#" class="list-group-item">Favorite</a>
 	<a href="#" class="list-group-item">Sale</a>
  </div>
</div>



