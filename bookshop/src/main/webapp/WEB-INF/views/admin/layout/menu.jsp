<%@ page pageEncoding="utf-8"%>
<!-- Thêm taglib core để xài dc if,choose,for,while -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/home/index">Home</a>
    </div>
    <ul class="nav navbar-nav">
    	<li class="dropdown">
        	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Management<span class="caret"></span></a>
        	<ul class="dropdown-menu">
          		<li><a href="/admin/category/index">Category</a></li>
          		<li><a href="/admin/product/index">Product</a></li>
          		<li><a href="/admin/customer/index">Customer</a></li>
          		<li><a href="/admin/order/index">Order</a></li>
        	</ul>
      </li>
      <li class="dropdown">
        	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Report<span class="caret"></span></a>
        	<ul class="dropdown-menu">
          		<li><a href="/admin/inventory/index">Inventory By Category</a></li>
          		<li><a href="/admin/revenue/category">Revenue By Category</a></li>
          		<li><a href="/admin/revenue/customer">Revenue By Customer</a></li>
          		<li><a href="/admin/revenue/year">Revenue By Year</a></li>
          		<li><a href="/admin/revenue/month">Revenue By Month</a></li>	
        	</ul>
      </li>
    </ul>
  </div>
</nav>