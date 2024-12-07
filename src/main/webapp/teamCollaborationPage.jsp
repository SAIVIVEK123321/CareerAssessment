<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Team Collaboration</title>
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
        .team-collaboration-tips {
            margin-top: 30px;
            text-align: left;
        }
        .team-collaboration-tips ul {
            list-style-type: square;
            padding-left: 20px;
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
        <h2><i class="glyphicon glyphicon-users"></i> Team Collaboration</h2>

        <!-- Back Button -->
        <a href="<c:url value='/home.jsp' />" class="btn btn-primary back-btn">
            <i class="glyphicon glyphicon-arrow-left"></i> Back to Home
        </a>

        <div class="intro-section">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR78Xrev4vIosxYFTQ4CGNlFnD-v4uzkueUQ&s" alt="Team Collaboration">
            <p>Welcome to the Team Collaboration section! Effective collaboration is key to achieving success in any career. Here you will find tips and resources to help you collaborate better with teams and improve your team dynamics.</p>
        </div>

        <div class="team-collaboration-tips">
            <h3>Tips for Effective Team Collaboration</h3>
            <ul>
                <li><strong>Clear Communication:</strong> Maintain open and transparent communication with your team members.</li>
                <li><strong>Active Listening:</strong> Ensure that everyone’s opinions are heard and understood.</li>
                <li><strong>Set Clear Roles and Responsibilities:</strong> Clearly define each team member's role to avoid confusion.</li>
                <li><strong>Embrace Diversity:</strong> Leverage the diverse skill sets and perspectives within your team.</li>
                <li><strong>Collaborate with Technology:</strong> Use tools like Google Drive, Slack, or Trello to streamline teamwork.</li>
                <li><strong>Give Constructive Feedback:</strong> Provide regular, constructive feedback to help improve team performance.</li>
            </ul>
        </div>
    </div>

    <footer>
        <p>&copy; <%= java.time.Year.now().getValue() %> Career Management System. All Rights Reserved.</p>
        <div class="social-icons">
            <a href="https://www.facebook.com" target="_blank" rel="noopener noreferrer"><i class="fab fa-facebook-square"></i><span class="sr-only">Facebook</span></a>
            <a href="https://twitter.com" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter-square"></i><span class="sr-only">Twitter</span></a>
            <a href="https://www.linkedin.com" target="_blank" rel="noopener noreferrer"><i class="fab fa-linkedin"></i><span class="sr-only">LinkedIn</span></a>
            <a href="https://www.instagram.com" target="_blank" rel="noopener noreferrer"><i class="fab fa-instagram"></i><span class="sr-only">Instagram</span></a>
        </div>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>
