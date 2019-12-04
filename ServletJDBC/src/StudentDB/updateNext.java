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
 * Servlet implementation class updateNext
 */
@WebServlet("/updateNext")
public class updateNext extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateNext() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","");
			Statement st=c.createStatement();
			String sql;
			String id = request.getParameter("i1");
			sql="select name, ID, class, grade from studentrecord where ID ="+id;
			
			ResultSet rs=st.executeQuery(sql);
			pw.print("<form action='displayStudentDB' method='post'>");
			pw.print("<table border=2>");
			while(rs.next()){
			pw.print("<tr><td>Name:<input type=text name = name value="+rs.getString(1)+"></td></tr>");
			pw.print("<tr><td>ID:<input type=text name = ID value="+rs.getString("ID")+" readonly></td></tr>");
			pw.print("<tr><td>Class :<input type=text name = class value="+rs.getString("class")+"></td></tr>");
			pw.print("<tr><td>Grade :<input type=text name = grade value="+rs.getString("grade")+"></td></tr>");
			}
			
			pw.print("<input type= 'submit' name = 'sqlCommand' value = 'Update'/></form>");
			
			
			//pw.print("<a href='update'>update</a>");
		}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	}

}
