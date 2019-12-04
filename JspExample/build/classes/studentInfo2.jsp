<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="studentInfo3.jsp">
<%
String name, course;
name=request.getParameter("n1");
course=request.getParameter("c1");
%>
<input type="hidden" value=<%=name %> name="name">
<input type="hidden" value=<%=course %> name="course">
Enter Marks obtained: <input type=text name= "m1">
<input type = "submit" value = "submit" /></form>
</body>
</html>