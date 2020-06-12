<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<div class="container" style="padding: 30px">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-sm-5 text-center">
						<img class="detail-img" src="/static/products/${prod.image}"> 
					</div>
					<div class="col-sm-7">
						<ul class="detail-info">
							<li>Name: ${prod.name}</li>
							<li>Price: <f:formatNumber value="${prod.unitPrice}" pattern="###,###"/> </li>
							<li>Product Date: <f:formatDate value="${prod.productDate}" pattern="dd-MM-yyyy"/> </li>
							<li>Quantity: ${prod.quantity}</li>
							<li>Discount: <f:formatNumber value="${prod.discount}" type="percent"/></li>
							<li>Total View: ${prod.viewCount}</li>
							<li>Available: ${prod.available?'Yes':'No'}</li>
							<li>Special: ${prod.special?'Yes':'No'}</li>
						</ul>
					</div>
				
				</div>
				
				<div class="text-justify">${prod.description}</div>
				
				<ul class="nav nav-tabs " style="display: inline-block;">
				  <li class="active"><a data-toggle="tab" href="#tab1">Similar Items</a></li>
				  <li><a data-toggle="tab" href="#tab2">Favorite Items</a></li>
				  <li><a data-toggle="tab" href="#tab3">Viewed Items</a></li>
				</ul>
				
				<div class="tab-content">
				  <div id="tab1" class="tab-pane fade in active">
				    <div>
				    	<c:forEach var="p" items="${list}">
						<a href="/product/detail/${p.id}">
						<img class="thumb-img" src="/static/products/${p.image}"> 
						</a>
						</c:forEach>
				    </div>
				  </div>
				  <div id="tab2" class="tab-pane fade">
				    <div>
				    	<c:forEach var="p" items="${favo}">
						<a href="/product/detail/${p.id}">
						<img class="thumb-img" src="/static/products/${p.image}"> 
						</a>
						</c:forEach>
				    </div>
				  </div>
				  <div id="tab3" class="tab-pane fade">
				    <div>
				    	<c:forEach var="p" items="${viewed}">
						<a href="/product/detail/${p.id}">
						<img class="thumb-img" src="/static/products/${p.image}"> 
						</a>
						</c:forEach>
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
