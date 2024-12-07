<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #721c24;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .error-container {
            text-align: center;
            background-color: #f5c6cb;
            border: 1px solid #f5c6cb;
            border-radius: 8px;
            padding: 20px;
            max-width: 500px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .error-container h1 {
            margin-bottom: 20px;
        }
        .error-container p {
            margin-bottom: 15px;
        }
        .error-container a {
            text-decoration: none;
            color: #721c24;
            font-weight: bold;
        }
        .error-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Error!</h1>
        <p>${msg}</p>
        <p>If you believe this is a mistake, please <a href="contact.jsp">contact the administrator</a>.</p>
        <p><a href="studentLogin">Return to Login Page</a></p>
    </div>
</body>
</html>
