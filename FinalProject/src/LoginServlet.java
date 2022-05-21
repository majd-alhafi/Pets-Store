import java.io.IOException;

//import java.io.PrintWriter;

import java.util.*;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.*;

import java.sql.*;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	private ArrayList<?> getUsersFromDatabase(String query,String type) {
		ArrayList users = null;
		try {
			// set the driver
			Class.forName("com.mysql.jdbc.Driver");
			//make connection
			Connection dbConnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/petsstore","root","");
			// create a statement
			Statement stmt = dbConnect.createStatement();
		    // make a query	
			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()){
				do {	
					if (type == "user") {
						users = new ArrayList<User>();
						String name = rs.getString("name");
						String userName = rs.getString("username");
						String passWord = rs.getString("password");
						String email = rs.getString("email");
						String imageName = rs.getString("image");
						User user = new User(name,userName,passWord,email,imageName);
						users.add(user);
					}
					else if (type == "admin") {
						users = new ArrayList<Admin>();
						String userName = rs.getString("username");
						String passWord = rs.getString("password");
						String role = rs.getString("role");
						Admin admin = new Admin(userName,passWord,role);
						users.add(admin);
					}
					} while (rs.next());
				stmt.close();
			    dbConnect.close();
			  }

		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return users;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		//response.sendRedirect("admin/index.html");
		HttpSession session = request.getSession();
		doGet(request, response);
		
		String isAdmin = request.getParameter("admin") ;
		
		if (isAdmin == null) {
			String query = new String ("Select * from user");
			//getFromDatabase(query);
			ArrayList<User> users = (ArrayList<User>) getUsersFromDatabase(query,"user");
			String username = request.getParameter("uname");
			String password = request.getParameter("psw");
			//PrintWriter wr = response.getWriter();
			//
			for (User user : users) {
				String userUserName = user.getUserName();
				String userPassword = user.getPassword();
				if (userUserName.equals(username) && userPassword.equals(password)) {
					String userName = user.getName();
					String userImageName = user.getImageName();
					session.setAttribute("loggedin", "True");
					session.setAttribute("name", userName);
					session.setAttribute("image", userImageName);
					//wr.println(userName);
					//wr.println(userImageName);
					response.sendRedirect("template/index.jsp");
					break;
				}
				
			}
		}
		else {
			String query = new String ("Select * from admin");
			ArrayList<Admin> admins = (ArrayList<Admin>) getUsersFromDatabase(query,"admin");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			for (Admin admin : admins) {
				String adminUserName = admin.getUserName();
				String adminPassword = admin.getPassword();
				if (adminUserName.equals(username) && adminPassword.equals(password)) {
					
					/*String userName = admin.getName();
					String userImageName = admin.getImageName();
					session.setAttribute("loggedin", "True");
					session.setAttribute("name", userName);
					session.setAttribute("image", userImageName);*/
					//wr.println(userName);
					//wr.println(userImageName);
					response.sendRedirect("admin/index.html");
					break;
				}
				
			}
		}
	}
}
