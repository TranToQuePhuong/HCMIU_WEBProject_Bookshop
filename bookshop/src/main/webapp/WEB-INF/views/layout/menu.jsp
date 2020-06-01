<%@ page pageEncoding="utf-8"%>
<!-- Thêm taglib core để xài dc if,choose,for,while -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/home/index">Home</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="/home/about">About</a></li>
      <li><a href="/home/contact">Contact</a></li>
      <li><a href="/home/feedback">Feedback</a></li>
      <li><a href="/home/faq">FAQ</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Account<span class="caret"></span></a>
        <c:choose>
        	<c:when test="${empty sessionScope.user}">
        		<!-- Chưa đăng nhập thì chỉ thấy 3 mục -->
        		<ul class="dropdown-menu">
          			<li><a href="/account/login">Log In</a></li>
          			<li><a href="/account/register">Sign Up</a></li>
          			<li><a href="/account/forgotPassword">Forgot Password?</a></li>
        		</ul>
        	</c:when>
        	<c:otherwise>
        		 <!-- Sau đăng nhập thì thấy 4 mục như sau -->
        		<ul class="dropdown-menu">
         			<li><a href="/account/logout">Sign Out</a></li>
          			<li><a href="/account/changePassword">Change Password</a></li>
          			<li><a href="/account/update">Update</a></li>
          			<li><a href="/order/list">Order</a></li>
          			<li><a href="/order/items">Purchased List</a></li>
        		</ul>
        	</c:otherwise>
        	
        </c:choose>
       
       
       
      </li>
    </ul>
    
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#">Vietnamese</a></li>
      <li><a href="#">English</a></li>
    </ul>
    
  </div>
</nav>