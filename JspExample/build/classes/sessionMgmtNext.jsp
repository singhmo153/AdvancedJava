<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Target Page</h1>
<%
String nm,p,i;
nm=request.getParameter("name");
p=request.getParameter("price");
i=request.getParameter("s");
out.print("Image :"+nm);
%>
<img src="<%=i %>" height="100px" width="100px">
<%
out.print("Price :Rs."+p+"/-");
%>
</body>
</html>