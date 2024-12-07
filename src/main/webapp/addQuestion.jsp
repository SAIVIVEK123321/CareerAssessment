<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Questions - Career Management System</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 50px;
        }
        .container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 30px;
            margin-bottom: 50px;
        }
        h1, h2 {
            color: #007bff;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .char-counter {
            font-size: 0.8em;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4"><i class="fas fa-question-circle mr-2"></i>Manage Questions</h1>

        <h2 class="mb-3"><i class="fas fa-plus-circle mr-2"></i>Add Question</h2>
        <form action="<c:url value='/addQuestion'/>" method="post" id="questionForm">
            <div class="form-group">
                <label for="questionTitle">Question Title:</label>
                <textarea class="form-control" id="questionTitle" name="questionTitle" rows="3" required maxlength="500"></textarea>
                <small class="char-counter" id="titleCounter">0 / 500 characters</small>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="option1">Option A:</label>
                    <input type="text" class="form-control" id="option1" name="option1" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="option2">Option B:</label>
                    <input type="text" class="form-control" id="option2" name="option2" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="option3">Option C:</label>
                    <input type="text" class="form-control" id="option3" name="option3" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="option4">Option D:</label>
                    <input type="text" class="form-control" id="option4" name="option4" required>
                </div>
            </div>

            <div class="form-group">
                <label for="rightAnswer">Right Answer:</label>
                <select class="form-control" id="rightAnswer" name="rightAnswer" required>
                    <option value="">Select the correct option</option>
                    <option value="A">Option A</option>
                    <option value="B">Option B</option>
                    <option value="C">Option C</option>
                    <option value="D">Option D</option>
                </select>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="difficultlevel">Difficulty Level:</label>
                    <select class="form-control" id="difficultlevel" name="difficultlevel" required>
                        <option value="">Select difficulty</option>
                        <option value="Easy">Easy</option>
                        <option value="Medium">Medium</option>
                        <option value="Hard">Hard</option>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="category">Category:</label>
                    <input type="text" class="form-control" id="category" name="category" required>
                </div>
            </div>

            <button type="submit" class="btn btn-primary btn-block"><i class="fas fa-save mr-2"></i>Add Question</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            // Character counter for question title
            $('#questionTitle').on('input', function() {
                var charCount = $(this).val().length;
                $('#titleCounter').text(charCount + ' / 500 characters');
            });

            // Form validation
            $('#questionForm').submit(function(event) {
                var isValid = true;
                $(this).find('input, textarea, select').each(function() {
                    if ($(this).prop('required') && !$(this).val()) {
                        isValid = false;
                        $(this).addClass('is-invalid');
                    } else {
                        $(this).removeClass('is-invalid');
                    }
                });

                if (!isValid) {
                    event.preventDefault();
                    alert('Please fill in all required fields.');
                }
            });
        });
    </script>
</body>
</html>