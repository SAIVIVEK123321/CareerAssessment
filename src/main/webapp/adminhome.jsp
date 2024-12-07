<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Career Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2980b9;
            --accent-color: #e74c3c;
            --background-color: #ecf0f1;
            --text-color: #34495e;
            --card-bg: #ffffff;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .navbar {
            background-color: var(--primary-color);
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .navbar-brand, .nav-link {
            color: #ffffff !important;
        }
        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba(255, 255, 255, 0.85)' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
        }
        .container {
            flex: 1;
            padding: 2rem 0;
        }
        .dashboard-header {
            text-align: center;
            margin-bottom: 2rem;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .dashboard-title {
            color: var(--primary-color);
            font-weight: bold;
            margin-bottom: 1rem;
        }
        .dashboard-subtitle {
            color: var(--text-color);
            font-size: 1.2rem;
        }
        .card {
            background-color: var(--card-bg);
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        .card-title {
            color: var(--primary-color);
            font-weight: bold;
        }
        .card-text {
            color: var(--text-color);
        }
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
            transform: translateY(-2px);
        }
        .footer {
            background-color: var(--primary-color);
            color: #ffffff;
            text-align: center;
            padding: 1rem 0;
            margin-top: auto;
        }
        .stats {
            background-color: var(--card-bg);
            border-radius: 10px;
            padding: 1rem;
            margin-bottom: 2rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .stats-item {
            text-align: center;
        }
        .stats-number {
            font-size: 2rem;
            font-weight: bold;
            color: var(--primary-color);
        }
        .stats-label {
            color: var(--text-color);
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="fas fa-user-shield me-2"></i>Admin Dashboard
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/viewallstudent'/>">
                            <i class="fas fa-users me-1"></i>View Students
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/addQuestion.jsp'/>">
                            <i class="fas fa-question-circle me-1"></i>Add Question
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/adminlogin'/>">
                            <i class="fas fa-sign-out-alt me-1"></i>Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <header class="dashboard-header">
            <h1 class="dashboard-title">Welcome to the Admin Dashboard</h1>
            <p class="dashboard-subtitle">Manage and oversee the Career Management System efficiently</p>
        </header>

        <div class="stats mb-4">
            <div class="row">
                <div class="col-md-3 stats-item">
                    <div class="stats-number">${totalStudents}</div>
                    <div class="stats-label">Total Students</div>
                </div>
                <div class="col-md-3 stats-item">
                    <div class="stats-number">${totalQuestions}</div>
                    <div class="stats-label">Total Questions</div>
                </div>
                <div class="col-md-3 stats-item">
                    <div class="stats-number">${activeAssessments}</div>
                    <div class="stats-label">Active Assessments</div>
                </div>
                <div class="col-md-3 stats-item">
                    <div class="stats-number">${completedAssessments}</div>
                    <div class="stats-label">Completed Assessments</div>
                </div>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-users fa-3x mb-3" style="color: var(--primary-color);"></i>
                        <h5 class="card-title">Manage Students</h5>
                        <p class="card-text">View, edit, and manage student profiles and their progress.</p>
                        <a href="<c:url value='/viewallstudent'/>" class="btn btn-primary">View Students</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-question-circle fa-3x mb-3" style="color: var(--primary-color);"></i>
                        <h5 class="card-title">Manage Questions</h5>
                        <p class="card-text">Add, edit, or remove questions from the assessment pool.</p>
                        <a href="<c:url value='/addQuestion.jsp'/>" class="btn btn-primary">Add Question</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-chart-line fa-3x mb-3" style="color: var(--primary-color);"></i>
                        <h5 class="card-title">System Analytics</h5>
                        <p class="card-text">View system statistics and performance metrics.</p>
                        <a href="<c:url value='/analytics'/>" class="btn btn-primary">View Analytics</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="footer mt-5">
        <div class="container">
            <p>&copy; <fmt:formatDate value="<%= new java.util.Date() %>" pattern="yyyy" /> Career Management System | Admin Dashboard</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            console.log('Welcome to the Admin Dashboard');
            
            // Add smooth scrolling to all links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    document.querySelector(this.getAttribute('href')).scrollIntoView({
                        behavior: 'smooth'
                    });
                });
            });

            // Add hover effect to cards
            document.querySelectorAll('.card').forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-10px)';
                });
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0)';
                });
            });
        });
    </script>
</body>
</html>