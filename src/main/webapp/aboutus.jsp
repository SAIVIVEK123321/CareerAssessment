<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Project Overview - Career Management System</title>

    <!-- Adding Font Awesome CDN for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

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

        header {
            background-color: #004080;
            color: white;
            padding: 20px;
            text-align: center;
        }

        header h1 {
            margin: 0;
            font-size: 36px;
        }

        .content {
            flex: 1;
            margin: 20px;
            text-align: center;
        }

        .project-description {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 800px;
            margin: 20px auto;
            text-align: left;
        }

        .project-description h2 {
            color: #004080;
            margin-bottom: 10px;
        }

        .project-description p {
            font-size: 16px;
            color: #555;
            line-height: 1.6;
        }

        .project-description ul {
            text-align: left;
            font-size: 16px;
            color: #555;
        }

        .project-description li {
            margin-bottom: 10px;
        }

        .team-section {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            margin-top: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .team-section h2 {
            color: #004080;
            margin-bottom: 20px;
        }

        .team-cards {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .team-card {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            width: 250px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .team-card img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 15px;
        }

        .team-card h3 {
            color: #004080;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .team-card p {
            font-size: 14px;
            color: #555;
        }

        footer {
            background-color: #004080;
            color: white;
            text-align: center;
            padding: 10px 0;
            border-top: 2px solid #003366;
        }

        /* Social Media Icons */
        .social-media {
            margin: 10px 0;
        }

        .social-media a {
            text-decoration: none;
            margin: 0 15px;
            color: white;
            font-size: 24px;
            transition: color 0.3s ease;
        }

        .social-media a:hover {
            color: #f4a261;
        }

        .social-media i {
            font-size: 30px;
        }

    </style>
</head>
<body>

    <header>
        <h1>Career Management System - Project Overview</h1>
    </header>

    <div class="content">

        <!-- Project Description Section -->
        <div class="project-description">
            <h2>Project Overview</h2>
            <p>The Career Management System is designed to provide students with a comprehensive platform to explore career paths, enhance skills, and receive personalized recommendations based on their interests, strengths, and preferences. The system will integrate career assessments, personality tests, skills evaluations, and offer valuable insights to assist students in making informed decisions about their career trajectories.</p>

            <h2>Project Features</h2>
            <ul>
                <li><strong>Career Assessment Tools:</strong> Includes a variety of tests and evaluations to help students identify suitable career paths based on their strengths and interests.</li>
                <li><strong>Personalized Recommendations:</strong> Based on the assessment results, the system provides career recommendations tailored to individual profiles.</li>
                <li><strong>Skills Enhancement Resources:</strong> The system offers resources for students to improve their skills through courses, workshops, and other materials.</li>
                <li><strong>Progress Tracking:</strong> Students can track their development in terms of skills, achievements, and career progression.</li>
                <li><strong>Integration with Job Portals:</strong> The platform integrates with popular job portals to provide students with access to relevant job listings and opportunities.</li>
            </ul>

            <h2>Technologies Used</h2>
            <p>The project utilizes a variety of modern technologies and tools to ensure an efficient and user-friendly experience:</p>
            <ul>
                <li><strong>Frontend:</strong> React.js for building a responsive and dynamic user interface.</li>
                <li><strong>Backend:</strong> Node.js and Express.js to manage server-side operations and handle API requests.</li>
                <li><strong>Database:</strong> MongoDB for storing user profiles, career assessments, test results, and job listings.</li>
                <li><strong>Deployment:</strong> Deployed on cloud platforms like AWS or Heroku to ensure scalability and availability.</li>
            </ul>

            <h2>Project Goals</h2>
            <p>The main goal of this project is to assist students in making informed career decisions by providing them with tools for self-assessment, skills development, and personalized recommendations. Additionally, it aims to connect students with real-world job opportunities and resources to help them achieve career success.</p>
        </div>

        <!-- Team Section -->
        <div class="team-section">
            <h2>Meet the Team</h2>
            <div class="team-cards">
                <!-- Team Member 1 -->
                <div class="team-card">
                    <img src="Tinish.jpg" alt="Team Member 1">
                    <h3>TANISH GUPTA</h3>
                    <p>Project Lead - Responsible for overseeing the entire project and ensuring timely delivery.</p>
                </div>
                <!-- Team Member 2 -->
                <div class="team-card">
                    <img src="vivek.jpg" alt="Team Member 2">
                    <h3> SAI VIVEK</h3>
                    <p>Frontend Developer - Designs and develops user-friendly interfaces using JSP integrated with HTML, CSS, and JavaScript, ensuring a responsive and dynamic user experience.</p>
                </div>
                <!-- Team Member 3 -->
                <div class="team-card">
                    <img src="mani.jpg" alt="Team Member 3">
                    <h3>SAI MANI</h3>
                    
                    <p>Backend Developer - Manages the server-side logic and database integration using Spring Boot and MySQL to create robust and scalable backend systems..</p>
                </div>
            </div>
        </div>

    </div>

    <footer>
        <div class="social-media">
            <a href="https://www.facebook.com/batchala.saivivek/" target="_blank" title="Facebook">
                <i class="fab fa-facebook-f"></i>
            </a>
            <a href="https://x.com/sai_vivek04" target="_blank" title="Twitter">
                <i class="fab fa-twitter"></i>
            </a>
            <a href="https://www.linkedin.com/in/sai-vivek-batchala-06595628a/" target="_blank" title="LinkedIn">
                <i class="fab fa-linkedin-in"></i>
            </a>
            <a href="https://www.instagram.com/your-profile" target="_blank" title="Instagram">
                <i class="fab fa-instagram"></i>
            </a>
        </div>
        <p>&copy; 2024 Career Management System. All Rights Reserved.</p>
    </footer>

</body>
</html>
