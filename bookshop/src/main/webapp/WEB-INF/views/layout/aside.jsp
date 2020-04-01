<%@ page pageEncoding="utf-8"%>

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
  	<form action="/product/search" method="post">
  		<input class="form-control" name="keywords" placeholder="Keywords" >
  	</form>
  </div>
</div>

<div class="panel panel-default">
  <div class="panel-heading">SHOP BY CATEGORY</div>
  <div class="list-group">
  	<a href="#" class="list-group-item">First item</a>
  	<a href="#" class="list-group-item">Second item</a>
 	<a href="#" class="list-group-item">Third item</a>
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



