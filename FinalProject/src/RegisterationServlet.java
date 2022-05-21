import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/RegisterationServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

public class RegisterationServlet extends HttpServlet {
    /*
     create images folder at, C:\Users\Dharmesh Mourya\Documents\NetBeansProjects\ImageProject\build\web\images
     */

 
    
    
    private String uploadImage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	String fileName = "";
    	try {
    		response.setContentType("text/html;charset=UTF-8");
	    	Part part = request.getPart("file");
	        fileName = extractFileName(part);
	        String savePath = "C:\\Users\\Majd Al Hafi\\eclipse-workspace\\FinalProject\\WebContent\\uploaded\\" + fileName;
	        part.write(savePath + File.separator);
    	}
    	catch(Exception e) {
    		
    	}
		return fileName;
    }
    
    
    
    
    protected boolean insertUserToDatabase(String query) {
    	boolean inserted = false;
    	try
        {
          Class.forName("com.mysql.jdbc.Driver");
			//make connection
          Connection dbConnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/petsstore","root","");
			// create a statement
          Statement stmt = dbConnect.createStatement();
          
          stmt.executeUpdate(query);

          dbConnect.close();
          inserted = true;
        }
        catch (Exception e)
        {
          System.err.println("Got an exception!");
          System.err.println(e.getMessage());
        }
    	return inserted;
    }
    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String image = uploadImage(request,response);
    	String name = request.getParameter("name");
		String email = request.getParameter("email");
		String userName = request.getParameter("uname");
		String password = request.getParameter("psw");
		System.out.println(image);
		String query = new String ("INSERT INTO user VALUES  ( " + "\'" + name + "\'" + ',' + "\'" + userName + "\'" + ',' + "\'" + password + "\'" + ',' + "\'" + email + "\'" +  ',' + "\'" + image + "\'" +  ')');
		boolean result = insertUserToDatabase(query);
		if (result) {
			HttpSession session = request.getSession();
			session.setAttribute("loggedin", "True");
			session.setAttribute("name", name);
			session.setAttribute("image", image);
			response.sendRedirect("template/index.jsp");
		}

    }
    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}