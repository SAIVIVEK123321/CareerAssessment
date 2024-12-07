<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Career Management System</title>
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
        .logo {
            max-width: 100px;
            margin-right: 15px;
            vertical-align: middle;
        }
        nav ul {
            list-style: none;
            padding: 0;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            background-color: #004080;
            border-radius: 25px;
            padding: 10px 20px;
        }
        nav ul li {
            margin: 0 10px;
        }
        nav ul li a {
            text-decoration: none;
            font-weight: bold;
            color: #fff;
            padding: 8px 15px;
            border-radius: 15px;
            transition: all 0.3s ease;
        }
        nav ul li a:hover {
            background-color: #0066cc;
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
        .gallery {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            margin-top: 30px;
        }
        .gallery-item {
            text-align: center;
            max-width: 300px;
        }
        .gallery-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .gallery-item:hover img {
            transform: scale(1.05); /* Slight zoom effect */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4); /* Increased shadow effect */
        }
        .gallery-item h4 {
            margin-top: 10px;
            color: #004080;
            transition: color 0.3s ease;
        }
        .gallery-item:hover h4 {
            color: #0066cc; /* Change text color on hover */
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
        <!-- Logo Section -->
        <div class="logo-container">
            <img src="https://www.shutterstock.com/image-vector/success-people-logo-template-design-600nw-2482425567.jpg" alt="Career Management Logo" class="logo">
        </div>

        <h2><i class="glyphicon glyphicon-briefcase"></i> Career Management System</h2>
        <nav>
            <ul class="list-inline">
                <li><a href="<c:url value='/home.jsp' />"><i class="glyphicon glyphicon-home"></i> Home</a></li>
                <li><a href="<c:url value='/studentRegistration.jsp' />"><i class="glyphicon glyphicon-user"></i> Student Registration</a></li>
                <li><a href="<c:url value='/studentLogin.jsp' />"><i class="glyphicon glyphicon-log-in"></i> Student Login</a></li>
                <li><a href="<c:url value='/adminlogin.jsp' />"><i class="glyphicon glyphicon-lock"></i> Admin Login</a></li>
                <li><a href="<c:url value='/aboutus.jsp' />"><i class="glyphicon glyphicon-info-sign"></i> About Us</a></li>
                <li><a href="<c:url value='/contactus.jsp' />"><i class="glyphicon glyphicon-envelope"></i> Contact Us</a></li>
            </ul>
        </nav>

        <div class="intro-section">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrCSrJFgLIFEh4SjxaQAaFLP5fhgMc7t38Pw&s" alt="Career Opportunities">
            <p>Welcome to the Career Management System! Explore your potential, unlock new opportunities, and embark on a journey towards a successful future. Whether you're a student or an administrator, we provide the tools and resources to help you navigate your career path.</p>
        </div>

        <div class="gallery">
            <div class="gallery-item">
                <a href="<c:url value='/careerPlanningPage.jsp' />">
                    <img src="https://www.digitalvidya.com/blog/wp-content/uploads/2019/07/Career-Planning_11e51d7713b3dd7a9c26782ae82eb165.webp" alt="Career Planning">
                    <h4>Career Planning</h4>
                </a>
            </div>
            <div class="gallery-item">
                <a href="<c:url value='/skillDevelopmentPage.jsp' />">
                    <img src="https://www.rvsglobe.com/uploaded-files/thumb-cache/member_120/thumb---skill-development-training_4461.jpg" alt="Skill Development">
                    <h4>Skill Development</h4>
                </a>
            </div>
            <div class="gallery-item">
                <a href="<c:url value='/teamCollaborationPage.jsp' />">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR78Xrev4vIosxYFTQ4CGNlFnD-v4uzkueUQ&s" alt="Team Collaboration">
                    <h4>Team Collaboration</h4>
                </a>
            </div>
            <div class="gallery-item">
                <a href="<c:url value='/goalAchievementPage.jsp' />">
                    <img src="https://media.licdn.com/dms/image/D4E12AQHvWzfFP9egmw/article-cover_image-shrink_720_1280/0/1703332772615?e=2147483647&v=beta&t=91fjntDYSiJzFT6ZOG-__4CENb7QYdjCIX2OiNlCb-M" alt="Goal Achievement">
                    <h4>Goal Achievement</h4>
                </a>
            </div>
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

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script id="messenger-widget-b" src="https://cdn.botpenguin.com/website-bot.js" defer>67487b0cffa240a9e3daa4f9,67487aca963485c0b6f35bd7</script>
</body>
</html>
