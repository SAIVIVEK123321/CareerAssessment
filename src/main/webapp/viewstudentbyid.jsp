<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Student by ID - Career Management System</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .page-header {
            background: linear-gradient(135deg, #007bff, #0056b3);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
        }
        .page-title {
            font-size: 2.5rem;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        .form-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            padding: 2rem;
        }
        .btn-view {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-view:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
    </style>
</head>
<body>
    <jsp:include page="adminnavbar.jsp" />
    
    <header class="page-header">
        <div class="container">
            <h1 class="page-title text-center">
                <i class="fas fa-search mr-2"></i>View Student by ID
            </h1>
        </div>
    </header>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="form-container">
                    <form method="post" action="displaystudent">
                        <div class="form-group">
                            <label for="studentId"><i class="fas fa-id-badge mr-2"></i>Select Student ID:</label>
                            <select class="form-control" id="studentId" name="id" required>
                                <option value="">---Select---</option>
                                <c:forEach items="${studentlist}" var="student">
                                    <option value="${student.id}">${student.id} - ${student.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-view btn-lg">
                                <i class="fas fa-eye mr-2"></i>View Student
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>