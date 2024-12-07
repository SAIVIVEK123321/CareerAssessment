<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>C Programming Assessment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .custom-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .custom-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        .btn-custom {
            border-radius: 25px;
            padding: 10px 20px;
            font-weight: bold;
        }
        .progress {
            height: 10px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <h1 class="text-center mb-5">
            <i class="fas fa-code me-2"></i>C Programming Assessment
        </h1>
        
        <div id="instructions" class="custom-card card p-4 mb-5">
            <h2 class="card-title">Instructions</h2>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">Read each question carefully before answering.</li>
                <li class="list-group-item">There are 10 multiple-choice questions in this assessment.</li>
                <li class="list-group-item">Select the best answer for each question.</li>
                <li class="list-group-item">You can only select one answer per question.</li>
                <li class="list-group-item">Once you start the test, you cannot go back to change your answers.</li>
            </ul>
            <button class="btn btn-primary btn-custom mt-3" onclick="startTest()">
                <i class="fas fa-play me-2"></i>Start Test
            </button>
        </div>

        <div id="progressBar" class="mb-4" style="display: none;">
            <div class="progress">
                <div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <p class="text-center mt-2">Question <span id="currentQuestion">1</span> of 10</p>
        </div>

        <form id="questionsForm" action="results.jsp" method="post" style="display: none;">
            <div id="questionContainer"></div>
            <div class="d-flex justify-content-between mt-4">
                <button type="button" class="btn btn-secondary btn-custom" onclick="prevQuestion()" id="prevBtn" style="display: none;">
                    <i class="fas fa-arrow-left me-2"></i>Previous
                </button>
                <button type="button" class="btn btn-primary btn-custom" onclick="nextQuestion()" id="nextBtn">
                    Next<i class="fas fa-arrow-right ms-2"></i>
                </button>
                <button type="submit" class="btn btn-success btn-custom" id="submitBtn" style="display: none;">
                    <i class="fas fa-paper-plane me-2"></i>Submit Test
                </button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const questions = [
            {
                question: "What is the correct syntax to declare a pointer in C?",
                options: ["int *ptr;", "int ptr*;", "pointer int ptr;", "int ptr;"]
            },
            {
                question: "What is the size of a char in C?",
                options: ["1 byte", "2 bytes", "4 bytes", "8 bytes"]
            },
            {
                question: "Which function is used to allocate memory dynamically in C?",
                options: ["malloc()", "calloc()", "realloc()", "All of the above"]
            },
            {
                question: "What is the default return type of main() in C?",
                options: ["int", "void", "float", "double"]
            },
            {
                question: "What is the output of printf(\"%d\", 10 == 10);?",
                options: ["10", "1", "0", "None of the above"]
            },
            {
                question: "Which keyword is used to prevent a variable from being modified in C?",
                options: ["static", "volatile", "const", "register"]
            },
            {
                question: "What is the output of printf(\"%d\", sizeof(int)); on a 32-bit system?",
                options: ["2", "4", "8", "Depends on compiler"]
            },
            {
                question: "What does the break statement do in a loop?",
                options: ["Terminates the program", "Exits the current loop", "Skips the current iteration", "None of the above"]
            },
            {
                question: "Which of the following functions is used to read formatted input in C?",
                options: ["scanf()", "printf()", "fgets()", "gets()"]
            },
            {
                question: "What is the purpose of the return statement in a function?",
                options: ["Terminate the program", "End a loop", "Exit from a function", "Start a new function"]
            }
        ];

        let currentQuestionIndex = 0;

        function startTest() {
            document.getElementById("instructions").style.display = "none";
            document.getElementById("progressBar").style.display = "block";
            document.getElementById("questionsForm").style.display = "block";
            showQuestion(currentQuestionIndex);
        }

        function showQuestion(index) {
            const container = document.getElementById("questionContainer");
            const question = questions[index];
            let html = '<div class="custom-card card mb-4"><div class="card-body">';
            html += '<h3 class="card-title">' + (index + 1) + '. ' + question.question + '</h3>';
            for (let i = 0; i < question.options.length; i++) {
                html += '<div class="form-check mt-3">';
                html += '<input class="form-check-input" type="radio" name="q' + (index + 1) + '" id="q' + (index + 1) + 'o' + i + '" value="' + String.fromCharCode(65 + i) + '" required>';
                html += '<label class="form-check-label" for="q' + (index + 1) + 'o' + i + '">' + question.options[i] + '</label>';
                html += '</div>';
            }
            html += '</div></div>';
            container.innerHTML = html;
            updateProgressBar();
        }

        function nextQuestion() {
            if (currentQuestionIndex < questions.length - 1) {
                currentQuestionIndex++;
                showQuestion(currentQuestionIndex);
            }
            updateButtons();
        }

        function prevQuestion() {
            if (currentQuestionIndex > 0) {
                currentQuestionIndex--;
                showQuestion(currentQuestionIndex);
            }
            updateButtons();
        }

        function updateButtons() {
            const prevBtn = document.getElementById("prevBtn");
            const nextBtn = document.getElementById("nextBtn");
            const submitBtn = document.getElementById("submitBtn");

            prevBtn.style.display = currentQuestionIndex > 0 ? "inline-block" : "none";
            nextBtn.style.display = currentQuestionIndex < questions.length - 1 ? "inline-block" : "none";
            submitBtn.style.display = currentQuestionIndex === questions.length - 1 ? "inline-block" : "none";
        }

        function updateProgressBar() {
            const progressBar = document.querySelector(".progress-bar");
            const currentQuestionSpan = document.getElementById("currentQuestion");
            const progress = ((currentQuestionIndex + 1) / questions.length) * 100;
            progressBar.style.width = progress + "%";
            progressBar.setAttribute("aria-valuenow", progress);
            currentQuestionSpan.textContent = currentQuestionIndex + 1;
        }

        // Initialize the first question
        showQuestion(currentQuestionIndex);
        updateButtons();
    </script>
</body>
</html>