<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%! String ID, sqlCommand, executeSqlCommand; %>
<%!int rs=0;%>


<%
ID = request.getParameter("i1");
out.print(ID);
sqlCommand = request.getParameter("sqlCommand");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","");
	Statement st=c1.createStatement();
	
	
	if(sqlCommand.equals("Delete"))
	{
		out.print(ID);
		executeSqlCommand = "delete from studentrecord where ID = '"+ID+"'";

		rs=st.executeUpdate(executeSqlCommand);
	if(rs>0)
		{
			response.sendRedirect("studentDBdisplay.jsp");
		}
	}
	
	
}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
	}
 %>
</body>
</html>