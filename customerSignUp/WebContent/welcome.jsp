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
<h1> welcome   
<%
HttpSession ob=request.getSession();
String nm=(String)ob.getAttribute("username");
%>
<%=nm %>
</h1>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/customerdb","root","");
	Statement st=c.createStatement();
	String sql;
	
	sql="select * from producttable";
	ResultSet rs=st.executeQuery(sql);
	%>
	<table border=2><tr><td>Name</td><td>ID</td><td>class</td><td>grade</td></tr>
	<%
	while(rs.next())
	{
		%>
	<tr><td><%= rs.getString(1) %></td>
	<td><%= rs.getString("PName") %></td>
	<td><%= rs.getString("Price")%></td>
	<td><%= rs.getString("ProductDesc")%></td>
	
	<%
	}
	%>
	</table>
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