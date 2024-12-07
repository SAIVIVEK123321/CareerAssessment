<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.stream.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assessment Results | Career Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin-top: 30px;
            margin-bottom: 30px;
            padding: 30px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        .score-card {
            background-color: #f1f3f5;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            border-left: 5px solid #007bff;
        }
        .score-title {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 10px;
            color: #007bff;
        }
        .progress {
            height: 25px;
            border-radius: 15px;
        }
        .progress-bar {
            border-radius: 15px;
        }
        .btn-action {
            text-transform: uppercase;
            font-weight: bold;
            padding: 12px 30px;
            border-radius: 30px;
            transition: all 0.3s ease;
        }
        .btn-action:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.3);
        }
        .recommendations {
            background-color: #e9ecef;
            border-radius: 10px;
            padding: 20px;
            margin-top: 30px;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }
    </style>
</head>
<body>
    <div class="container fade-in">
        <h2 class="text-center mb-4">Assessment Results</h2>

        <%-- Processing submitted data --%>
        <%
            Map<String, String[]> parameterMap = request.getParameterMap();
            Map<String, Integer> scores = new HashMap<>();
            scores.put("C", 0);
            scores.put("Java", 0);
            scores.put("Spring Boot", 0);
            scores.put("Python", 0);

            int totalQuestions = 0;
            int totalCorrect = 0;

            try {
                for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
                    String key = entry.getKey();
                    if (key.startsWith("answer_")) {
                        totalQuestions++;
                        String[] values = entry.getValue();
                        if (values != null && values.length > 0) {
                            int answerId = Integer.parseInt(values[0]);
                            // Assume correct answers are stored in session or database
                            // For demo purposes, let's assume all answers with odd IDs are correct
                            if (answerId % 2 != 0) {
                                totalCorrect++;
                                if (key.startsWith("answer_c_")) {
                                    scores.put("C", scores.get("C") + 1);
                                } else if (key.startsWith("answer_java_")) {
                                    scores.put("Java", scores.get("Java") + 1);
                                } else if (key.startsWith("answer_spring_")) {
                                    scores.put("Spring Boot", scores.get("Spring Boot") + 1);
                                } else if (key.startsWith("answer_python_")) {
                                    scores.put("Python", scores.get("Python") + 1);
                                }
                            }
                        }
                    }
                }
            } catch (Exception e) {
                out.println("<div class='alert alert-danger'>An error occurred: " + e.getMessage() + "</div>");
            }

            double overallPercentage = (double) totalCorrect / totalQuestions * 100;
        %>

        <%-- Displaying overall score --%>
        <div class="score-card">
            <div class="score-title">Overall Score</div>
            <div class="progress">
                <div class="progress-bar bg-success" role="progressbar" style="width: <%= overallPercentage %>%;" 
                     aria-valuenow="<%= overallPercentage %>" aria-valuemin="0" aria-valuemax="100">
                    <%= String.format("%.2f%%", overallPercentage) %>
                </div>
            </div>
            <p class="mt-2">You answered <%= totalCorrect %> out of <%= totalQuestions %> questions correctly.</p>
        </div>

        <%-- Displaying individual subject scores --%>
        <% for (Map.Entry<String, Integer> entry : scores.entrySet()) { %>
            <div class="score-card">
                <div class="score-title"><%= entry.getKey() %></div>
                <% 
                int subjectQuestions = totalQuestions / 4; // Assuming equal distribution
                double subjectPercentage = (double) entry.getValue() / subjectQuestions * 100;
                String barColor = subjectPercentage >= 80 ? "bg-success" : 
                                  subjectPercentage >= 60 ? "bg-primary" : 
                                  subjectPercentage >= 40 ? "bg-warning" : "bg-danger";
                %>
                <div class="progress">
                    <div class="progress-bar <%= barColor %>" role="progressbar" style="width: <%= subjectPercentage %>%;" 
                         aria-valuenow="<%= subjectPercentage %>" aria-valuemin="0" aria-valuemax="100">
                        <%= String.format("%.2f%%", subjectPercentage) %>
                    </div>
                </div>
                <p class="mt-2">You answered <%= entry.getValue() %> out of <%= subjectQuestions %> questions correctly.</p>
            </div>
        <% } %>

        <%-- Recommendations based on score --%>
        <div class="recommendations">
            <h4 class="mb-3">Recommendations</h4>
            <% if (overallPercentage >= 80) { %>
                <p class="text-success"><i class="fas fa-trophy me-2"></i>Excellent work! You have a strong grasp of the subjects. Consider exploring advanced topics or real-world projects to further enhance your skills.</p>
            <% } else if (overallPercentage >= 60) { %>
                <p class="text-primary"><i class="fas fa-thumbs-up me-2"></i>Good job! You have a solid foundation. Focus on the areas where you scored lower to improve your overall understanding.</p>
            <% } else { %>
                <p class="text-warning"><i class="fas fa-lightbulb me-2"></i>You're on the right track. Consider revisiting the fundamentals and practicing more to strengthen your knowledge in all areas.</p>
            <% } %>
            
            <h5 class="mt-4 mb-3">Subject-specific Advice:</h5>
            <ul>
                <% for (Map.Entry<String, Integer> entry : scores.entrySet()) { 
                    int subjectQuestions = totalQuestions / 4;
                    double subjectPercentage = (double) entry.getValue() / subjectQuestions * 100;
                %>
                    <li>
                        <strong><%= entry.getKey() %>:</strong>
                        <% if (subjectPercentage >= 80) { %>
                            Consider advanced topics or certification in <%= entry.getKey() %>.
                        <% } else if (subjectPercentage >= 60) { %>
                            Review challenging concepts and practice more <%= entry.getKey() %> problems.
                        <% } else { %>
                            Focus on strengthening your <%= entry.getKey() %> fundamentals through tutorials and exercises.
                        <% } %>
                    </li>
                <% } %>
            </ul>
        </div>

        <%-- Action buttons --%>
        <div class="d-grid gap-2 mt-4">
            <a href="takeAssessment.jsp" class="btn btn-primary btn-action">
                <i class="fas fa-redo me-2"></i>Retake Assessment
            </a>
            <a href="exploreCareers.jsp" class="btn btn-success btn-action">
                <i class="fas fa-search me-2"></i>Explore Careers
            </a>
            <a href="dashboard" class="btn btn-secondary btn-action">
                <i class="fas fa-home me-2"></i>Return to Dashboard
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>