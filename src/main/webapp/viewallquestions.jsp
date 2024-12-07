<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Question Management - Career Management System</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .dashboard-header {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
        }
        .dashboard-title {
            font-size: 2.5rem;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        .table-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            padding: 2rem;
            margin-bottom: 2rem;
        }
        .table thead th {
            background-color: #6a11cb;
            color: white;
            border: none;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(106, 17, 203, 0.05);
        }
        .btn-action {
            padding: 0.375rem 0.75rem;
            border-radius: 0.25rem;
            font-size: 0.875rem;
            margin: 0 0.25rem;
        }
        .btn-update {
            color: #fff;
            background-color: #17a2b8;
            border-color: #17a2b8;
        }
        .btn-delete {
            color: #fff;
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .filter-section {
            margin-bottom: 2rem;
        }
        @media print {
            .no-print {
                display: none !important;
            }
            .table-container {
                box-shadow: none;
            }
            .table thead th {
                background-color: #f8f9fa !important;
                color: #000 !important;
            }
            body {
                background-color: white;
            }
        }
    </style>
</head>
<body>
    <header class="dashboard-header">
        <div class="container">
            <h1 class="dashboard-title text-center">
                <i class="fas fa-question-circle mr-2"></i>Question Management
            </h1>
        </div>
    </header>

    <div class="container">
        <div class="filter-section no-print">
            <button class="btn btn-secondary" onclick="window.location.href='/adminhome'">
                <i class="fas fa-arrow-left mr-2"></i>Back to Admin Home
            </button>
        </div>

        <div class="table-container">
            <div class="filter-section no-print">
                <div class="row mb-4">
                    <div class="col-md-3">
                        <select class="form-control" id="categoryFilter">
                            <option value="">All Categories</option>
                            <c:forEach items="${categories}" var="category">
                                <option value="${category}">${category}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <select class="form-control" id="difficultyFilter">
                            <option value="">All Difficulty Levels</option>
                            <option value="Easy">Easy</option>
                            <option value="Medium">Medium</option>
                            <option value="Hard">Hard</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <input type="text" class="form-control" id="searchInput" placeholder="Search questions...">
                    </div>
                    <div class="col-md-2">
                        <button onclick="window.print()" class="btn btn-primary btn-block">
                            <i class="fas fa-print mr-2"></i>Print
                        </button>
                    </div>
                </div>
            </div>

            <div class="table-responsive">
                <table id="questionsTable" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Question Title</th>
                            <th>Option A</th>
                            <th>Option B</th>
                            <th>Option C</th>
                            <th>Option D</th>
                            <th>Right Answer</th>
                            <th>Difficulty</th>
                            <th>Category</th>
                            <th class="no-print">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${questionList}" var="question">
                            <tr>
                                <td><c:out value="${question.id}" /></td>
                                <td><c:out value="${question.questionTitle}" /></td>
                                <td><c:out value="${question.option1}" /></td>
                                <td><c:out value="${question.option2}" /></td>
                                <td><c:out value="${question.option3}" /></td>
                                <td><c:out value="${question.option4}" /></td>
                                <td><c:out value="${question.rightAnswer}" /></td>
                                <td><c:out value="${question.difficultlevel}" /></td>
                                <td><c:out value="${question.category}" /></td>
                                <td class="no-print">
                                    <a href="/updateQuestion.jsp" class="btn btn-update btn-action">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button onclick="deleteQuestion(${question.id})" class="btn btn-delete btn-action">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function() {
            var table = $('#questionsTable').DataTable({
                "pageLength": 10,
                "order": [[ 0, "desc" ]],
                "language": {
                    "search": "Search:",
                    "lengthMenu": "Show MENU entries per page",
                    "info": "Showing START to END of TOTAL questions"
                }
            });

            // Category filter
            $('#categoryFilter').on('change', function() {
                table.column(8).search(this.value).draw();
            });

            // Difficulty filter
            $('#difficultyFilter').on('change', function() {
                table.column(7).search(this.value).draw();
            });

            // Search input
            $('#searchInput').on('keyup', function() {
                table.search(this.value).draw();
            });
        });

        function deleteQuestion(id) {
            if (confirm("Are you sure you want to delete this question?")) {
                fetch("/delete/" + id, {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                .then(response => {
                    if (response.ok) {
                        alert("Question deleted successfully");
                        location.reload();
                    } else {
                        alert("Error deleting question");
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert("Error deleting question");
                });
            }
        }
    </script>
</body>
</html>