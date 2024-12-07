<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/1.6.5/css/buttons.bootstrap4.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .dashboard-header {
            background: linear-gradient(135deg, #007bff, #0056b3);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
        }
        .dashboard-title {
            font-size: 2.5rem;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        .stats-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 1.5rem;
            margin-bottom: 2rem;
            transition: transform 0.3s ease;
        }
        .stats-card:hover {
            transform: translateY(-5px);
        }
        .stats-icon {
            font-size: 2.5rem;
            color: #007bff;
        }
        .table-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            padding: 2rem;
            margin: 0 auto;
            width: 95%;
        }
        .table thead th {
            background-color: #007bff;
            color: white;
            border-color: #0056b3;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0,123,255,0.05);
        }
        .table-hover tbody tr:hover {
            background-color: rgba(0,123,255,0.1);
        }
        .action-buttons .btn {
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
        }
        .search-box {
            margin-bottom: 1.5rem;
        }
        footer {
            margin-top: auto;
            background-color: #343a40;
            color: white;
            padding: 1rem 0;
        }
        .loading-spinner {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 1000;
        }
        .error-message {
            display: none;
            background-color: #dc3545;
            color: white;
            padding: 1rem;
            border-radius: 4px;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <jsp:include page="adminnavbar.jsp" />
    
    <!-- Loading Spinner -->
    <div class="loading-spinner">
        <div class="spinner-border text-primary" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>

    <!-- Error Message -->
    <div class="error-message" id="errorMessage">
        An error occurred while loading the data. Please try again.
    </div>

    <header class="dashboard-header">
        <div class="container">
            <h1 class="dashboard-title text-center">
                <i class="fas fa-user-graduate mr-2"></i>Student Management Dashboard
            </h1>
        </div>
    </header>

    <!-- Statistics Cards -->
    <div class="container mb-4">
        <div class="row">
            <div class="col-md-3">
                <div class="stats-card text-center">
                    <i class="fas fa-users stats-icon mb-3"></i>
                    <h3 class="mb-2">${studentList.size()}</h3>
                    <p class="text-muted mb-0">Total Students</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card text-center">
                    <i class="fas fa-male stats-icon mb-3"></i>
                    <h3 class="mb-2">${maleCount}</h3>
                    <p class="text-muted mb-0">Male Students</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card text-center">
                    <i class="fas fa-female stats-icon mb-3"></i>
                    <h3 class="mb-2">${femaleCount}</h3>
                    <p class="text-muted mb-0">Female Students</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card text-center">
                    <i class="fas fa-map-marker-alt stats-icon mb-3"></i>
                    <h3 class="mb-2">${locationCount}</h3>
                    <p class="text-muted mb-0">Unique Locations</p>
                </div>
            </div>
        </div>
    </div>

    <div class="table-container">
        <div class="row mb-4">
            <div class="col">
                <h2><i class="fas fa-list mr-2"></i>All Students</h2>
            </div>
            <div class="col text-right">
                <div class="btn-group">
                    <button class="btn btn-success mr-2" data-toggle="modal" data-target="#addStudentModal">
                        <i class="fas fa-plus mr-2"></i>Add New Student
                    </button>
                    <button class="btn btn-primary" onclick="window.print()">
                        <i class="fas fa-print mr-2"></i>Print Report
                    </button>
                </div>
            </div>
        </div>
        <div class="table-responsive">
            <table id="studentTable" class="table table-striped table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th><i class="fas fa-id-badge mr-2"></i>ID</th>
                        <th><i class="fas fa-user mr-2"></i>Name</th>
                        <th><i class="fas fa-venus-mars mr-2"></i>Gender</th>
                        <th><i class="fas fa-birthday-cake mr-2"></i>Date of Birth</th>
                        <th><i class="fas fa-map-marker-alt mr-2"></i>Location</th>
                        <th><i class="fas fa-phone mr-2"></i>Contact No</th>
                        <th><i class="fas fa-envelope mr-2"></i>Email</th>
                        <th><i class="fas fa-cogs mr-2"></i>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${studentList}" var="student">
                        <tr>
                            <td><c:out value="${student.id}"/></td>
                            <td><c:out value="${student.name}"/></td>
                            <td><c:out value="${student.gender}"/></td>
                            <td><c:out value="${student.dataofbirth}"/></td>
                            <td><c:out value="${student.location}"/></td>
                            <td><c:out value="${student.contact}"/></td>
                            <td><c:out value="${student.email}"/></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-info btn-sm" onclick="editStudent(${student.id})">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-danger btn-sm" onclick="deleteStudent(${student.id})">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                    <button class="btn btn-success btn-sm" onclick="viewDetails(${student.id})">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Footer -->
    <footer class="mt-5">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <p style="color: blue;">&copy; <%= java.time.Year.now().getValue() %> Student Management System</p>
                </div>
                <div class="col-md-6 text-right">
                    <p style="color: blue;">Last updated: <%= new java.util.Date() %></p>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.5/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.bootstrap4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.print.min.js"></script>

    <script>
        $(document).ready(function() {
            // Initialize DataTable with export buttons
            $('#studentTable').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ],
                pageLength: 10,
                responsive: true
            });

            // Show loading spinner
            $('.loading-spinner').show();

            // Simulate loading delay
            setTimeout(function() {
                $('.loading-spinner').hide();
            }, 500);
        });

        function editStudent(id) {
            // Implement edit functionality
            alert('Edit student with ID: ' + id);
        }

        function deleteStudent(id) {
            if(confirm('Are you sure you want to delete this student?')) {
                // Implement delete functionality
                alert('Delete student with ID: ' + id);
            }
        }

        function viewDetails(id) {
            // Implement view details functionality
            alert('View details of student with ID: ' + id);
        }

        // Error handling example
        window.onerror = function() {
            document.getElementById('errorMessage').style.display = 'block';
            setTimeout(function() {
                document.getElementById('errorMessage').style.display = 'none';
            }, 5000);
        };
    </script>
</body>
</html>