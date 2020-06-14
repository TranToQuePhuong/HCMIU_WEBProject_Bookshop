<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


<h2 class="alert alert-warning">CUSTOMER MANAGER</h2>

<!-- Đặt c:set ở đây với scope=request thì đc dùng cho cả Form lẫn Table -->
<c:set var="base" value="/admin/customer" scope="request"/>

<!-- Thông báo để chung cho cả Form và Table -->
<h4 class="label label-success">${message}${param.message}</h4>

<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#tab1">Edit</a></li>
  <li><a data-toggle="tab" href="#tab2">List</a></li>
</ul>

<div class="tab-content">
  <div id="tab1" class="tab-pane fade in active">
  <!-- Click vào Edit trong List thì tự động chuyển sang tab Edit -->
  <!-- Solu1: Set edit ở tab1 (tab có class active) -->
  <!-- Solu2: Không cần để edit ở tab active nhưng vẫn chuyển từ List sang được, thì phải code (tính sau) -->
 	<jsp:include page="_form.jsp"></jsp:include>
  </div>
  <div id="tab2" class="tab-pane fade">
   <jsp:include page="_table.jsp"></jsp:include>
  </div>
</div>