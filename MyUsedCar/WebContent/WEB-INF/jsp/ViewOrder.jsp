<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Order</title>
</head>
<%@ include file="header.jsp" %>

<body>

<div class="row">

	<h2 id='subtitle'>Please Confirm Your Order</h2>
	
	<% Order order = (Order) request.getSession().getAttribute("order"); %>
	<% PaymentInfo payment = (PaymentInfo) request.getSession().getAttribute("paymentInfo"); %>
	<% ShippingInfo ship = (ShippingInfo) request.getSession().getAttribute("shipping"); %>
	
	
	<div class="col-sm-6 col-sm-offset-3"> 
		
	
		<h4 id='subtitle'><strong>Order Details</strong></h4>
		<% for (int i = 0; i < order.getItems().size(); i++) { %>
			<% if (order.getItems().get(i).getQuantity() == 0) continue; %>
			
			<div class="col-sm-12 col-sm-offset-3">
				<dl class="dl-horizontal">
					<dt>Item Name:<span></span></dt>
					<dd><%= order.getItems().get(i).getItemName() %></dd>
					<dt>Unit Price:<span></span></dt>
					<dd><%= order.getItems().get(i).getPrice() %></dd>
					<dt>Quantity:<span></span></dt>
					<dd><%= order.getItems().get(i).getQuantity() %></dd>
				</dl>
			</div>
			
		<% } %>
		
		<h4 id='subtitle'><strong>Payment</strong></h4>
		<div class="col-sm-12 col-sm-offset-3">
			<dl class="dl-horizontal">
				<dt>Card Holder:<span></span></dt>
				<dd><%= payment.getHolder_name() %></dd>
				<dt>Payment Card:<span></span></dt>
				<dd><%= payment.getCard_number() %></dd>
				<dt>Expire Date:<span></span></dt>
				<dd><%= payment.getExpiration_date() %></dd>
			</dl>
		</div>
		
		<h4 id='subtitle'><strong>Shipment</strong></h4>
		<div class="col-sm-12 col-sm-offset-3">
			<dl class="dl-horizontal">
				<dt>Name :<span></span></dt>
				<dd><%= ship.getName() %></dd>
				<dt>Address:<span></span></dt>
				<dd><%= ship.getAddressLine1() %></dd>
				<dt>Second Address:<span></span></dt>
				<dd><%= ship.getAddressLine2() %></dd>
				<dt>City :<span></span></dt>
				<dd><%= ship.getCity() %></dd>
				<dt>State :<span></span></dt>
				<dd><%= ship.getState() %></dd>
				<dt>Country :<span></span></dt>
				<dd><%= ship.getCountry() %></dd>
				<dt>Postal Code :<span></span></dt>
				<dd><%= ship.getZip() %></dd>
				<dt>Email :<span></span></dt>
				<dd><%= ship.getEmail() %></dd>
			</dl>
		</div>
	
	</div>

</div>


<form:form  method="post" action="comfirmOrder">   
	<div class="col-md-6 col-md-offset-5" >
				<button type="submit" value="Place Order" Class='btn btn-primary'>Place Order</button>
	</div> 
	
</form:form>

</body>
</html>
