<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Last 5 Test Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        .table th {
            background-color: #f1f3f5;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <h1 class="text-center mb-5">
            <i class="fas fa-chart-line me-2"></i>Last 5 Test Results
        </h1>
        
        <div class="row">
            <div class="col-md-8">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Results Table</h5>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Test Name</th>
                                    <th>Date</th>
                                    <th>Score</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    // Mock test data for the last 5 tests
                                    String[] testNames = {"C Programming Basics", "Data Structures", "Algorithms", "Object-Oriented Programming", "Web Development"};
                                    String[] testDates = {"2024-12-05", "2024-12-04", "2024-12-03", "2024-12-02", "2024-12-01"};
                                    int[] scores = {7, 5, 8, 6, 9}; // Out of 10
                                    
                                    for (int i = 0; i < 5; i++) {
                                %>
                                <tr>
                                    <td><%= testNames[i] %></td>
                                    <td><%= testDates[i] %></td>
                                    <td><%= scores[i] %>/10</td>
                                    <td>
                                        <a href="testDetails.jsp?test=<%= i + 1 %>" class="btn btn-sm btn-outline-primary">
                                            <i class="fas fa-eye me-1"></i>View Details
                                        </a>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Score Trend</h5>
                        <canvas id="scoreChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Chart
        var ctx = document.getElementById('scoreChart').getContext('2d');
        var scoreChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Test 5', 'Test 4', 'Test 3', 'Test 2', 'Test 1'],
                datasets: [{
                    label: 'Score',
                    data: [9, 6, 8, 5, 7],
                    borderColor: 'rgba(75, 192, 192, 1)',
                    tension: 0.1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 10
                    }
                }
            }
        });

        // Sorting
        function sortTable(n) {
            var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
            table = document.querySelector("table");
            switching = true;
            dir = "asc";
            while (switching) {
                switching = false;
                rows = table.rows;
                for (i = 1; i < (rows.length - 1); i++) {
                    shouldSwitch = false;
                    x = rows[i].getElementsByTagName("TD")[n];
                    y = rows[i + 1].getElementsByTagName("TD")[n];
                    if (dir == "asc") {
                        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    } else if (dir == "desc") {
                        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    }
                }
                if (shouldSwitch) {
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                    switchcount++;
                } else {
                    if (switchcount == 0 && dir == "asc") {
                        dir = "desc";
                        switching = true;
                    }
                }
            }
        }

        // Add click event to table headers for sorting
        document.querySelectorAll('th').forEach((header, index) => {
            header.addEventListener('click', () => sortTable(index));
            header.style.cursor = 'pointer';
        });
    </script>
</body>
</html>