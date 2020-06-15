<%@ page pageEncoding="utf-8"%>
<div class="container" style="padding: 30px">
		<div class="row">
			<div class="col-md-12">
				<h2>CHANGE PASWORD</h2>
				<h4>${message}</h4>
				<div class = "form-container">
					<form action="/account/changePassword" method="post">
						<div class="form-group">
							<label>Username</label> 
							<input name="id" class="form-control">
						</div>
						<div class="form-group">
							<label>Current Password:</label> 
							<input name="pw" type="password"class="form-control">
						</div>
						<div class="form-group">
							<label>New Password:</label> 
							<input name="npw1" type="password" class="form-control">
						</div>
						<div class="form-group">
							<label>Confirm New Password:</label> 
							<input name="npw2" type="password" class="form-control">
						</div>
						<div class="form-group">
							<button class="btn btn-default">Change Password</button>
						</div>
					</form>
				</div>
		</div>
	</div>
</div>
