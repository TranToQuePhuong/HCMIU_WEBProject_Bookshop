<%@ page pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!--first slide-->

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
		<ol class="carousel-indicators">
		   	<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
			<li data-target="#myCarousel" data-slide-to="5"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
		    	<img src="/static/theme/theme-2.jpg" class = "blur-img" alt="First">
		    	<div class="carousel-caption">
			    	<h3 class = "large-text font-roboto">Welcome to Bukkie store</h3>
			    	<p class= "small-text">We are DPQ team!</p>
			    	<a href = "#shop"><button type="button" class="btn btn-outline-dark">Shop now</button></a>
		    	</div>
			</div>
			<div class="item">
				<img src="/static/theme/theme-1.jpg" alt="Second">
				<div class="carousel-caption border-background">
					<h4 class="large-text font-roboto">
						<a href="/product/list-by-special/0" style="color:white">NEW ARRIVALS</a>
					</h4>
				</div>
		
			</div>
			<div class="item">
				<img src="/static/theme/theme-3.jpg" alt="Third">
				<div class="carousel-caption border-background">
					<h5 class="large-text font-roboto">
						<a href="/product/list-by-special/3" style="color: white">Sale</a>
					</h5>
					<p class="small-text">Up to 50%</p>
				</div>
		
			</div>
			<div class="item">
				<img src="/static/theme/theme-4.jpg" alt="Fourth">
				<div class="carousel-caption border-background">
					<h5 class="large-text font-roboto">
						<a href="/product/list-by-special/1" style="color: white">Best sellers</a>						</h5>
					</div>
				</div>
			<div class="item">
				<img src="/static/theme/theme-5.jpg" alt="Fifth">
				<div class="carousel-caption border-background">
					<h5 class="large-text font-roboto">
						<a href="/product/list-by-special/1" style="color: white">Most viewed</a>
					</h5>
				</div>
			</div>
		</div>

  <!-- Left and right controls -->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
	  <span class="glyphicon glyphicon-chevron-left"></span>
	  <span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" data-slide="next">
	  <span class="glyphicon glyphicon-chevron-right"></span>
	  <span class="sr-only">Next</span>
	</a>
</div>
<!--/first slide-->

<!--second slide-->
<div class = "well well-small">
	<h3>Featured Products</h3>
	<div id = "shop" class="product-slider">
		<div class="clearfix">
			<div id="thumbcarousel" class="carousel slide" data-interval="false">
				<div class="carousel-inner">
	        		<div class="item active">
			          <div data-target="#carousel" data-slide-to="0" class="thumb"><img src="/static/products/HP_1.jpg"></div>
			          <div data-target="#carousel" data-slide-to="1" class="thumb"><img src="/static/products/HP_2.jpg"></div>
			          <div data-target="#carousel" data-slide-to="2" class="thumb"><img src="/static/products/HP_3.jpg"></div>
			          <div data-target="#carousel" data-slide-to="3" class="thumb"><img src="/static/products/HP_4.jpg"></div>
			         </div>
			        <div class="item">
			        	<div data-target="#carousel" data-slide-to="2" class="thumb"><img src="/static/products/HP_5.jpg"></div>
			        	<div data-target="#carousel" data-slide-to="3" class="thumb"><img src="/static/products/HP_6.jpg"></div>
			        	<div data-target="#carousel" data-slide-to="3" class="thumb"><img src="/static/products/HP_7.jpg"></div>
			        </div>
				</div>
			      <!-- /carousel-inner -->
					<a class="left carousel-control" href="#thumbcarousel" data-slide="prev"> 
						<span class="glyphicon glyphicon-chevron-left"></span> 
						<span class="sr-only">Previous</span>
					</a> 
					<a class="right carousel-control" href="#thumbcarousel" data-slide="next"> 
						<span class="glyphicon glyphicon-chevron-right"></span> 
						<span class="sr-only">Next</span>
					</a>
						<!-- /thumbcarousel --> 
	    
	  		</div>
		</div>
	</div>
</div>
<!--/second slide-->
