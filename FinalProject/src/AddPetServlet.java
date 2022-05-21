

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class AddPetServlet
 */
@WebServlet("/AddPetServlet")
@MultipartConfig
public class AddPetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    
    private String uploadImage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	boolean result = false;
    	String fileName = "";
    	try {
    		response.setContentType("text/html;charset=UTF-8");
	    	Part part = request.getPart("file");
	        fileName = extractFileName(part);
	        String savePath = "C:\\Users\\Majd Al Hafi\\eclipse-workspace\\FinalProject\\WebContent\\uploaded\\" + fileName;
	        part.write(savePath + File.separator);
	        result = true;
    	}
    	catch(Exception e) {
    		System.err.println(e.getMessage());
    	}
		return fileName;
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
    
    
    
    
    protected boolean insertPetToDatabase(String query) {
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
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String image = uploadImage(request,response);
		
		String petName = request.getParameter("name");
		String petDescription = request.getParameter("description");
		String petType = request.getParameter("type");
		float petAge = Float.parseFloat(request.getParameter("age"));
		float petPrice = Float.parseFloat(request.getParameter("price"));
		String petImage = request.getParameter("image");
		//System.out.println(petType);
		String query = new String ("INSERT INTO pet (name, description, type, photo) VALUES ('"+petName+"','"+petDescription+"','"+petType+"','"+petImage+"')");
		boolean result = insertPetToDatabase(query);
		if (result) {
			response.sendRedirect("admin/index.html");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
