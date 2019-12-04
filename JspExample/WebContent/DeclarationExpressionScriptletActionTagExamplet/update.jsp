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
			sql="select ID from studentRecord";
			ResultSet rs=st.executeQuery(sql);
			%>
			<form action='delete.jsp'>ID :<select name='i1'>
			<%
			while(rs.next())
			{
				%>
			<option><%=rs.getString("ID")%></option>
			<%
			}
			%>
		
		</select>
		<input type= 'submit' value = 'Delete' name = 'sqlCommand'/></form>
		<%
		}catch(Exception e)
		{
			e.printStackTrace();
		}
%>
		
</body>
</html>