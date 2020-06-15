<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class = "bg">
<div class="container" style="padding: 30px">
	<div class="row">
		<div class="col-md-12">
			<h2>${message}</h2>
			
			<c:choose>
				<c:when test="${empty sessionScope.user}">
					<!-- Chưa đăng nhập -->
					<div class = "col-md-4"></div>
					<form class = "form-container col-md-4" action="/account/login" method="post">
						<h3>LOGIN</h3>
						<div class="form-group">
							<label><span class = "glyphicon glyphicon-user"></span> Username</label> <input name="id" class="form-control"
								value="${uid}">
						</div>
						<div class="form-group">
							<label><span class = "glyphicon glyphicon-lock"></span> Password</label> <input name="pw" type="password" class="form-control"
								value="${pwd}">
						</div>
						<div class="form-group">
							<div class="form-control">
								<input name="rm" type="checkbox"> 
								<label>Remember me?</label>
							</div>
						</div>
						<div class="form-group">
							<button class="btn btn-default">Login</button>
						</div>
					</form>
				</c:when>
				
			<c:otherwise>
					<!-- Sau đăng nhập  -->
				<h4>Welcome , ${fullname}!</h4>
				<a href="/home/index" class = "btn btn-default">Home</a>
			</c:otherwise>

			</c:choose>
			<%-- 
			<form action="/account/login" method="post">
				<div class="form-group">
					<label>Username</label> <input name="id" class="form-control"
						value="${uid}">
				</div>
				<div class="form-group">
					<label>Password</label> <input name="pw" class="form-control"
						value="${pwd}">
				</div>
				<div class="form-group">
					<div class="form-control">
						<input name="rm" type="checkbox"> <label>Remember
							me?</label>
					</div>
				</div>
				<div class="form-group">
					<button class="btn btn-default">Login</button>
				</div>
			</form>
			--%>
		</div>
	</div>
</div>
</div>
