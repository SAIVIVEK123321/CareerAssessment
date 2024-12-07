<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Skill Development</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* General Styles */
        body {
            background-color: #f4f4f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .container {
            margin-top: 30px;
            flex: 1;
        }
        h2 {
            color: #004080;
            font-weight: bold;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }
        .back-btn {
            margin-bottom: 20px;
        }
        .intro-section {
            text-align: center;
            margin-top: 30px;
        }
        .intro-section img {
            max-width: 100%;
            height: auto;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .intro-section p {
            font-size: 18px;
            margin-top: 20px;
            color: #333;
        }
        .skills-list {
            margin-top: 30px;
        }
        .skills-list ul {
            list-style-type: square;
            padding-left: 20px;
        }
        .action-section {
            text-align: center;
            margin-top: 30px;
            padding: 20px;
            background-color: #e8f4f8;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .action-section a {
            display: inline-block;
            background-color: #004080;
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            margin: 10px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .action-section a:hover {
            background-color: #003366;
        }
        footer {
            background-color: #004080;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            border-top: 2px solid #003366;
        }
        footer p {
            margin: 0;
            font-size: 14px;
        }
        .social-icons {
            margin-top: 15px;
        }
        .social-icons a {
            color: #fff;
            font-size: 25px;
            margin: 0 15px;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        .social-icons a:hover {
            color: #0066cc;
        }
    </style>
</head>
<body>
    <div class="container text-center">
        <h2><i class="glyphicon glyphicon-cogs"></i> Skill Development</h2>

        <!-- Back Button -->
        <a href="<c:url value='/home.jsp' />" class="btn btn-primary back-btn">
            <i class="glyphicon glyphicon-arrow-left"></i> Back to Home
        </a>

        <div class="intro-section">
            <img src="https://www.rvsglobe.com/uploaded-files/thumb-cache/member_120/thumb---skill-development-training_4461.jpg" alt="Skill Development">
            <p>Welcome to the Skill Development section! Discover resources and strategies to enhance your personal and professional skills for a successful career journey.</p>
        </div>

        <div class="skills-list">
            <h3>Essential Skills for Success</h3>
            <ul>
                <li><strong>Communication Skills:</strong> Convey ideas clearly and effectively to build stronger connections.</li>
                <li><strong>Problem-Solving:</strong> Analyze challenges and develop innovative solutions.</li>
                <li><strong>Time Management:</strong> Organize tasks and prioritize effectively to maximize productivity.</li>
                <li><strong>Leadership and Teamwork:</strong> Inspire others and collaborate efficiently in team environments.</li>
                <li><strong>Technical Skills:</strong> Master industry-relevant tools and technologies to stay competitive.</li>
            </ul>
        </div>

        <!-- Action Section -->
        <div class="action-section">
            <h3>Take Action Today!</h3>
            <a href="<c:url value='/register.jsp' />">Register Now</a>
            <a href="<c:url value='/updateSkills.jsp' />">Update Skills</a>
        </div>
    </div>
    

    <footer>
        <p>&copy; <%= java.time.Year.now().getValue() %> Career Management System. All Rights Reserved.</p>
        <div class="social-icons">
            <a href="https://www.facebook.com/batchala.saivivek/" target="_blank" rel="noopener noreferrer"><i class="fab fa-facebook-square"></i><span class="sr-only">Facebook</span></a>
            <a href="https://x.com/sai_vivek04" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter-square"></i><span class="sr-only">Twitter</span></a>
            <a href="https://www.linkedin.com/in/sai-vivek-batchala-06595628a/" target="_blank" rel="noopener noreferrer"><i class="fab fa-linkedin"></i><span class="sr-only">LinkedIn</span></a>
            <a href="https://www.instagram.com" target="_blank" rel="noopener noreferrer"><i class="fab fa-instagram"></i><span class="sr-only">Instagram</span></a>
        </div>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>
