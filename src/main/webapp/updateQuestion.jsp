<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Question - Career Management System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
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
        .container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 50px;
            margin-bottom: 50px;
        }
        h2 {
            color: var(--primary-color);
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: bold;
        }
        .form-group label {
            font-weight: 600;
            color: var(--secondary-color);
        }
        .form-control {
            border: 2px solid #e0e0e0;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
        }
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            font-weight: bold;
            letter-spacing: 1px;
            padding: 10px 20px;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #2980b9;
            border-color: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .form-icon {
            position: absolute;
            top: 38px;
            left: 10px;
            color: var(--primary-color);
        }
        .input-with-icon {
            padding-left: 35px;
        }
        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="container fade-in">
        <h2 class="text-center mb-4">
            <i class="fas fa-edit mr-2"></i>Update Question
        </h2>
        <form id="updateForm" action="/update" method="POST">
            <div class="form-group position-relative">
                <label for="id"><i class="fas fa-hashtag form-icon"></i> Question ID:</label>
                <input type="number" id="id" name="id" class="form-control input-with-icon" placeholder="Enter Question ID" required />
            </div>

            <div class="form-group position-relative">
                <label for="questionTitle"><i class="fas fa-question-circle form-icon"></i> Question Title:</label>
                <input type="text" id="questionTitle" name="questionTitle" class="form-control input-with-icon" placeholder="Enter Question Title" required />
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group position-relative">
                        <label for="option1"><i class="fas fa-check-circle form-icon"></i> Option A:</label>
                        <input type="text" id="option1" name="option1" class="form-control input-with-icon" placeholder="Enter Option A" required />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group position-relative">
                        <label for="option2"><i class="fas fa-check-circle form-icon"></i> Option B:</label>
                        <input type="text" id="option2" name="option2" class="form-control input-with-icon" placeholder="Enter Option B" required />
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group position-relative">
                        <label for="option3"><i class="fas fa-check-circle form-icon"></i> Option C:</label>
                        <input type="text" id="option3" name="option3" class="form-control input-with-icon" placeholder="Enter Option C" required />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group position-relative">
                        <label for="option4"><i class="fas fa-check-circle form-icon"></i> Option D:</label>
                        <input type="text" id="option4" name="option4" class="form-control input-with-icon" placeholder="Enter Option D" required />
                    </div>
                </div>
            </div>

            <div class="form-group position-relative">
                <label for="rightAnswer"><i class="fas fa-star form-icon"></i> Right Answer:</label>
                <input type="text" id="rightAnswer" name="rightAnswer" class="form-control input-with-icon" placeholder="Enter Right Answer" required />
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group position-relative">
                        <label for="difficultlevel"><i class="fas fa-layer-group form-icon"></i> Difficulty Level:</label>
                        <select id="difficultlevel" name="difficultlevel" class="form-control input-with-icon" required>
                            <option value="">Select Difficulty</option>
                            <option value="Easy">Easy</option>
                            <option value="Medium">Medium</option>
                            <option value="Hard">Hard</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group position-relative">
                        <label for="category"><i class="fas fa-folder form-icon"></i> Category:</label>
                        <input type="text" id="category" name="category" class="form-control input-with-icon" placeholder="Enter Category" required />
                    </div>
                </div>
            </div>

            <div class="text-center mt-4">
                <button type="submit" class="btn btn-primary btn-lg">
                    <i class="fas fa-save mr-2"></i>Update Question
                </button>
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        document.getElementById('updateForm').addEventListener('submit', function(e) {
            e.preventDefault();
            // Here you would typically send the form data to the server
            // For demonstration, we're just redirecting
            window.location.href = 'updateSuccess.jsp';
        });
    </script>
</body>
</html>
