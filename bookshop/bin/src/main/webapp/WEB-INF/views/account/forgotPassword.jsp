<%@ page pageEncoding="utf-8"%>

<h2>FORGOT PASWORD</h2>
<h4>${message}</h4>
<form action="/account/forgotPassword" method="post">
	<div class="form-group">
		<label>Username</label> 
		<input name="id" class="form-control">
	</div>
	<div class="form-group">
		<label>Email</label> 
		<input name="email" class="form-control">
	</div>
	<div class="form-group">
		<button class="btn btn-default">Request Password</button>
	</div>
</form>
