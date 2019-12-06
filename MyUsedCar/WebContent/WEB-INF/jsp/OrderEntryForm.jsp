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
				<% if (index ==0)  { %>
				<img src="https://s3.amazonaws.com/toyota-cms-media/wp-content/uploads/2019/04/2017_Toyota_Highlander_Hybrid_Limited_Platinum_014_37143B75A8EB936371E2C4AB10DFAC51875323BE_7BA6E5B499632E3F2A4A50B574163BEC0B5F4EF9.jpg" alt="Smiley face" width="800" height="480">
				<% } else if (index == 1) {%>
				<img src="https://drivetribe.imgix.net/bpIXGaMOQDqARSM8nxPnCg" alt="Smiley face" width="800" height="480">
				<% } else if (index == 2) {%>
				<img src="https://www.motortrend.com/uploads/sites/5/2019/07/2018-Honda-Accord-Sport-2.0T-front-three-quarter-motion.jpg?fit=around%7C875:492" alt="Smiley face" width="800" height="480">
				<% } else {%>
				<img src="https://content.autotrader.com/content/dam/autotrader/articles/Cars/Tesla/ModelX/2019/2019TeslaModelX/2019-Tesla-Model-X-(5).jpg" alt="Smiley face" width="800" height="480">
				<%} %>
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

