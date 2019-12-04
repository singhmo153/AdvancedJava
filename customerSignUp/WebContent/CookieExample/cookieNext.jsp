<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! String name, age; %>
<%
name = request.getParameter("name");
age = request.getParameter("age");
Cookie c1 = new Cookie("name",name);
Cookie c2 = new Cookie("age",age);
response.addCookie(c1);
response.addCookie(c2);
 %>

<br><br>
<form action="cookieEnd.jsp">
<input type="submit" value = 'submit'>
</form>
</body>
</html>