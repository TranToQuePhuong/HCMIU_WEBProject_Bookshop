<%-- <%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Online Shopping Mall</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="/static/css/bookshop.css" rel="stylesheet"/>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="/static/jqueryui/jquery-ui.min.css" rel="stylesheet">
	<script src="/static/jqueryui/jquery-ui.min.js"></script>
	<script src="/static/js/bookshop.js"></script>
	
	
</head>
<body>

	<div class="container">
		<header class="row custom">
			<h1 class="alert alert-success backGround">Online Shopping Mall</h1>
		</header>
		<nav class="row">
			<tiles:insertAttribute name="menu"/>
		</nav>
		<div class="row">
			<article class="col-sm-9">
				<tiles:insertAttribute name="body"/>
			</article>
			<aside class="col-sm-3">
				<tiles:insertAttribute name="aside"/>
			</aside>		
		</div>
		<footer class="row">
			<p class="text-center">&copy;2020. All rights reserved</p>
		</footer>
	</div>

</body>
</html>
--%>
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Online Store</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<%--	<link rel="stylesheet" href="/static/css/bookshop.css"> --%>
<link rel="stylesheet" href="/static/css/test6.css">
<link rel="stylesheet" href="/static/css/homepage2.css">



<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="/static/jqueryui/jquery-ui.min.css" rel="stylesheet">
<script src="/static/jqueryui/jquery-ui.min.js"></script>
<script src="/static/js/bookshop1.js"></script>

<!-- Icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



</head>
<body>
	<!-- Header -->
	<header class="header-height">
		<!-- Nav bar -->
		<div class="container-fluid">
			<nav class="row">
				<tiles:insertAttribute name="menu" />
			</nav>
		</div>
		<!-- /Nav bar -->
	</header>
	<!-- /Header -->
	<div id="wrapper" class="toggled">
		<!-- Sidebar wrapper -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav ">

				<li class="sidebar-brand"><a href="#"
					class="sidebar-brand-text" style="color: white;"> Bukkie </a></li>
				<li><tiles:insertAttribute name="aside" /></li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->

	</div>
	<!-- Body -->
	<tiles:insertAttribute name="body" />
	<!-- /Body -->
	
	<!-- Footer -->
	<footer id="footer" class = "footer">
		<div class="container">
			<div class="row" style="padding: 5px;">
				<div class="col-md-3">
					<p class="footer-text">Connecting with us</p>
					<div class="famous-brand">
						<a href = "#" class = "	fa fa-google-plus famous-brand-color"></a>
						<a href="#" class="fa fa-facebook-square famous-brand-color"></a>
						<a href="#" class="fa fa-twitter-square famous-brand-color"></a> <a
							href="https://github.com/TranToQuePhuong/HCMIU_WEBProject_Bookshop.git"
							class="fa fa-github-alt famous-brand-color"></a>
					</div>
				</div>
				<div class="col-md-3">
					<div>
						<p class="footer-text">Co-operate</p>
						<a href="/home/faq" class = "white-link">Selling with Bukkie</a>
					</div>
					<div>
						<p class="footer-text">Supporting client</p>
						<div>
							<p>
								<a href="#" class = "white-link">Hotline: 1900-3456</a>
							<p>
								<a href="/home/faq" class = "white-link">Guide for buying books</a>
							<p>
								<a href="/home/faq" class = "white-link" >Return policy</a>
							<p>
								<a href="/home/faq" class = "white-link">Import goods policy</a>
						</div>

					</div>
	
				</div>
				<div class = "col-md-3">
					<p class="footer-text">Payment method</p>
					<div class="famous-brand">
						<p>
						<span class="fa fa-cc-visa famous-brand-color"></span>
						<span class="fa fa-cc-jcb famous-brand-color"></span> 
						<span class="fa fa-cc-mastercard famous-brand-color"></span>
						</p>
						<p>
						<span class="fa fa-credit-card famous-brand-color"></span>
						<span class="fa fa-google-wallet famous-brand-color"></span> 
						<span class="fa fa-paypal famous-brand-color"></span>
						</p>
					</div>
				
				</div>
				<div class="col-md-3">
					<p class="text-center">&copy;2020. All rights reserved</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- /Footer -->

	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass(".toggled");
		});
	</script>

</body>
</html>