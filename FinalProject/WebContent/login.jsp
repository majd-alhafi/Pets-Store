<%@ page import="java.util.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Insert title here</title>
	</head>
	<body>
		<form action="test" method = "post" >
			<input type="submit">
			<%
				
			/*ArrayList<String> imagesName = new ArrayList<String>();
			String query = new String ("Select photo from pet");
		
		try {
			// set the driver
			Class.forName("com.mysql.jdbc.Driver");
			//make connection
			Connection dbConnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/petsstore","root","");
			// create a statement
			Statement stmt = dbConnect.createStatement();
		    // make a query	
			ResultSet rs = stmt.executeQuery(query);
			if (!rs.next())
				out.println("no data");
			else {
			int i = 0;
				do {
					imagesName.add("uploaded/"+ rs.getString("photo"));
					out.print("<img src = " + imagesName.get(i) + ">");
					i++;
					} while (rs.next());
				stmt.close();
			    dbConnect.close();
			  }//end of else

		} catch (Exception e) {
			out.println(e.getMessage());
		}*/
		
        out.print(request.getAttribute("message"));
        
			%>
		
			
		</form>
	</body>
</html>