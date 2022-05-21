

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().println("Hello World.");
		PrintWriter out = response.getWriter();

		String query = new String ("Select name from pet");

		
		
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
				do {
					out.println("name= " + rs.getString("name"));
					} while (rs.next());
				stmt.close();
			    dbConnect.close();
			  }//end of else

		} catch (Exception e) {
			out.println(e.getMessage());
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
