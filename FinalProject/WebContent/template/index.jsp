<%@ page import="java.util.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="classes.*" %>
<%@ page language="java" %>
<!DOCTYPE html>
<!--
	ustora by freshdesignweb.com
	Twitter: https://twitter.com/freshdesignweb
	URL: https://www.freshdesignweb.com/ustora/
-->
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pet Store</title>
    
    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> 
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="shop.jsp">Shop page</a></li>
                        <li><a href="#">Category</a></li>
                        <li><a href="#">Contact</a></li>
                        <%
                        String loggedin = (String)session.getAttribute("loggedin");  
                        	if (loggedin != "True"){
                        		out.print("<li><a href=" + "login.html" + ">Login</a></li>");
                        	}
                        	else{
                        		out.print("<li><a href=" + "../LogoutServlet" + "> Logout</a></li>");
                        		out.print("<li> <a>" + (String)session.getAttribute("name") + "</a></li>");
                        		out.print("<li> <img src = ../uploaded/" + (String)session.getAttribute("image") + " width = \"50\" ></li>");
                        	}
                        %>
                    </ul>
                </div>
                
            </div>
        </div>
    </div> <!-- End mainmenu area -->
    
    <div class="slider-area">
        	<!-- Slider -->
			<div class="block-slider block-slider4">
				<ul class="" id="bxslider-home4">
					<li><img src="../uploaded/hamster.jpg" alt="Slide"></li>
					<li><img src="../uploaded/pets.jpg" alt="Slide"></li>
				</ul>
			</div>
			<!-- ./Slider -->
    </div> <!-- End slider area -->
    
   
    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
              <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">Latest Pets</h2>
                        <div class="product-carousel">
                               <%
		String query = new String ("Select * from pet ORDER BY price DESC");
		ArrayList<Pet> pets = new ArrayList<Pet>();
		try {
		// set the driver
		Class.forName("com.mysql.jdbc.Driver");
		//make connection
		Connection dbConnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/petsstore","root","");
		// create a statement
		Statement stmt = dbConnect.createStatement();
		// make a query	
		ResultSet rs = stmt.executeQuery(query);
		//ResultSet rs2 = stmt.executeQuery(query2);
		if(rs.next()) {
		do {
			// Pet Info
			int id = (int)rs.getInt("id");
			String name = (String)rs.getString("name");
			String description  = (String)rs.getString("description");
			String type = (String)rs.getString("type");
			float age= (float)rs.getFloat("age");
			float price= (float)rs.getFloat("price");
			String photo = "../uploaded/" + (String)rs.getString("photo");
			String video = "../uploaded/" + (String)rs.getString("video");
				
		Pet pet = new Pet(id,name,description,type,age,price,photo,video);
				pets.add(pet);
				
				out.print("<div class=\"single-product\">");
				out.print("<div class=\"product-f-image\">");
				out.print("<img src=" + photo  + ">");
				out.print("<div class='product-hover'>");
				//out.print(pets.get(id));
						   //<a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
						   out.print("<a href='single-product.jsp?id=" + id +"'" + "class=\"view-details-link\"><i class=\"fa fa-link\"></i> See details</a>");
					  out.print("</div>");
				   out.print("</div>");
				   
				   out.print("<h2> " + name + "</h2>");
		
				   out.print("<div class=\"product-carousel-price\">");
				   out.print("<ins> $" + price +"</ins>"); 
					   out.print("</div>");                                 
				   out.print("</div>");
				  
				   
				} while (rs.next());
			stmt.close();
			dbConnect.close();
		  }//end of else
		//session.setAttribute("Pets", pets);
		} catch (Exception e) {
		out.println(e.getMessage());
		}
		 //}
	%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End main content area -->
    
    
    
    
    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
              <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">Latest Vendors</h2>
                        <div class="product-carousel">
                               <%
                               
                       		String query2 = new String ("Select * from vendor ORDER BY rate DESC");
                       		
                       		ArrayList<Vendor> vendors = new ArrayList<Vendor>();
                       		try {
                       		// set the driver
                       		Class.forName("com.mysql.jdbc.Driver");
                       		//make connection
                       		Connection dbConnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/petsstore","root","");
                       		// create a statement
                       		Statement stmt = dbConnect.createStatement();
                       		// make a query	
                       		ResultSet rs2 = stmt.executeQuery(query2);
                       		if(rs2.next()) {
                       		do {
                       		//Vendor info
							int id = (int)rs2.getInt("id");
                       		String vendorName = (String)rs2.getString("name");
                       		String vendorPhone = (String)rs2.getString("phone");
                       		String vendorAddress = (String)rs2.getString("address");
                       		float vendorRate = (float)rs2.getFloat("rate");
                       		String vendorPhoto = "../uploaded/" + (String)rs2.getString("photo");
                       		
                       		Vendor vendor = new Vendor(vendorName,vendorPhone,vendorAddress,vendorRate,vendorPhoto);
                       		vendors.add(vendor);
                       		
                       		out.print("<div class=\"single-product\">");
            				out.print("<div class=\"product-f-image\">");
            				out.print("<img src=" + vendorPhoto  + ">");
            				out.print("<div class='product-hover'>");
            				//out.print(pets.get(id));
            						   //<a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
            						   out.print("<a href='vendors.jsp?id=" + id +"'" + "class=\"view-details-link\"><i class=\"fa fa-link\"></i> See details</a>");
            					  out.print("</div>");
            				   out.print("</div>");
            				   
            				   out.print("<h2> " + vendorName + "</h2>");
            		
            				   out.print("<div class=\"product-carousel-price\">");
            				   out.print("<ins> " + vendorRate +"/5 </ins>"); 
            					   out.print("</div>");                                 
            				   out.print("</div>");
                       		
                       		
                       		} while (rs2.next());
                       		stmt.close();
                       		dbConnect.close();
                       		}
                       		
                       		} catch (Exception e) {
                       		out.println(e.getMessage());
                       		}
                           %>
                               
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End main content area -->
    

    
   

    <div class="product-widget-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="single-product-widget">
                        <h2 class="product-wid-title">Top Vendors</h2>
                        <a href="" class="wid-view-more">View All</a>
                        <%
                        int k = 0;
							for (Vendor v : vendors){
								out.print("<div class='single-wid-product'>");
								out.print("<img src = " + v.getPhoto() + " width = '100'>");
								out.print("<h2><a href='#'>" + v.getName() + "</a></h2>");
								out.print("<div class='product-wid-rating'>");
								for (int i =0;i<v.getRate();i++)
									out.print("<i class='fa fa-star'></i>");
								out.print("</div>");
								out.print("<div class='product-wid-price'>");
								out.print("<ins>" + v.getRate() + "/5 </ins>");
								out.print("</div>");                            
								out.print("</div>");  
								k++;
								if (k == 4)
									break;
							}
                        %>
                        <!--  -->
                    </div>
                </div>
                <div class="col-md-4">
                   
                </div>
                <div class="col-md-4">
                    <div class="single-product-widget">
                        <h2 class="product-wid-title">Top Pets</h2>
                        <a href="#" class="wid-view-more">View All</a>
                        <!--  <div class="single-wid-product">
                            <a href="single-product.html"><img src="img/product-thumb-3.jpg" alt="" class="product-thumb"></a>
                            <h2><a href="single-product.html">Apple new i phone 6</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins>$400.00</ins> <del>$425.00</del>
                            </div>                            
                        </div>
                        <div class="single-wid-product">
                            <a href="single-product.html"><img src="img/product-thumb-4.jpg" alt="" class="product-thumb"></a>
                            <h2><a href="single-product.html">Samsung gallaxy note 4</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins>$400.00</ins> <del>$425.00</del>
                            </div>                            
                        </div>-->
                        
                        <%
                        int z = 0;
							for (Pet p : pets){
								out.print("<div class='single-wid-product'>");
								out.print("<img src =" + p.getPhoto() + " width = '100'>");
								out.print("<h2><a href='#'>" + p.getName() + "</a></h2>");
								out.print("<div class='product-wid-rating'>");
								out.print("</div>");
								out.print("<div class='product-wid-price'>");
								out.print("<ins>$" + p.getPrice() + "</ins>");
								out.print("</div>");                            
								out.print("</div>");  
								z++;
								if (z == 4)
									break;
							}
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End product widget area -->
    
    <div class="footer-top-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="footer-about-us">
                        <h2>u<span>Stora</span></h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero quam laborum quas alias dolores blanditiis iusto consequatur, modi aliquid eveniet eligendi iure eaque ipsam iste, pariatur omnis sint! Suscipit, debitis, quisquam. Laborum commodi veritatis magni at?</p>
                        <div class="footer-social">
                            <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">User Navigation </h2>
                        <ul>
                            <li><a href="#">My account</a></li>
                            <li><a href="#">Order history</a></li>
                            <li><a href="#">Wishlist</a></li>
                            <li><a href="#">Vendor contact</a></li>
                            <li><a href="#">Front page</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Categories</h2>
                        <ul>
                            <li><a href="#">Mobile Phone</a></li>
                            <li><a href="#">Home accesseries</a></li>
                            <li><a href="#">LED TV</a></li>
                            <li><a href="#">Computer</a></li>
                            <li><a href="#">Gadets</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-newsletter">
                        <h2 class="footer-wid-title">Newsletter</h2>
                        <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
                        <div class="newsletter-form">
                            <form action="#">
                                <input type="email" placeholder="Type your email">
                                <input type="submit" value="Subscribe">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End footer top area -->
    
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="copyright">
                        <p>&copy; 2015 uCommerce. All Rights Reserved. <a href="http://www.freshdesignweb.com" target="_blank">freshDesignweb.com</a></p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="footer-card-icon">
                        <i class="fa fa-cc-discover"></i>
                        <i class="fa fa-cc-mastercard"></i>
                        <i class="fa fa-cc-paypal"></i>
                        <i class="fa fa-cc-visa"></i>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End footer bottom area -->
   
    <!-- Latest jQuery form server -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="js/main.js"></script>
    
    <!-- Slider -->
    <script type="text/javascript" src="js/bxslider.min.js"></script>
	<script type="text/javascript" src="js/script.slider.js"></script>
  </body>
</html>