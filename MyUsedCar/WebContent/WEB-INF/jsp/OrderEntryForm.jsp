<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Entry</title>
</head>
<%@ include file="header.jsp" %>

<body>
<h3 id='subtitle'>Hey please enter your order information below<h3/>

<div class="row">
  <div class="col-md-6 col-md-offset-3" >
	<form:form modelAttribute="order" method="post" action="purchase/submitItems">    
		<table>
			<c:forEach items="${order.items}" var="item" varStatus="loop">
				<div class="field">
					<form:input path="items[${loop.index}].itemName" readonly="true" cssClass='form-control' />
				</div>
				<div class="field">
				 	<form:input path="items[${loop.index}].price" readonly="true" cssClass ='form-control' />
				</div>
				<div class="field">
					<form:input path="items[${loop.index}].quantity" cssClass = 'form-control' />
				 </div>	
				
			</c:forEach> 
				<div class="field">
					<input type="submit" value="Purchase" cssClass='btn btn-primary'>
				</div>    
		</table>
	</form:form>

  </div>
</div>

<h2></h2>


</body>
</html>

