<%-- <%@ page pageEncoding="utf-8"%>
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
--%>

<%@ page pageEncoding="utf-8"%>
<!-- Thêm taglib core để xài dc if,choose,for,while -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<nav class="navbar navbar-inverse not-margin">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/home/index">Home</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="/home/about">About</a></li>
      <li><a href="#footer">Contact</a></li>
      <li><a href="/home/feedback">Feedback</a></li>
      <li><a href="/home/faq">FAQ</a></li>
			<li>
				<form class="navbar-form navbar-right"
					action="/product/list-by-keywords" method="post">
					<div class="form-group" style="text-align: center">
						<input type="text" value="${param.keywords}" class="form-control"
							name="keywords" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">
						<span class="glyphicon glyphicon-search"></span> Search
					</button>
				</form>
			</li>
		</ul>

    
 	<ul class="nav navbar-nav navbar-right">

			<c:choose>
				<c:when test="${!empty sessionScope.user}">
					<li><img src="/static/avatar/${photo}" alt="Avatar" class="avatar"> </li>
					<li><a href="#">${fullname}</a> </li>
					</c:when>
			</c:choose>
			<li>
				
				 	<c:choose>
					<c:when test="${!empty sessionScope.user}">
 						<a href="/cart/view" class = "btn btn-default glyphicon glyphicon-shopping-cart button_adapter_menu"></a>
 					</c:when>
 				</c:choose>
			</li>
			<li>
				<a href="#menu-toggle" class="btn btn-default glyphicon glyphicon-align-justify button_adapter_menu" id="menu-toggle"></a>
			</li>
			 			
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span></a>
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<!-- Chưa đăng nhập thì chỉ thấy 3 mục -->
						<ul class="dropdown-menu">
							<li><a href="/account/login"><span class = "fa fa-sign-in"></span> Log In</a></li>
							<li><a href="/account/register">Sign Up</a></li>
							<li><a href="/account/forgotPassword"><span class = "fa fa-unlock-alt"></span> Forgot Password?</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<!-- Sau đăng nhập thì thấy 4 mục như sau -->
						<ul class="dropdown-menu medium-dropdown-menu">
							<li><h3 style="color:black; padding-left: 10px; font-size: 18px;">${fullname},</h3></li>
							<li><a href="/account/changePassword">Change Password</a></li>
							<li><a href="/account/update">Update</a></li>
							<li><a href="/order/list">Order</a></li>
							<li><a href="/order/items"><span class = "fa fa-shopping-basket"></span> Purchased List</a></li>
							<li><a href="/account/logout"><span class = "fa fa-sign-out"></span> Log out</a></li>
						</ul>
					</c:otherwise>

				</c:choose></li>
    </ul>
  </div>
</nav>