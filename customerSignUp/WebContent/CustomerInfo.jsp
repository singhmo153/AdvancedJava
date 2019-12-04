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
<%! String name, password, submitAction, executeSqlCommand, username, confirmPassword; %>
<%!int rs1=0;%>


<%

submitAction = request.getParameter("submitAction");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/customerdb","root","");
	Statement st=c1.createStatement();
	
	
	if(submitAction.equals("LogIn"))
	{
		username = request.getParameter("username");
		password = request.getParameter("password");
		
		executeSqlCommand = "select * from customerinfo where userName = '"+username+"' and  password = '"+password+"'";
		ResultSet rs=st.executeQuery(executeSqlCommand);
		
		if(rs.next()){
			HttpSession obj=request.getSession();
			obj.setAttribute("username", rs.getString("name"));
			
			
			response.sendRedirect("welcome.jsp");
		}
		else
		{
			response.sendRedirect("Error.jsp");
		}
		
	}
	
	if(submitAction.equals("SingUp")) {
		name = request.getParameter("name");
		password = request.getParameter("password");
		username = request.getParameter("username");
		executeSqlCommand= "insert into customerinfo(`name`,`username`,`password`) values ('"+name+"','"+username+"', '"+password+"')";
		rs1=st.executeUpdate(executeSqlCommand);
		if(rs1>0)
		{
			response.sendRedirect("login.jsp");
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