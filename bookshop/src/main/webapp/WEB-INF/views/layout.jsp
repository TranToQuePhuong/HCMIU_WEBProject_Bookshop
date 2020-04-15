<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Bootstrap Example</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="/static/css/bookshop.css" rel="stylesheet"/>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="/static/js/bookshop.js"></script>
	
	
</head>
<body>

	<div class="container">
		<header class="row">
			<h1 class="alert alert-success">Bookshop</h1>
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