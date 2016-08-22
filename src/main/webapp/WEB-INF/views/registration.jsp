<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>registration</title>
<link href="<c:url value="/resources/css/register.css" />"
	rel="stylesheet">
</head>
<body style="padding-top: 75px">
	<div class="container-fluid">
		<section class="container">
		<div class="container-page">
			<div class="col-md-6">
				<c:url var="addAction" value="adduser"></c:url>
				<form:form action="${addAction}" commandName="userDetails"
					method="post">
					<h1 class="dark-grey">Registration</h1>
					<div class="form-group col-lg-12">
						<form:input path="name" type="text" placeholder="Name"
							required="true" id="username" name="username" pattern = ".{5,10}" title ="minimum name length is 5" />
					</div>
					<div class="form-group col-lg-6">
						<form:input path="userName" type="text" placeholder="Username"
							required="true" id="username" name="username" pattern = ".{5,10}" title ="minimum name length is 5"/>
					</div>
					<div class="form-group col-lg-6">
						<form:input path="password" type="password" placeholder="Password"
							required="true" id="password" name="password"pattern = ".{5,10}" title ="minimum name length is 5" />
					</div>
					<div class="form-group col-lg-6">
						<form:input path="email" type="email" placeholder="Email"
							required="true" id="username" name="username" pattern = ".{5,10}" title ="minimum name length is 5"/>
					</div>
					<div class="form-group col-lg-6">
						<form:input path="mobile" type="text" placeholder="Mobile"
							required="true" id="username" name="username" pattern = "^[789]\d{9}$" title ="enter valid mobile number"/>
					</div>
					<div class="col-sm-6">
						<input type="checkbox" class="checkbox" />I Agree Terms and Conditions
						
					</div>

					
					<div>
						<input class="btn btn-primary" type="submit" value="Register" />
						<a></a><span></span> <a href="login">Sign In</a>
					</div>
				<!--  	<div class="col-md-6">
						<h3 class="dark-grey">Terms and Conditions</h3>
						<p>By clicking on "Register" you agree to The Company's' Terms
							and Conditions</p>
						<p>While rare, prices are subject to change based on exchange
							rate fluctuations - should such a fluctuation happen, we may
							request an additional payment. You have the option to request a
							full refund or to pay the new price. (Paragraph 13.5.8)</p>
						<p>Should there be an error in the description or pricing of a
							product, we will provide you with a full refund (Paragraph
							13.5.6)</p>
						<p>Acceptance of an order by us is dependent on our suppliers
							ability to provide the product. (Paragraph 13.5.6)</p>


					</div> -->
			</div>
		</section>
	</div>
	</form:form>
	<!-- form -->
	</section>
	<!-- content -->
	</div>
	<!-- container -->
</body>
</html>