<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1 class="text-center my-4">Test Details</h1>
        
        <%
            // Simulate retrieving test data based on the selected test
            int testNumber = Integer.parseInt(request.getParameter("test"));
            String[] questions = {
                "1. What is the correct syntax to declare a pointer in C?",
                "2. What is the size of a float in C?",
                "3. Which operator is used for modulus operation?",
                "4. What does the break statement do?",
                "5. Which function is used to scan input in C?",
                "6. How do you allocate dynamic memory in C?",
                "7. What is the output of printf(\"%d\", 5 + 3);?",
                "8. Which of the following is a valid keyword in C?",
                "9. How do you declare a constant in C?",
                "10. What is the output of: int a=10; printf(\"%d\", a/5);?"
            };

            String[] correctAnswers = {"A", "A", "B", "C", "B", "A", "D", "C", "A", "B"};
            String[] solutions = {
                "Pointers are declared using * operator.",
                "float occupies 4 bytes in most systems.",
                "Modulus operator is %.",
                "Break statement exits the loop immediately.",
                "scanf() is used to take user input.",
                "malloc() dynamically allocates memory.",
                "5 + 3 equals 8.",
                "int is a valid keyword.",
                "const is used to declare constants.",
                "10 divided by 5 equals 2."
            };

            // Simulate user answers for the selected test
            String[] userAnswers = new String[10];
            String[] options = {"A", "B", "C", "D"};
            java.util.Random rand = new java.util.Random();
            int correctCount = 0;

            for (int i = 0; i < 10; i++) {
                if (rand.nextBoolean()) {
                    userAnswers[i] = correctAnswers[i];
                    correctCount++;
                } else {
                    do {
                        userAnswers[i] = options[rand.nextInt(4)];
                    } while (userAnswers[i].equals(correctAnswers[i]));
                }
            }
        %>
        
        <h3>Test <%= testNumber %> - Score: <%= correctCount %>/10</h3>
        <table class="table table-bordered mt-4">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Question</th>
                    <th>Your Answer</th>
                    <th>Correct Answer</th>
                    <th>Solution</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (int i = 0; i < 10; i++) {
                        boolean isCorrect = userAnswers[i].equals(correctAnswers[i]);
                %>
                <tr>
                    <td><%= i + 1 %></td>
                    <td><%= questions[i] %></td>
                    <td><%= userAnswers[i] %></td>
                    <td><%= correctAnswers[i] %></td>
                    <td><%= solutions[i] %></td>
                    <td>
                        <span class="badge <%= isCorrect ? "badge-success" : "badge-danger" %>">
                            <%= isCorrect ? "Correct" : "Wrong" %>
                        </span>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>