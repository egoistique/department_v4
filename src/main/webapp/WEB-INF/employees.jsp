<%--
  Created by IntelliJ IDEA.
  User: Kate
  Date: 27.11.2023
  Time: 23:45
  To change this template use File | Settings | File Templates.
--%>
<!-- employees.jsp -->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Employee List</title>
</head>
<body>
<h1>Employee List</h1>
<a href='/'>Back</a><br><br>

<a href='/employee?action=new'>New Employee</a><br><br>
<ul>
    <c:forEach var="employee" items="${employees}">
        <li>
            Name: ${employee.name}, Age: ${employee.age}, Salary: ${employee.salary}
            <a href='/employee?action=delete&employeeId=${employee.id}'>Delete</a>
            <a href='/updateEmployee?employeeId=${employee.id}'>Update</a>
        </li>
    </c:forEach>
</ul>
</body>
</html>
