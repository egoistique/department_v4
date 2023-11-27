<%--
  Created by IntelliJ IDEA.
  User: Kate
  Date: 27.11.2023
  Time: 23:36
  To change this template use File | Settings | File Templates.
--%>
<!-- update-department.jsp -->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update Department</title>
</head>
<body>
<h1>Update Department</h1>
<a href='/department'>Back</a><br><br>
<form method='post' action='/updateDepartments'>
    Name: <input type='text' name='name' value='${department.name}'><br>
    <input type='hidden' name='departmentId' value='${departmentId}'>
    <input type='submit' value='OK'>
</form>
</body>
</html>
