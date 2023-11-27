<%--
  Created by IntelliJ IDEA.
  User: Kate
  Date: 27.11.2023
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Departments</title>
</head>
<body>

<h1>Departments</h1>
<a href='/'>Back</a><br><br>
<a href='/department?action=new'>New Department</a><br><br>

<c:forEach var="department" items="${departments}">
    <h2>Name: ${department.name}</h2>
    <c:set var="employees" value="${employeesMap[department.id]}" />

    <p>Number of employees: ${employees.size()}</p>

    <p>Employees:</p>
    <ul>
        <c:forEach var="employee" items="${employees}">
            <li>Name: ${employee.name}, Age: ${employee.age}, Salary: ${employee.salary}</li>
        </c:forEach>
    </ul>

    <a href='/department?action=delete&departmentId=${department.id}'>Delete</a>
    <a href='/updateDepartment?departmentId=${department.id}'>Update</a>
</c:forEach>

</body>
</html>

