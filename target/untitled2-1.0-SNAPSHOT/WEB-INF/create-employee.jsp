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
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .header {
            position: absolute;
            top: 10px;
            left: 10px;
        }

        form {
            width: 300px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        form input[type='text'],
        form input[type='number'] {
            width: 100%;
            margin-bottom: 10px;
            padding: 8px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        form input[type='submit'] {
            width: 100%;
            padding: 10px;
            border-radius: 3px;
            border: none;
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }

        form input[type='submit']:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="header">
    <h1>Create New Employee</h1>
    <a href='/employee'>Back</a>
</div>
<form method='post' action='/employee'>
    Name: <input type='text' name='name'><br>
    Age: <input type='number' name='age'><br>
    Salary: <input type='text' name='salary'><br>
    Department: <input type='text' name='department'><br>
    <input type='submit' value='Create'>
</form>
</body>
</html>




