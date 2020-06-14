<%@ page pageEncoding="utf-8"%>

<h2>FORGOT PASWORD</h2>
<h4>${message}</h4>
<form action="/account/changePassword" method="post">
	<div class="form-group">
		<label>Username</label> 
		<input name="id" class="form-control">
	</div>
	<div class="form-group">
		<label>Current Password:</label> 
		<input name="pw" class="form-control">
	</div>
	<div class="form-group">
		<label>New Password:</label> 
		<input name="npw1" class="form-control">
	</div>
	<div class="form-group">
		<label>Confirm New Password:</label> 
		<input name="npw2" class="form-control">
	</div>
	<div class="form-group">
		<button class="btn btn-default">Change Password</button>
	</div>
</form>
