<%--
  Created by IntelliJ IDEA.
  User: Kate
  Date: 27.11.2023
  Time: 22:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome!</title>
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

        form {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        form input[type='submit'] {
            padding: 10px 20px;
            border-radius: 3px;
            border: none;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            margin: 10px;
        }

        form input[type='submit']:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h1>Welcome!</h1>
<form action="department" method="get">
    <input type="submit" value="Department">
</form>
<form action="employee" method="get">
    <input type="submit" value="Employee">
</form>
</body>
</html>

