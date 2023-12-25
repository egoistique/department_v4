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
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            margin: 0;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
            color: #007bff;
            margin-bottom: 10px;
        }

        a:hover {
            text-decoration: underline;
        }

        ul {
            list-style: none;
            padding: 0;
            text-align: left;
            width: 50%;
        }

        li {
            margin-bottom: 10px;
            border-bottom: 1px solid #ccc;
            padding-bottom: 5px;
        }

        li:last-child {
            border-bottom: none;
            margin-bottom: 0;
        }

        li a {
            margin-left: 10px;
            color: #dc3545;
        }

        li a:hover {
            text-decoration: underline;
        }
    </style>
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
