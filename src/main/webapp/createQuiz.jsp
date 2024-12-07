<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Quiz</title>
    <!-- Add any styling or CSS links here -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            padding: 20px;
        }
        .container {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
            display: block;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        .message {
            margin-top: 20px;
            font-size: 1.2em;
            color: green;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Create a New Quiz</h2>
        
        <form action="${pageContext.request.contextPath}/create" method="POST">
            <!-- Category input -->
            <div class="form-group">
                <label for="category">Category</label>
                <input type="text" id="category" name="category" placeholder="Enter the category" required>
            </div>

            <!-- Number of Questions input -->
            <div class="form-group">
                <label for="numQ">Number of Questions</label>
                <input type="number" id="numQ" name="numQ" placeholder="Enter number of questions" required>
            </div>

            <!-- Title input -->
            <div class="form-group">
                <label for="title">Quiz Title</label>
                <input type="text" id="title" name="title" placeholder="Enter quiz title" required>
            </div>

            <!-- Submit button -->
            <button type="submit">Create Quiz</button>
        </form>

        <!-- Success or Error message -->
        <c:if test="${not empty message}">
            <div class="message">${message}</div>
        </c:if>
    </div>

</body>
</html>