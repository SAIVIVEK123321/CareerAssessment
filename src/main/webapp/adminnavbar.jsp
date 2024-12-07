<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JFSD Admin Dashboard</title>
    
    <style>
        /* CSS Reset and Variables */
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #34495e;
            --accent-color: #3498db;
            --background-color: #ecf0f1;
            --text-color: #2c3e50;
            --white: #ffffff;
            --hover-color: #2980b9;
            
            --font-primary: 'Arial', 'Helvetica Neue', sans-serif;
            --transition-speed: 3.0s;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: var(--font-primary);
            background-color: var(--background-color);
            color: var(--text-color);
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: var(--white);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1.5px;
        }

        nav {
            background-color: var(--secondary-color);
            padding: 15px 0;
            border-radius: 6px;
            margin-top: 20px;
        }

        .list-inline {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            list-style: none;
            gap: 15px;
        }

        .list-inline li a {
            text-decoration: none;
            color: var(--white);
            font-weight: 500;
            padding: 10px 15px;
            border-radius: 4px;
            transition: all var(--transition-speed) ease;
            position: relative;
            overflow: hidden;
        }

        .list-inline li a:hover {
            background-color: var(--accent-color);
            transform: scale(1.05);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Responsive Design */
        @media screen and (max-width: 768px) {
            .list-inline {
                flex-direction: column;
                align-items: stretch;
            }
            
            .list-inline li {
                text-align: center;
                margin-bottom: 10px;
            }
            
            .list-inline li a {
                display: block;
                width: 100%;
            }
        }

        /* Accessibility Enhancements */
        a:focus {
            outline: 3px solid var(--accent-color);
            outline-offset: 2px;
        }
    </style>
</head>
<body>
    <div class="container text-center">
        <h2>CAREER ADMIN</h2>
        <nav>
            <ul class="list-inline">
                <li><a href="adminhome">Home</a></li>
                <li><a href="viewallstudent">View All Students</a></li>
                <li><a href="deletestudent">Delete Student</a></li>
                <li><a href="viewstudentbyid">View Student By ID</a></li>
                <li><a href="adminlogin">Logout</a></li>
                <li><a href="viewallquestions">View All Questions</a></li>
                <li><a href="addQuestion.jsp">Add Question</a></li>
                <li><a href="questions.jsp">View Question by Category</a></li>
                <li><a href="createQuiz.jsp">Create Quiz</a></li>
            </ul>
        </nav>
    </div>
</body>
</html>