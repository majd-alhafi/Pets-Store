<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css">
		<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
		<script type="text/javascript">      function readURL(input) {
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		
		        reader.onload = function (e) {
		            $('#blah')
		                .attr('src', e.target.result)
		                .width(150)
		                .height(200);
		        	};
		
		        	reader.readAsDataURL(input.files[0]);
		    	}
			}
		</script>
        <title>JSP Page</title>
    </head>
    <body>
    <h2>Register Form</h2>
        <form action="../RegisterationServlet" method="post" enctype="multipart/form-data">
            
            <div class="container">
			  <label for="name"><b>Name</b></label>
			    <input type="text" placeholder="Enter Name" name="name">
			    
			    
			    
			    
			  	<label for="email"><b>Email</b></label>
			  	<br/>
			    <input type="text" placeholder="Enter Email" name="email" >
			
			    <br/>
			    <label for="uname"><b>Username</b></label>
			    <input type="text" placeholder="Enter Username" name="uname" >
			
			    <label for="psw"><b>Password</b></label>
			    <input type="password" placeholder="Enter Password" name="psw" >
			     
			     <br/> 
			     <label for="image"><b>Image</b></label>
			     
			    <input type="file" name="file" onchange="readURL(this);">
			    
			    <br/> 
			    <img id="blah" src="#" alt="your image" />
			     
			     
			    <button type="submit">Register</button>
			    <label>
			      <input type="checkbox" checked="checked" name="remember"> Remember me
			    </label>
			 </div>
            
            <div class="container" style="background-color:#f1f1f1">
			    <button type="button" class="cancelbtn">Cancel</button>
			    <span class="psw">Forgot <a href="#">password?</a></span>
  			</div>
            
                        
                    
                    
              

        </form>
</body>
</html>
