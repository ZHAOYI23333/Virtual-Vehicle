<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Payment</title>
	</head>

	<%@ include file="header.jsp" %>

	<body>

		<h2 id='subtitle'>Please Enter Your Payment Information</h2>
		
		<div class="row">
		  	<div class="col-md-6 col-md-offset-3" >
			  	<form:form modelAttribute="paymentInfo" method="post" action="submitPayment"> 
			 
					<div class="form-group"> 
						<label>Card Holder</label>
						<form:input path="holder_name" class="form-control" />
						<small class="form-text text-muted">We'll never share your information with anyone else.</small>
					</div>
					
					<div class="form-group">
						<label>Payment Card</label>
						<form:input path="card_number" class="form-control" />
						<small  class="form-text text-muted">We'll never share your information with anyone else.</small> 
					</div>
					
					<div class="form-group">
						<label>Expire Date</label>
						<form:input path="expiration_date" class="form-control" />
						<small class="form-text text-muted">We'll never share your information with anyone else.</small> 
					</div>
					
					<div class="form-group">
						<label>CVV</label>
						<form:input path="cvvCode" class="form-control" />
						<small  class="form-text text-muted">We'll never share your information with anyone else.</small> 
					</div>
					
					<div class="col-md-6 col-md-offset-4" >
						<button type="submit" value="Comfirm Card" Class='btn btn-primary'>Comfirm Payment</button>
					</div>	
					  
				</form:form>
		  </div>
		</div>
	
	</body>
</html>