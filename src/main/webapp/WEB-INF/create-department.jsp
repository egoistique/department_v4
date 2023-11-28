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
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
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

        form input[type='text'] {
            width: calc(100% - 22px);
            margin-bottom: 10px;
            padding: 8px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        form input[type='submit'] {
            width: calc(100% - 22px);
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
    <h1>Create New Department</h1>
    <a href='/department'>Back</a>
</div>
<form method='post' action='/department'>
    Name: <input type='text' name='name'><br>
    <input type='submit' value='Create'>
</form>
</body>
</html>

