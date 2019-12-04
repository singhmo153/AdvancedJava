package StudentDB;

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
 * Servlet implementation class displayStudentDB
 */
@WebServlet("/displayStudentDB")
public class displayStudentDB extends HttpServlet {                           
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public displayStudentDB() {
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
			Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","");
			Statement st=c.createStatement();
			String sql;
			
			sql="select * from studentRecord";
			ResultSet rs=st.executeQuery(sql);
			pw.print("<table border=2><tr><td>Name</td><td>ID</td><td>class</td><td>grade</td></tr>");
			while(rs.next())
			{
			pw.print("<tr><td>"+rs.getString(1)+"</td>");
			pw.print("<td>"+rs.getString("ID")+"</td>");
			pw.print("<td>"+rs.getString("class")+"</td>");
			pw.print("<td>"+rs.getString("grade")+"</td>");
			pw.print("<td><a href='updatepage'>Update</a></td></tr>");
			}
			pw.print("<a href='update'>update</a>");
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
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
	    String name, ID, cls, grade;
	    String sqlCommand, executeSqlCommand;
	    int rs=0;
		name = request.getParameter("name");
		
		ID = request.getParameter("ID");
		cls = request.getParameter("class");
		grade = request.getParameter("grade");
		sqlCommand = request.getParameter("sqlCommand");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","");
			Statement st=c1.createStatement();
			
			
			if(sqlCommand.equals("Insert"))
			{
				executeSqlCommand= "insert into studentrecord(`name`,`ID`,`class`,`grade`) values ('"+name+"','"+ID+"', '"+cls+"','"+grade+"')";
				rs=st.executeUpdate(executeSqlCommand);
			if(rs>0)
				{
					response.sendRedirect("displayStudentDB");
				}
			}
			if(sqlCommand.equals("Update"))
			{
				executeSqlCommand = "update studentrecord set `name`='"+name+"', `class`='"+cls+"',`grade`='"+grade+"' where ID = '"+ID+"'";
				pw.print(executeSqlCommand);
				rs=st.executeUpdate(executeSqlCommand);
			if(rs>0)
				{
					response.sendRedirect("displayStudentDB");
				}
			}
			
			
		}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	}

}
