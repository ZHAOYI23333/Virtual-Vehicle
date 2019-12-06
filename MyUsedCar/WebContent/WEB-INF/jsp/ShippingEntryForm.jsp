<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Shipment</title>
	</head>

	<%@ include file="header.jsp" %>
	
	<body>
		<h2 id='subtitle'>Please Enter Your Shipping Information</h2>
		
		<div class="row">
		  	<div class="col-md-6 col-md-offset-3" >
			  	<form:form modelAttribute="shipping" method="post" action="submitShipping"> 
			 
					<div class="form-group"> 
						<label>Name</label>
						<form:input path="name" class="form-control" />
						<small class="form-text text-muted">We'll never share your information with anyone else.</small>
					</div>
					
					<div class="form-group">
						<label>Address</label>
						<form:input path="addressLine1" class="form-control" />
						<small  class="form-text text-muted">We'll never share your information with anyone else.</small> 
					</div>
					
					<div class="form-group">
						<label>Address (second)</label>
						<form:input path="addressLine2" class="form-control" />
						<small class="form-text text-muted">We'll never share your information with anyone else.</small> 
					</div>
					
					<div class="form-group">
						<label>City</label>
						<form:input path="city" class="form-control" />
						<small  class="form-text text-muted">We'll never share your information with anyone else.</small> 
					</div>
					
					<div class="form-group">
						<label>State</label>
						<form:input path="state" class="form-control" />
						<small  class="form-text text-muted">We'll never share your information with anyone else.</small> 
					</div>
					
					<div class="form-group">
						<label>Country</label>
						<form:input path="country" class="form-control" />
						<small  class="form-text text-muted">We'll never share your information with anyone else.</small> 
					</div>
					
					<div class="form-group">
						<label>Postal Code</label>
						<form:input path="zip" class="form-control" />
						<small  class="form-text text-muted">We'll never share your information with anyone else.</small> 
					</div>
					
					<div class="form-group">
						<label>Email</label>
						<form:input path="email" class="form-control" />
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