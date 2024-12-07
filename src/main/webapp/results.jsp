<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assessment Results</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1 class="text-center my-4"><i class="fas fa-clipboard-check mr-2"></i>Assessment Results</h1>
        <h3>Review your answers:</h3>
        
        <%
            // Correct answers for reference
            String[] correctAnswers = {"A", "A", "B", "C", "B", "A", "D", "C", "A", "B"};
            String[] userAnswers = new String[10];
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

            // Generate at least 5 correct answers
            String[] options = {"A", "B", "C", "D"};
            java.util.Set<Integer> correctIndices = new java.util.HashSet<>();
            while (correctIndices.size() < 5) {
                correctIndices.add((int)(Math.random() * 10));
            }

            for (int i = 0; i < 10; i++) {
                if (correctIndices.contains(i)) {
                    userAnswers[i] = correctAnswers[i];
                } else {
                    // Generate a random wrong answer
                    do {
                        userAnswers[i] = options[(int)(Math.random() * 4)];
                    } while (userAnswers[i].equals(correctAnswers[i]));
                }
            }

            // Calculate scores
            int correctCount = 0;
            int wrongCount = 0;
        %>
        
        <table class="table table-bordered mt-4">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Question</th>
                    <th>Your Answer</th>
                    <th>Correct Answer</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (int i = 0; i < 10; i++) {
                        boolean isCorrect = userAnswers[i].equals(correctAnswers[i]);
                        if (isCorrect) correctCount++;
                        else wrongCount++;
                %>
                <tr>
                    <td><%= (i + 1) %></td>
                    <td><%= questions[i] %></td>
                    <td><%= userAnswers[i] %></td>
                    <td><%= correctAnswers[i] %></td>
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
        <div class="text-center mt-4">
            <h4>Total Correct: <%= correctCount %></h4>
            <h4>Total Wrong: <%= wrongCount %></h4>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>