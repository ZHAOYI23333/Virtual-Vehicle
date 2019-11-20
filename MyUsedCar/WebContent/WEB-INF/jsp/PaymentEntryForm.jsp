<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
    <%@include file="bootstrap/css/bootstrap.css" %>
    <%@include file="bootstrap/css/bootstrap-grid.css" %>
    <%@include file="bootstrap/css/bootstrap-grid.min.css" %>
    <%@include file="bootstrap/css/bootstrap-reboot.css" %>
    <%@include file="bootstrap/css/bootstrap-reboot.min.css" %>
    <%@include file="bootstrap/css/bootstrap.min.css" %>
</style>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="bootstrap/js/bootstrap.bundle.js"></script>
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>


<title>Payment Entry</title>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="#">Logo</a>
 
  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="#">Link 1</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Link 2</a>
    </li>
 
    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Dropdown link
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Link 1</a>
        <a class="dropdown-item" href="#">Link 2</a>
        <a class="dropdown-item" href="#">Link 3</a>
      </div>
    </li>
  </ul>
</nav>




<form:form modelAttribute="paymentInfo" method="post" action="submitPayment">    
	<table>
			 
			<tr><td>Card Holder: <form:input path="holder_name" /></td></tr> 
			<tr><td>Payment Card Number: <form:input path="card_number" /></td></tr> 
			<tr><td>Expire Date: <form:input path="expiration_date" /></td></tr> 
			<tr><td>CVV: <form:input path="cvvCode" /></td></tr> 

		<tr>
			<td colspan="2"><input type="submit" value="Comfirm Card"></td>  
		</tr>    
	</table>
</form:form>

</body>
</html>