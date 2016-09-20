<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html>
<head>


<title>SPICYHUB</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="Scripts/jquery-1.10.2.js"></script>
<script src="Scripts/jquery.validate.js"></script>
<script src="Scripts/modernizr-2.6.2.js"></script>
<script src="Scripts/bootstrap.js"></script>
<script src="Scripts/respond.js"></script>
<link href="Content/bootstrap.css" rel="stylesheet" />
<link href="Content/Site.css" rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
<!-- 
  ######################################################## STYLE ########################################################
 -->
<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
	height: 400;
}
</style>
<style>
ul.pagination {
	display: inline-block;
	padding: 0;
	margin: 0;
}

ul.pagination li {
	display: inline;
}

ul.pagination li a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
}

ul.pagination li a.active {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

ul.pagination li a:hover:not (.active ) {
	background-color: #ddd;
}

div.center {
	text-align: center;
}
</style>


<!-- ##########################################################################################################################
 -->

</head>
<body>
	<!-- 
######################################################### HEADER ##########################################################
 -->
	<!-- <nav class="navbar navbar" style="background-color: #666666"> -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">S P I C Y  H U B</a>
			</div>
			<!--  <ul class="nav navbar-nav">
					<li class="active"><a href=""><span
							class="glyphicon glyphicon-home"></span>Home</a></li>-->

			<!--  	<div class="col-lg-6">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for..."> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">Go!</button>
							</span>
						</div>
					</div> -->

			<c:choose>
				<c:when test="${LoggedIn}">

					<ul class="nav navbar-nav navbar-right">
						<c:choose>
							<c:when test="${!Administrator}">
								<li class=""><a href="viewcart" class="w3-hover-none"><span
										class="glyphicon glyphicon-shopping-cart">(${cartsize})</span></a></li>
							</c:when>
						</c:choose>

						<li class=""><a href="#" class="w3-hover-none"><span
								class="glyphicon glyphicon-user"></span> Hi, ${name}</a></li>

						<li class=""><a href="perform_logout"
							class="w3-hover-none"><span
								class="glyphicon glyphicon-log-out"></span></a></li>



					</ul>
				</c:when>
				<c:otherwise>
					<div class="collapse navbar-collapse" style="color: red">
						<ul class="nav navbar-nav navbar-right">

							<li class="active"><a href="registration"> <span
									class="glyphicon glyphicon-log-in"></span> Register
							</a></li>
							<li class="active"><a href="login"> <span
									class="glyphicon glyphicon-user"></span>Sign In
							</a></li>

						</ul>
					</div>
				</c:otherwise>
			</c:choose>
	</nav>
	<!-- 	</nav> -->


	<!-- ##############################################################################################################################				
 -->

	<c:choose>
		<c:when test="${!Administrator}">
			<!-- Category List -->
			<c:if test="${!empty categoryList}">
				<div class="panel panel-default">
					<div class="panel-body">

						<div class="center">
							<ul class="pagination">
								<c:forEach items="${categoryList}" var="category">
									<li><a href="${category.name}" class="w3-hover-none"><i
											class="fa fa-list-alt" aria-hidden="true"></i>
											${category.name}</a></li>
								</c:forEach>

							</ul>
						</div>
					</div>
				</div>
			</c:if>
		</c:when>

		<c:when test="${Administrator}">
			<div class="panel panel-default">
				<div class="panel-body">

					<div class="center">
						<ul class="pagination">

							<li><a href="product" class="w3-hover-none"><i
									class="glyphicon glyphicon-list" aria-hidden="true"></i>
									Products</a></li>
							<li><a href="category" class="w3-hover-none"><i
									class="glyphicon glyphicon-list" aria-hidden="true"></i>
									Category</a></li>
							<li><a href="supplier" class="w3-hover-none"><i
									class="glyphicon glyphicon-list" aria-hidden="true"></i>
									Supplier</a></li>
						</ul>
					</div>
		</c:when>
	</c:choose>
	<!-- category list end -->
	<c:choose>
		<c:when test="${IfViewCartClicked}">
			<c:import url="/WEB-INF/views/cart.jsp">
			</c:import>
		</c:when>
		<c:when test="${IndividualItemClicked}">
			<c:import url="/WEB-INF/views/IndividualItem.jsp">
			</c:import>
		</c:when>
		

		<c:when test="${IfPaymentClicked}">
			<c:import url="/WEB-INF/views/payment.jsp">
			</c:import>
		</c:when>
	</c:choose>
	


	<!-- Category List End -->
	<c:choose>
		<c:when test="${IfLoginClicked}">
			<c:import url="/WEB-INF/views/login.jsp">
			</c:import>
		</c:when>

		<c:when test="${IfRegisterClicked}">
			<c:import url="/WEB-INF/views/registration.jsp">
			</c:import>
		</c:when>
	</c:choose>
<c:choose>
		<c:when test="${ViewCategoryClicked}">
			<c:import url="/WEB-INF/views/viewitem.jsp">
			</c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${ProductPageClicked}">
			<c:import url="/WEB-INF/views/addproduct.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${CategoryPageClicked}">
			<c:import url="/WEB-INF/views/addcategory.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${SupplierPageClicked}">
			<c:import url="/WEB-INF/views/addsupplier.jsp"></c:import>
		</c:when>
	</c:choose>










	<!-- #########################################################################################################################
 
 -->
	<c:choose>
		<c:when test="${!Administrator}">
			<c:if test="${empty HideOthers}">
				<div style="background-color: #DEB887; color: orange; padding: 0px;">
					<div class="container">
						<br>
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
								<li data-target="#myCarousel" data-slide-to="3"></li>
								<li data-target="#myCarousel" data-slide-to="4"></li>
								<li data-target="#myCarousel" data-slide-to="5"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<img
										src="C:\Users\Sneha\Downloads\636020301417375882-goldbely-epic-food-subscription-700X400.jpg"
										alt="Chania" width="800" height="800">
								</div>

								<div class="item">
									<img src="C:\Users\Sneha\Downloads\Indian-Food.jpg"
										alt="Chania" width="800" height="800">
								</div>
								<div class="item">
									<img src="C:\Users\Sneha\Downloads\Desserts_zpst4qrqeqx.jpg"
										alt="Chania" width="800" height="800">
								</div>

								<div class="item">
									<img
										src="C:\Users\Sneha\Downloads\Kebab-Meat-Food-Wallpaper.jpg"
										alt="Flower" width="800" height="800">
								</div>
								<div class="item">
									<img src="C:\Users\Sneha\Downloads\IMG_0533.jpg" alt="Flower"
										width="800" height="800">
								</div>

								<div class="item">
									<img src="C:\Users\Sneha\Downloads\nasi_lemak_mamak_sydney.jpg"
										alt="Flower" width="800" height="800">
								</div>
							</div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel" role="button"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel"
								role="button" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>
			</c:if>
		</c:when>
	</c:choose>


	<br>
	<br>
	<br>
	<br>
	<!-- ################################################################################################## -->


	<!-- ##################################################################################################### -->


	<c:choose>
		<c:when test="${!Administrator}">
			<c:if test="${!empty productList}">
				<div>
					<ul>
						<!--<c:forEach items="${productList}" var="product">
								<li><a href=" ${product.name}" class="w3-hover-none"><img
										alt="${product.id}"
										src="<c:url value="/resources/Images/product/${product.id}.jpg"></c:url>"></a></li>
								<c:choose>
									<c:when test="${LoggedIn}">
										<li><form action="addtoCart/${userId}/${product.id}">
					<input type="number" value="1" name="quantity">
					<input type="submit" value="Add to Cart">
					</form></li>
									</c:when>
								</c:choose>
							</c:forEach> -->
						<c:forEach items="${productList}" var="product">
							<div class="col-xs-2 ">
								<div class="thumbnail">
									<img height="150px" width="150px" alt="${product.id}"
										src="<c:url value="/resources/images/product/${product.id}.jpg"></c:url>">
									<div class="caption">
										<p>${product.name}
									</div>
									<c:choose>
										<c:when test="${LoggedIn}">
											<li>
												<form action="addtoCart/${userId}/${product.id}">
													<input type="number" value="1" name="quantity"
														class="btn btn-xs btn-primary   col-xs-6 "> <input
														type="submit" value="Add to cart"
														class="btn btn-xs col-xs-6 btn-primary">
												</form>
											</li>

										</c:when>
									</c:choose>


								</div>
							</div>
						</c:forEach>
					</ul>
				</div>
			</c:if>
		</c:when>
	</c:choose>

	<!--############################################### Product List End ##############################################-->

	<!-- #################################################  FOOTER ###################################################-->



	<footer>
		 <!--  <div class="footer-left">
			<p>Payment Options</p>
			<a href="#"><i class="glyphicon glyphicon-paypal"
				aria-hidden="true"></i> </a> . <a href="#"><i
				class="glyphicon glyphicon-cc-amex" aria-hidden="true"></i> </a> . <a
				href="#"><i class="glyphicon glyphicon-cc-mastercard"
				aria-hidden="true"></i> </a> . <a href="#"><i
				class="glyphicon glyphicon-cc-visa" aria-hidden="true"></i> </a> . <a
				href="#"><i class="glyphicon glyphicon-credit-card"
				aria-hidden="true"></i> </a> . <a href="#"><i
				class="fa fa-google-wallet" aria-hidden="true"></i> </a> . <a href="#"><i
				class="fa fa-cc-stripe" aria-hidden="true"></i> </a>
			<p></p>
			<p></p>

			<p></p> -->
			<section id="conatcat-info">
				<div class="container">
					<div class="row">
						<div class="col-sm-8">
							<div class="media contact-info wow fadeInDown"
								data-wow-duration="1000ms" data-wow-delay="600ms">
								<div class="pull-left">
									<!--  	<i class="fa fa-phone"></i> -->
								</div>

							</div>
						</div>
					</div>
				</div>
				<!--/.container-->
			</section>
			<!--/#conatcat-info-->
			<section id="bottom">
				<div class="container wow fadeInDown" data-wow-duration="1000ms"
					data-wow-delay="600ms">
					<div class="row">
						<div class="col-md-3 col-sm-6">
							<div class="widget">
								<h3>At your reach</h3>
								<ul>
									<li><a href="#">About us</a></li>
								
									<li><a href="#">Contact us</a></li>
								</ul>
							</div>
						</div>
						<!--/.col-md-3-->

						<div class="col-md-3 col-sm-6">
							<div class="widget">
								<h3>At Your service</h3>
								<ul> <li><a href="#">Home Delivery</a></li>
									<li><a href="#">customer service</a></li>
									<li><a href="#">Blog</a></li>
									
								

								</ul>
							</div>
						</div>
						<!--/.col-md-3-->


						<!--/.col-md-3-->

						<div class="col-md-3 col-sm-6">
							<div class="widget">
								<h3>Our Partners</h3>
								<ul>
									<li><a href="#">Chef Basket</a></li>
									<li><a href="#">Paradise</a></li>
									<li><a href="#">Socials</a></li>

								</ul>
							</div>
						</div>
						<!--/.col-md-3-->
					</div>
				</div>
			</section>
			<!--/#bottom-->
			<div class="container">
				<div class="row">

					<div class="text-center">
						<h6></h6>
						<!-- just add href= for your links, like this: -->
						<a class="btn btn-social-icon btn-vk"><i class="fa fa-vk"></i></a>
						<a class="btn btn-social-icon btn-instagram"><i
							class="fa fa-instagram"></i></a> <a href="http://facebook.com"
							class="btn btn-social-icon btn-facebook"><i
							class="fa fa-facebook"></i></a> <a href="http://youtube.com"
							class="btn btn-social-icon btn-youtube"><i
							class="fa fa-youtube"></i></a> <a
							class="btn btn-social-icon btn-bitbucket"><i
							class="fa fa-bitbucket"></i></a> <a
							class="btn btn-social-icon btn-dropbox"><i
							class="fa fa-dropbox"></i></a> <a
							class="btn btn-social-icon btn-flickr"><i
							class="fa fa-flickr"></i></a> <a
							class="btn btn-social-icon btn-foursquare"><i
							class="fa fa-foursquare"></i></a> <a
							class="btn btn-social-icon btn-google-plus"><i
							class="fa fa-google-plus"></i></a> <a
							class="btn btn-social-icon btn-linkedin"><i
							class="fa fa-linkedin"></i></a> <a
							class="btn btn-social-icon btn-tumblr"><i
							class="fa fa-tumblr"></i></a> <a
							class="btn btn-social-icon btn-twitter"><i
							class="fa fa-twitter"></i></a>


					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- chat code starts-->
	<script type='text/javascript'>
		var fc_CSS = document.createElement('link');
		fc_CSS.setAttribute('rel', 'stylesheet');
		var isSecured = (window.location && window.location.protocol == 'https:');
		var lang = document.getElementsByTagName('html')[0]
				.getAttribute('lang');
		var rtlLanguages = [ 'ar', 'he' ];
		var rtlSuffix = (rtlLanguages.indexOf(lang) >= 0) ? '-rtl' : '';
		fc_CSS.setAttribute('type', 'text/css');
		fc_CSS.setAttribute('href',
				((isSecured) ? 'https://d36mpcpuzc4ztk.cloudfront.net'
						: 'http://assets1.chat.freshdesk.com')
						+ '/css/visitor' + rtlSuffix + '.css');
		document.getElementsByTagName('head')[0].appendChild(fc_CSS);
		var fc_JS = document.createElement('script');
		fc_JS.type = 'text/javascript';
		fc_JS.src = ((isSecured) ? 'https://d36mpcpuzc4ztk.cloudfront.net'
				: 'http://assets.chat.freshdesk.com')
				+ '/js/visitor.js';
		(document.body ? document.body
				: document.getElementsByTagName('head')[0]).appendChild(fc_JS);
		window.freshchat_setting = 'eyJ3aWRnZXRfc2l0ZV91cmwiOiJjYXJlZXIuZnJlc2hkZXNrLmNvbSIsInByb2R1Y3RfaWQiOm51bGwsIm5hbWUiOiJIdWIgSVQgTGltaXRlZCIsIndpZGdldF9leHRlcm5hbF9pZCI6bnVsbCwid2lkZ2V0X2lkIjoiNDQ3ZDU3YjgtNDM0YS00YjlmLTg3OWMtMTNmMjAwYmQ5ZTQxIiwic2hvd19vbl9wb3J0YWwiOnRydWUsInBvcnRhbF9sb2dpbl9yZXF1aXJlZCI6ZmFsc2UsImlkIjo0MDAwMDA2NTU2LCJtYWluX3dpZGdldCI6dHJ1ZSwiZmNfaWQiOiJmMGYyODkwNjYzNDJiNGVlYTQzN2ZlYTYwNGU2MzUyMSIsInNob3ciOjEsInJlcXVpcmVkIjoyLCJoZWxwZGVza25hbWUiOiJDYXJlZXIgTGF1bmNoZXIgSW5kaWEgTHRkIiwibmFtZV9sYWJlbCI6Ik5hbWUiLCJtYWlsX2xhYmVsIjoiRW1haWwiLCJtZXNzYWdlX2xhYmVsIjoiTWVzc2FnZSIsInBob25lX2xhYmVsIjoiUGhvbmUgTnVtYmVyIiwidGV4dGZpZWxkX2xhYmVsIjoiVGV4dGZpZWxkIiwiZHJvcGRvd25fbGFiZWwiOiJEcm9wZG93biIsIndlYnVybCI6ImNhcmVlci5mcmVzaGRlc2suY29tIiwibm9kZXVybCI6ImNoYXQuZnJlc2hkZXNrLmNvbSIsImRlYnVnIjoxLCJtZSI6Ik1lIiwiZXhwaXJ5IjowLCJlbnZpcm9ubWVudCI6InByb2R1Y3Rpb24iLCJkZWZhdWx0X3dpbmRvd19vZmZzZXQiOjMwLCJkZWZhdWx0X21heGltaXplZF90aXRsZSI6IkNoYXQgaW4gcHJvZ3Jlc3MiLCJkZWZhdWx0X21pbmltaXplZF90aXRsZSI6IkxldCdzIHRhbGshIiwiZGVmYXVsdF90ZXh0X3BsYWNlIjoiWW91ciBNZXNzYWdlIiwiZGVmYXVsdF9jb25uZWN0aW5nX21zZyI6IldhaXRpbmcgZm9yIGFuIGFnZW50IiwiZGVmYXVsdF93ZWxjb21lX21lc3NhZ2UiOiJIaSEgSG93IGNhbiB3ZSBoZWxwIHlvdSB0b2RheT8iLCJkZWZhdWx0X3dhaXRfbWVzc2FnZSI6Ik9uZSBvZiB1cyB3aWxsIGJlIHdpdGggeW91IHJpZ2h0IGF3YXksIHBsZWFzZSB3YWl0LiIsImRlZmF1bHRfYWdlbnRfam9pbmVkX21zZyI6Int7YWdlbnRfbmFtZX19IGhhcyBqb2luZWQgdGhlIGNoYXQiLCJkZWZhdWx0X2FnZW50X2xlZnRfbXNnIjoie3thZ2VudF9uYW1lfX0gaGFzIGxlZnQgdGhlIGNoYXQiLCJkZWZhdWx0X2FnZW50X3RyYW5zZmVyX21zZ190b192aXNpdG9yIjoiWW91ciBjaGF0IGhhcyBiZWVuIHRyYW5zZmVycmVkIHRvIHt7YWdlbnRfbmFtZX19IiwiZGVmYXVsdF90aGFua19tZXNzYWdlIjoiVGhhbmsgeW91IGZvciBjaGF0dGluZyB3aXRoIHVzLiBJZiB5b3UgaGF2ZSBhZGRpdGlvbmFsIHF1ZXN0aW9ucywgZmVlbCBmcmVlIHRvIHBpbmcgdXMhIiwiZGVmYXVsdF9ub25fYXZhaWxhYmlsaXR5X21lc3NhZ2UiOiJPdXIgYWdlbnRzIGFyZSB1bmF2YWlsYWJsZSByaWdodCBub3cuIFNvcnJ5IGFib3V0IHRoYXQsIGJ1dCBwbGVhc2UgbGVhdmUgdXMgYSBtZXNzYWdlIGFuZCB3ZSdsbCBnZXQgcmlnaHQgYmFjay4iLCJkZWZhdWx0X3ByZWNoYXRfbWVzc2FnZSI6IldlIGNhbid0IHdhaXQgdG8gdGFsayB0byB5b3UuIEJ1dCBmaXJzdCwgcGxlYXNlIHRlbGwgdXMgYSBiaXQgYWJvdXQgeW91cnNlbGYuIiwiYWdlbnRfdHJhbnNmZXJlZF9tc2ciOiJZb3VyIGNoYXQgaGFzIGJlZW4gdHJhbnNmZXJyZWQgdG8ge3thZ2VudF9uYW1lfX0iLCJhZ2VudF9yZW9wZW5fY2hhdF9tc2ciOiJ7e2FnZW50X25hbWV9fSByZW9wZW5lZCB0aGUgY2hhdCIsInZpc2l0b3Jfc2lkZV9pbmFjdGl2ZV9tc2ciOiJUaGlzIGNoYXQgaGFzIGJlZW4gaW5hY3RpdmUgZm9yIHRoZSBwYXN0IDIwIG1pbnV0ZXMuIiwiYWdlbnRfZGlzY29ubmVjdF9tc2ciOiJ7e2FnZW50X25hbWV9fSBoYXMgYmVlbiBkaXNjb25uZWN0ZWQiLCJzaXRlX2lkIjoiZjBmMjg5MDY2MzQyYjRlZWE0MzdmZWE2MDRlNjM1MjEiLCJhY3RpdmUiOmZhbHNlLCJ3aWRnZXRfcHJlZmVyZW5jZXMiOnsid2luZG93X2NvbG9yIjoiIzc3Nzc3NyIsIndpbmRvd19vZmZzZXQiOjMwLCJ3aW5kb3dfcG9zaXRpb24iOiJCb3R0b20gUmlnaHQiLCJtYXhpbWl6ZWRfdGl0bGUiOiJUaGlzIGNoYXQgaXMgc28gb24hIiwibWluaW1pemVkX3RpdGxlIjoiTGV0J3MgdGFsayEiLCJ3ZWxjb21lX21lc3NhZ2UiOiJIaSEgSG93IGNhbiB3ZSBoZWxwIHlvdSB0b2RheT8iLCJ0aGFua19tZXNzYWdlIjoiVGhhbmsgeW91IGZvciBjaGF0dGluZyB3aXRoIHVzLiBJZiB5b3UgaGF2ZSBhZGRpdGlvbmFsIHF1ZXN0aW9ucywgZmVlbCBmcmVlIHRvIHBpbmcgdXMhIiwid2FpdF9tZXNzYWdlIjoiQWxsIG91ciBhZ2VudHMgYXJlIGJ1c3kgY2hhdHRpbmcgcmlnaHQgbm93LiBQbGVhc2UgaGFuZyBvbiBmb3IgYSBjb3VwbGUgb2YgbWludXRlcy4iLCJ0ZXh0X3BsYWNlIjoiWW91ciBNZXNzYWdlIiwiY29ubmVjdGluZ19tc2ciOiJXYWl0aW5nIGZvciBhbiBhZ2VudCIsImFnZW50X2pvaW5lZF9tc2ciOiIkIGhhcyBqb2luZWQgdGhlIGNoYXQiLCJhZ2VudF9sZWZ0X21zZyI6IiQgaGFzIGxlZnQgdGhlIGNoYXQifSwicm91dGluZyI6bnVsbCwicHJlY2hhdF9mb3JtIjp0cnVlLCJwcmVjaGF0X21lc3NhZ2UiOiJXZSBjYW4ndCB3YWl0IHRvIHRhbGsgdG8geW91LiBCdXQgZmlyc3QsIHBsZWFzZSB0YWtlIGEgY291cGxlIG9mIG1vbWVudHMgdG8gdGVsbCB1cyBhIGJpdCBhYm91dCB5b3Vyc2VsZi4iLCJwcmVjaGF0X2ZpZWxkcyI6eyJuYW1lIjp7InRpdGxlIjoiTmFtZSIsInNob3ciOiIyIn0sInBob25lIjp7InRpdGxlIjoiUGhvbmUiLCJzaG93IjoiMCJ9LCJlbWFpbCI6eyJ0aXRsZSI6IkVtYWlsIiwic2hvdyI6IjAifSwidGV4dGZpZWxkIjp7InRpdGxlIjoiTWVzc2FnZSIsInNob3ciOiIwIn0sImRyb3Bkb3duIjp7InRpdGxlIjoiRHJvcERvd24iLCJzaG93IjoiMCIsImxpc3QiOlsiIl19fSwiYnVzaW5lc3NfY2FsZW5kYXIiOm51bGwsIm5vbl9hdmFpbGFiaWxpdHlfbWVzc2FnZSI6bnVsbCwicHJvYWN0aXZlX2NoYXQiOmZhbHNlLCJwcm9hY3RpdmVfdGltZSI6MTUsInNpdGVfdXJsIjoiaHViaXQuZnJlc2hkZXNrLmNvbSIsImV4dGVybmFsX2lkIjpudWxsLCJkZWxldGVkIjpmYWxzZSwib2ZmbGluZV9jaGF0Ijp7InNob3ciOiIxIiwiZm9ybSI6eyJuYW1lIjoiTmFtZSIsImVtYWlsIjoiRW1haWwiLCJtZXNzYWdlIjoiTWVzc2FnZSJ9LCJtZXNzYWdlcyI6eyJ0aXRsZSI6IkxlYXZlIHVzIGEgbWVzc2FnZSEiLCJ0aGFuayI6IlRoYW5rIHlvdSBmb3Igd3JpdGluZyB0byB1cy4gV2Ugd2lsbCBnZXQgYmFjayB0byB5b3Ugc2hvcnRseS4iLCJ0aGFua19oZWFkZXIiOiJUaGFuayB5b3UhIn19LCJtb2JpbGUiOnRydWUsImNyZWF0ZWRfYXQiOiIyMDE0LTA5LTExVDA3OjEwOjE5LjAwMFoiLCJ1cGRhdGVkX2F0IjoiMjAxNC0xMC0xOFQxMDo0NjoxOC4wMDBaIn0=';
	</script>
	<!-- chat code end -->



	</footer>

	<!-- ################################################### FOOTER END################################################# -->

</body>
</html>