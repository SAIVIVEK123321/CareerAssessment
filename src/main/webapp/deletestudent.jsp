<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management - Career Management System</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --accent-color: #e74c3c;
            --background-color: #ecf0f1;
            --text-color: #34495e;
        }
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
        }
        .dashboard-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .dashboard-title {
            font-size: 2.5rem;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        .table-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            padding: 2rem;
            margin-bottom: 2rem;
        }
        .table thead th {
            background-color: var(--secondary-color);
            color: white;
            border: none;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(52, 152, 219, 0.05);
        }
        .table-hover tbody tr:hover {
            background-color: rgba(52, 152, 219, 0.1);
            transition: background-color 0.3s ease;
        }
        .btn-delete {
            color: #fff;
            background-color: var(--accent-color);
            border-color: var(--accent-color);
        }
        .btn-delete:hover {
            background-color: #c0392b;
            border-color: #c0392b;
        }
        .btn-print {
            color: #fff;
            background-color: #27ae60;
            border-color: #27ae60;
        }
        .btn-print:hover {
            background-color: #2ecc71;
            border-color: #2ecc71;
        }
        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .table td, .table th {
            vertical-align: middle;
        }
        @media print {
            .no-print { display: none !important; }
            .table-container { box-shadow: none; }
            .table thead th {
                background-color: #f8f9fa !important;
                color: #000 !important;
            }
            body { background-color: white; }
            .dashboard-header {
                background: none;
                color: #000;
                padding: 1rem 0;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="adminnavbar.jsp" />
    
    <header class="dashboard-header">
        <div class="container">
            <h1 class="dashboard-title text-center fade-in">
                <i class="fas fa-user-graduate mr-2"></i>Student Management
            </h1>
        </div>
    </header>

    <div class="container fade-in">
        <div class="table-container">
            <div class="row mb-4">
                <div class="col-md-6">
                    <h2><i class="fas fa-list mr-2"></i>Student List</h2>
                </div>
                <div class="col-md-6 text-md-right">
                    <button onclick="window.print()" class="btn btn-print no-print">
                        <i class="fas fa-print mr-2"></i>Print List
                    </button>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><i class="fas fa-id-badge mr-2"></i>ID</th>
                            <th><i class="fas fa-user mr-2"></i>Name</th>
                            <th><i class="fas fa-venus-mars mr-2"></i>Gender</th>
                            <th><i class="fas fa-birthday-cake mr-2"></i>Date of Birth</th>
                            <th><i class="fas fa-map-marker-alt mr-2"></i>Location</th>
                            <th><i class="fas fa-phone mr-2"></i>Contact No</th>
                            <th><i class="fas fa-envelope mr-2"></i>Email</th>
                            <th class="no-print"><i class="fas fa-cogs mr-2"></i>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${studentlist}" var="student">
                            <tr>
                                <td><c:out value="${student.id}"/></td>
                                <td><c:out value="${student.name}"/></td>
                                <td><c:out value="${student.gender}"/></td>
                                <td><c:out value="${student.dataofbirth}"/></td>
                                <td><c:out value="${student.location}"/></td>
                                <td><c:out value="${student.contact}"/></td>
                                <td><c:out value="${student.email}"/></td>
                                <td class="no-print">
                                    <a href="<c:url value='delete?id=${student.id}'/>" class="btn btn-delete btn-sm" 
                                       onclick="return confirm('Are you sure you want to delete this student?');">
                                        <i class="fas fa-trash-alt mr-1"></i>Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            // Add fade-in effect to table rows
            $('tbody tr').each(function(index) {
                $(this).css('animation-delay', (index * 0.1) + 's');
                $(this).addClass('fade-in');
            });
        });
    </script>
</body>
</html>