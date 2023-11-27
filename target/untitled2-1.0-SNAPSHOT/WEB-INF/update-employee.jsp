<%--
  Created by IntelliJ IDEA.
  User: Kate
  Date: 27.11.2023
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<!-- update-employee.jsp -->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update Employee</title>
</head>
<body>
<h1>Update Employee</h1>
<a href='/employee'>Back</a><br><br>
<form method='post' action='/updateEmployees'>
    Name: <input type='text' name='name' value='${employee.name}'><br>
    Age: <input type='number' name='age' value='${employee.age}'><br>
    Salary: <input type='text' name='salary' value='${employee.salary}'><br>
    Department ID: <input type='number' name='departmentId' value='${employee.departmentId}'><br>
    <input type='hidden' name='employeeId' value='${employeeId}'>
    <input type='submit' value='OK'>
</form>
</body>
</html>

