<%@ page pageEncoding="utf-8"%>
<div class="container" style="padding: 92px">
		<div class="row">
			<div class="col-md-12">
				<h2>${message}</h2>
				<form action="/account/forgotPassword" method="post" class = "form-container">
					
					<div style="text-align:center">
						<span class = "fa fa-lock text-center" style = "font-size:100px;"></span>
						<h2>FORGOT PASWORD?</h2>
						</div>
					<div class="form-group">
						<label><span class = "glyphicon glyphicon-user"></span> Username</label> 
						<input name="id" class="form-control">
					</div>
					<div class="form-group">
						<label><span class = "fa fa-envelope"></span> Email</label> 
						<input name="email" class="form-control">
					</div>
					<div class="form-group">
						<button class="btn btn-default">Request Password</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
