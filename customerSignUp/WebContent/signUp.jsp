<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="Controlpage" method="post">
Name:<input type="text" name="name">
<br><br>
Username:<input type="text" name="username" value="abc@signup.com">
<br><br>
Password:<input type="password" name="password">
<br><br>
Confirm Password:<input type="password" name="confirmPassword">
<script> if(document.getElementByID("password").value()!= document.getElementByID("confirmPassword").value()) { alert("password should be same"); } </script>
<br><br>
<input type="submit" value = 'SingUp' name="submitAction">
</form>
</body>
</html>