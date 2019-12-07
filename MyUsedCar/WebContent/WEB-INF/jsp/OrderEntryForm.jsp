<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order</title>
</head>

<%@ include file="header.jsp" %>

<body>
	
	<h2 id='subtitle'>Please Enter Your Order Information</h2>
		
	<% Order order = (Order) request.getAttribute("order"); int index = 0; %>
	
	<div class="row">
	  <div class="col-md-6 col-md-offset-3" >
		<form:form modelAttribute="order" method="post" action="purchase/submitItems">  
		 
			<c:forEach items="${order.items}" var="item" varStatus="loop">
			
				<form:input type="hidden" path="items[${loop.index}].itemName" readonly="true" cssClass='form-control' />
				<form:input type="hidden" path="items[${loop.index}].price" readonly="true" cssClass ='form-control' />
				<div class="form-group">
					<label for="quantity"> <%= "Name: " + order.getItems().get(index).getItemName() %>&nbsp;&nbsp;&nbsp; 
					<%= "Price: $" + order.getItems().get(index).getPrice() %></label>
					<% index++; %>
				
					<form:input path="items[${loop.index}].quantity" cssClass = 'form-control' id='quantity'/>
				</div>
				
			</c:forEach>
			
			<div class="col-md-6 col-md-offset-4" >
				<button type="submit" value="Purchase" Class='btn btn-primary'>Add To Cart</button>
			</div>
		</form:form>
		
	  </div>
	</div>


</body>
</html>

