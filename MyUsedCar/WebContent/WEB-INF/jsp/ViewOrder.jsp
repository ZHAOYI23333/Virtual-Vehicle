<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Order</title>
</head>
<body>


<%-- 

	<table>Order Details
		<c:forEach items="${order.items}" var="item" varStatus="loop">
			 <tr>
				<td>Name: <c:out value="${item.itemName}"></c:out></td>
				<td>Price: <c:out value="$${item.price}"></c:out></td>
				<td>Quantity: <c:out value="${item.quantity}"></c:out></td>
			</tr> 
		</c:forEach>  
	</table>


<br/>

<form:form modelAttribute="payment">
	<table>Payment Information
		<tr><td>Card Holder: <c:out value="${payment.holder_name}" ></c:out></td></tr> 
		<tr><td>Payment Card Number: <c:out value="${payment.card_number}" ></c:out></td></tr> 
		<tr><td>Expire Date: <c:out value="${payment.expiration_date}" ></c:out></td></tr> 
		<tr><td>CVV: <c:out value="${payment.cvvCode}" ></c:out></td></tr>    
	</table>
</form:form>

<br/>

<form:form modelAttribute="shipping">    
	<table>Shipping Information
			<tr><td>Name: <c:out value = "${shipping.name}" ></c:out></td></tr>
			<tr><td>Address: <c:out value="${shipping.addressLine1}" ></c:out></td></tr>
			<tr><td>Address Line2: <c:out value="${shipping.addressLine2}" ></c:out></td></tr>
			<tr><td>State: <c:out value="${shipping.city}" ></c:out></td></tr>
			<tr><td>City: <c:out value="${shipping.state}" ></c:out></td></tr>
			<tr><td>Zip Code: <c:out value="${shipping.zip}" ></c:out></td></tr> 
	</table>
</form:form> --%>

<br/>

<form:form  method="post" action="comfirmOrder">    
	<table>
		
		<tr>
			<td colspan="2"><input type="submit" value="Place Order"></td>  
		</tr>    
	</table>
</form:form>

</body>
</html>
