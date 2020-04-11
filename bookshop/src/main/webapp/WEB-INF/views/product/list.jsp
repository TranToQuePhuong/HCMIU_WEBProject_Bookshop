<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:forEach var="p" items="${list}"> 
	<div class="col-sm-4">
		<div class="thumbnail">
      		<a href="/w3images/lights.jpg">
        		<img src="/static/human_body.jpg" style="width:100%">
        		<div class="caption">
          			<p>${p.name}</p>
          			<p>${p.unitPrice}</p>
         		</div>
      		</a>
		</div>
	
</c:forEach>
