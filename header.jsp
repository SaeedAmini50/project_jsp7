<%@page import="project.ConnectionProvider" %>
<%@page errorPage="error.jsp"  %>
<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
    <%@page  import ="java.text.SimpleDateFormat"%>
<%@page  import ="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>

<html lang="en">
<head>
<script src="js/userjs.js"></script>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SmartStor</title>

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>


<!-- Slick -->
<link type="text/css" rel="stylesheet" href="css/slick.css"/>
<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="css/style.css"/>

    </head>

<body>




 
 
 
<header>
<!-- TOP HEADER -->
<div id="top-header">
<div class="container">
<ul class="header-links pull-left">
<li><a href="#"><i class="fa fa-phone"></i> +93799644575</a></li>
<li><a href="#"><i class="fa fa-envelope-o"></i> smartstor575@email.com</a></li>
<li><a href="#location"><i class="fa fa-map-marker"></i><p style="display:inline" id="shop_place" >موقعیت دوکان</p></a></li>
</ul>




<%







// دریافت ArrayList از Session
ArrayList<String> productIDs = (ArrayList<String>) session.getAttribute("productIDs");

String email;
Object emailObject = session.getAttribute("email");%>
<ul class="header-links pull-right">
<% if (emailObject != null) {
    email= emailObject.toString();
%>

    


<li><a href="#"><i class="fa fa-user-o"></i><%out.print(email); %></a></li>
<% }
else {%>
<li><a href="singin.jsp"><i class="fa fa-user-o"></i ><p style="display:inline" id="sign" >ثبت نام نکردید </p></a></li>
<% } %>
<li><a href="singin.jsp"><i></i>	</a></li>
<li><a href="profile_customer.jsp"><i class="fa fa-user-o"></i><p style="display:inline" id="your_profile" ></p></a></li>
</ul>


</div>
</div>
<!-- /TOP HEADER -->

<!-- MAIN HEADER -->
<div id="header">
<!-- container -->
<div class="container">
<!-- row -->
<div class="row">
<!-- LOGO -->
<div class="col-md-3 col-sm-12  ol-xs-12">
<div class="header-logo">
<a href="#" class="logo">
<img src="./img/logo.jpg" alt="">
</a>
</div>
</div>
<!-- /LOGO -->

<!-- SEARCH BAR -->
<div class="col-md-4 col-sm-12 col-xs-12">
<div class="header-search">
<form   action="search_product.jsp" method="post">
<select class="input-select" name="search_product">
<option id="name_products" >اسم محصولات</option>
<option id="TV" value="TV">تلویزیون</option>

<option id="machin" value="machin">لباسشویی</option>
</select>
<input class="input" placeholder="Search here"  name="search_product">
<button class="search-btn" id="search">Search</button>
</form>
</div>
</div>
<!-- /SEARCH BAR -->


 <div id="content">
        <h1 id="title"></h1>
        <p id="description"></p>
        <button id="btnEnglish">English</button>
        <button id="btnPersian">فارسی</button>
        <button id="btnPashto">پشتو</button>
    </div>
   


<div class="col-md-3 col-sm-6 col-xs-6">
    <div class="header-search">
        <form>
            <select class="input-select" name="language" onchange="changeLanguage(this.value)">
                <option value="en" id="btnEnglish">English</option>
                <option value="fa" id="btnPersian">فارسی</option>
                <option value="ps" id="btnPashto">پشتو</option>
            </select>
            <button class="search-btn" type="submit" id="language">تعیین زبان</button>
        </form>
    </div>
</div>   
<!-- ACCOUNT -->
<div class="col-md-2  col-sm-6  col-xs-6 clearfix">
<div class="header-ctn">
<!-- Wishlist -->
<div>
<a href="wishlist.jsp">
<i class="fa fa-heart-o"></i>
<small id="wishlist">Your Wishlist</small>
<div class="qty">2</div>
</a>
</div>
<!-- /Wishlist -->
<br>
<br>

								<!-- Cart -->
								<div class="dropdown">
									<a class="dropdown-toggle"   data-toggle="dropdown" aria-expanded="true">
										<i class="fa fa-shopping-cart"></i>
										<span id="cart">Your Cart</span>
										<div class="qty">3</div>
									</a>
					  				<div class="cart-dropdown">
										<div class="cart-list">
											<div class="product-widget">
												<div class="product-img">
													<img src="./img/machin6.webp" alt="">
												</div>
												<div class="product-body">
													<h3 class="product-name"><a href="#">لباسشویی</a></h3>
													<h4 class="product-price"><span class="qty">1x</span>AF 16000</h4>
												</div>
												<button class="delete"><i class="fa fa-close"></i></button>
											</div>

											<div class="product-widget">
												<div class="product-img">
													<img src="./img/TVV.jpg" alt="">
												</div>
												<div class="product-body">
													<h3 class="product-name"><a href="#">تلویزیون</a></h3>
													<h4 class="product-price"><span class="qty">3x</span>AF 8000</h4>
												</div>
												<button class="delete"><i class="fa fa-close"></i></button>
											</div>
										</div>
										<div class="cart-summary">
											<small>تعداد انتخاب شده 2</small>
											<h5>کل پول : AF 38000</h5>
										</div>
										<div class="cart-btns">
											<a href="myCart.jsp" id="cart1" >View Cart</a>
											<a href="#" id="payment">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
										</div>
									</div>
								</div>
								<!-- /Cart -->


<!-- Menu Toogle -->
<div class="menu-toggle">
<a href="#">
<i class="fa fa-bars"></i>
<span>Menu</span>
</a>
</div>
<!-- /Menu Toogle -->
</div>
</div>
<!-- /ACCOUNT -->
</div>
<!-- row -->
</div>
<!-- container -->
</div>
<!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->



<!-- NAVIGATION -->
<nav id="navigation">
<!-- container -->
<div class="container">
<!-- responsive-nav -->
<div id="responsive-nav">
<!-- NAV -->
<ul class="main-nav nav navbar-nav">
<li id="home"><a href="index.jsp" >صفحه اصلی</a></li>
<li id="TV1"><a href="storeTV.jsp" >تلویزیون</a></li>
<li id="machin1"><a href="storemachin.jsp ">لباسشویی</a></li>
<li id="name_products2"><a href="product.jsp " >نمایش محصول</a></li>
<li id="admin"><a href="indexAdmin.jsp " >Admin</a></li>



</ul>
<!-- /NAV -->
</div>
<!-- /responsive-nav -->
</div>
<!-- /container -->
</nav>
<!-- /NAVIGATION -->
</body>
</html>