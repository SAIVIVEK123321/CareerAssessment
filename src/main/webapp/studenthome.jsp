<%@page import="org.hibernate.Session"%>
<%@page import="com.klef.jfsd.project.StudentCarrerProject.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    // Retrieve the student object from the session
    Student student = (Student) session.getAttribute("student"); 
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard - Career Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f2f5;
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 2rem;
        }
        .dashboard-header {
            background: linear-gradient(135deg, #1a237e, #3949ab);
            color: white;
            padding: 2rem;
            border-radius: 10px;
            margin-bottom: 2rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .profile-summary {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }
        .profile-pic {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 1.5rem;
            border: 3px solid white;
        }
        .progress-section {
            background-color: white;
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .progress {
            height: 10px;
            border-radius: 5px;
        }
        .nav-card {
            background-color: white;
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 1rem;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .nav-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .nav-card i {
            font-size: 2rem;
            margin-bottom: 1rem;
            color: #1a237e;
        }
        .error-message {
            background-color: #ffcdd2;
            color: #d32f2f;
            padding: 1rem;
            border-radius: 5px;
            text-align: center;
            margin-top: 2rem;
        }
    </style>
</head>
<body>
    <%@include file="studentrnav.jsp" %>

    <div class="container">
        <% if (student != null) { %>
            <div class="dashboard-header">
                <div class="profile-summary">
                    <img src="https://via.placeholder.com/80" alt="<%= student.getName() %>'s profile picture" class="profile-pic">
                    <div>
                        <h2 class="mb-0">Welcome, <%= student.getName() %>!</h2>
                        <p class="mb-0">Student ID: <%= student.getId() %> | Email: <%= student.getEmail() %></p>
                    </div>
                </div>
                <p class="mt-3 mb-0">Let's continue your journey to career success.</p>
            </div>

            <div class="progress-section">
                <h3>Your Career Journey Progress</h3>
                <div class="progress">
                    <div class="progress-bar bg-primary" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="careerProgress"></div>
                </div>
                <p class="text-center mt-2 mb-0" id="progressText">Loading your progress...</p>
            </div>

            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="nav-card text-center">
                        <i class="fas fa-clipboard-list"></i>
                        <h3>Career Assessment</h3>
                        <p>Discover your strengths and potential career paths.</p>
                        <a href="takeAssessment.jsp" class="btn btn-primary">Take Assessment</a>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="nav-card text-center">
                        <i class="fas fa-chart-bar"></i>
                        <h3>View Results</h3>
                        <p>Analyze your assessment results and get insights.</p>
                        <a href="viewResults.jsp" class="btn btn-primary">See Results</a>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="nav-card text-center">
                        <i class="fas fa-compass"></i>
                        <h3>Explore Careers</h3>
                        <p>Learn about various career options suited for you.</p>
                        <a href="exploreCareers.jsp" class="btn btn-primary">Explore Options</a>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="nav-card text-center">
                        <i class="fas fa-book"></i>
                        <h3>Learning Resources</h3>
                        <p>Access materials to enhance your skills.</p>
                        <a href="learningResources.jsp" class="btn btn-primary">Start Learning</a>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="nav-card text-center">
                        <i class="fas fa-users"></i>
                        <h3>Mentorship</h3>
                        <p>Connect with industry professionals for guidance.</p>
                        <a href="mentorship.jsp" class="btn btn-primary">Find a Mentor</a>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="nav-card text-center">
                        <i class="fas fa-briefcase"></i>
                        <h3>Job Board</h3>
                        <p>Explore internships and job opportunities.</p>
                        <a href="jobBoard.jsp" class="btn btn-primary">View Opportunities</a>
                    </div>
                </div>
            </div>
        <% } else { %>
            <div class="error-message">
                <i class="fas fa-exclamation-triangle me-2"></i>
                Session expired or student data not found. Please log in again.
            </div>
        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Simulate career progress (replace with actual data in production)
        window.onload = function() {
            let progress = Math.floor(Math.random() * 100);
            let progressBar = document.getElementById('careerProgress');
            let progressText = document.getElementById('progressText');
            
            progressBar.style.width = progress + '%';
            progressBar.setAttribute('aria-valuenow', progress);
            
            progressText.textContent = `You've completed ${progress}% of your career journey!`;
            
            if (progress < 33) {
                progressBar.classList.add('bg-info');
                progressText.textContent += " Keep going!";
            } else if (progress < 66) {
                progressBar.classList.add('bg-success');
                progressText.textContent += " You're making great progress!";
            } else {
                progressBar.classList.add('bg-warning');
                progressText.textContent += " You're almost there!";
            }
        }
    </script>
</body>
</html>