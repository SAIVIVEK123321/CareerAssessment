<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Career Management System</title>  
    <style>
        body {
            background-color: #A8D5E3;
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
        }
        .container {
            margin-top: 20px;
        }
        h2 {
            color: #007bff;
            font-weight: bold;
            margin: 10px 0;
        }
        nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        nav ul li {
            display: inline-block;
            margin: 0 15px;
        }
        nav ul li a {
            text-decoration: none;
            font-weight: bold;
            color: #333;
            padding: 5px 10px;
            border-radius: 20px;
        }
        nav ul li a:hover {
            background-color: gray;
            color: black;
        }
        .logo {
            max-width: 120px;
            margin-bottom: 10px;
        }
    </style>
</head>  
<body>
    <div class="container text-center">
        <!-- Company Logo -->
        <img src="https://www.shutterstock.com/image-vector/success-people-logo-template-design-600nw-2482425567.jpg" alt="Company Logo" class="logo">
        <h2>Career Management System</h2>
        <nav>
            <ul class="list-inline">
                <li><a href="home.jsp">Home</a></li>
                <li><a href="studentRegistration.jsp">Student Registration</a></li>
                <li><a href="studentLogin.jsp">Student Login</a></li>
                <li><a href="adminlogin.jsp">Admin Login</a></li>
                <li><a href="aboutus.jsp">About Us</a></li>
            </ul>
        </nav>
    </div>
</body>
</html>