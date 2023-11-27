<%--
  Created by IntelliJ IDEA.
  User: Kate
  Date: 28.11.2023
  Time: 0:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New Department</title>
</head>
<body>
<h1>Create New Department</h1>
<a href='/department'>Back</a><br><br>
<form method='post' action='/department'>
    Name: <input type='text' name='name'><br>
    <input type='submit' value='Create'>
</form>
</body>
</html>
