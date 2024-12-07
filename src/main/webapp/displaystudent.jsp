<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details - Career Management System</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .student-header {
            background: linear-gradient(135deg, #007bff, #0056b3);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
        }
        .student-title {
            font-size: 2.5rem;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        .student-info {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            padding: 2rem;
        }
        .info-item {
            margin-bottom: 1rem;
        }
        .info-label {
            font-weight: bold;
            color: #007bff;
        }
        .btn-back {
            margin-top: 1rem;
        }
    </style>
</head>
<body>
    <jsp:include page="adminnavbar.jsp" />
    
    <header class="student-header">
        <div class="container">
            <h1 class="student-title text-center">
                <i class="fas fa-user-graduate mr-2"></i>Student Details
            </h1>
        </div>
    </header>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="student-info">
                    <div class="info-item">
                        <span class="info-label"><i class="fas fa-id-badge mr-2"></i>ID:</span>
                        <c:out value="${c.id}"/>
                    </div>
                    <div class="info-item">
                        <span class="info-label"><i class="fas fa-user mr-2"></i>Name:</span>
                        <c:out value="${c.name}"/>
                    </div>
                    <div class="info-item">
                        <span class="info-label"><i class="fas fa-venus-mars mr-2"></i>Gender:</span>
                        <c:out value="${c.gender}"/>
                    </div>
                    <div class="info-item">
                        <span class="info-label"><i class="fas fa-birthday-cake mr-2"></i>Date of Birth:</span>
                        <c:out value="${c.dataofbirth}"/>
                    </div>
                    <div class="info-item">
                        <span class="info-label"><i class="fas fa-envelope mr-2"></i>Email:</span>
                        <c:out value="${c.email}"/>
                    </div>
                    <div class="info-item">
                        <span class="info-label"><i class="fas fa-map-marker-alt mr-2"></i>Location:</span>
                        <c:out value="${c.location}"/>
                    </div>
                    <div class="info-item">
                        <span class="info-label"><i class="fas fa-phone mr-2"></i>Contact:</span>
                        <c:out value="${c.contact}"/>
                    </div>
                    
                    <a href="<c:url value='viewstudentbyid'/>" class="btn btn-primary btn-back">
                        <i class="fas fa-arrow-left mr-2"></i>Back to Dashboard
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>