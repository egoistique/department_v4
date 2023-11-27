<%--
  Created by IntelliJ IDEA.
  User: Kate
  Date: 27.11.2023
  Time: 23:46
  To change this template use File | Settings | File Templates.
--%>
<!-- create-employee.jsp -->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New Employee</title>
</head>
<body>
<h1>Create New Employee</h1>
<a href='/employee'>Back</a><br><br>
<form method='post' action='/employee'>
    Name: <input type='text' name='name'><br>
    Age: <input type='number' name='age'><br>
    Salary: <input type='text' name='salary'><br>
    Department: <input type='text' name='department'><br>
    <input type='submit' value='Create'>
</form>
</body>
</html>

