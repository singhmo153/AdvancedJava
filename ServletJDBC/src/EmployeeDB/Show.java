package EmployeeDB;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Show
 */
@WebServlet("/Show")
public class Show extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Show() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			//create an emloyee db then connect and display the stored data in db
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sampleadvj","root","");
			Statement st=con.createStatement();
			String sql;
			sql="select * from employee";
			ResultSet rs=st.executeQuery(sql);
			pw.print("<table border=2><tr><td>Name</td><td>Id</td><td>Dept</td><td>Location</td>"
					+ "<td>Salary</td></tr>");
			while(rs.next())
			{
			pw.print("<tr><td>"+rs.getString(1)+"</td>");
			pw.print("<td>"+rs.getString("Id")+"</td>");
			pw.print("<td>"+rs.getString("dept")+"</td>");
			pw.print("<td>"+rs.getString("location")+"</td>");
			pw.print("<td>"+rs.getString("salary")+"</td></tr>");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
