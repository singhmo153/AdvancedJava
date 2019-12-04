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

<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","");
	Statement st=c.createStatement();
	String sql;
	
	sql="select * from studentRecord";
	ResultSet rs=st.executeQuery(sql);
	%>
	<table border=2><tr><td>Name</td><td>ID</td><td>class</td><td>grade</td></tr>
	<%
	while(rs.next())
	{
		%>
	<tr><td><%= rs.getString(1) %></td>
	<td><%= rs.getString("ID") %></td>
	<td><%= rs.getString("class")%></td>
	<td><%= rs.getString("grade")%></td>
	
	<%
	}
	%>
	</table>
	<form action="update.jsp">
	<input type="submit" value = 'delete'>
	</form>
	<%
	
}
catch(Exception e)
	{
		e.printStackTrace();
	}
finally{
	
}

%>
</body>
</html>