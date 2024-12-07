<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://img.freepik.com/free-photo/close-up-negotiating-table_1098-2600.jpg?t=st=1733512320~exp=1733515920~hmac=6f237212207591efa10fe0fdd95867afdf9a34b7e9b13d3586ca51da841116c6&w=996'); /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            padding: 20px;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            padding: 40px;
            max-width: 600px;
            width: 100%;
            animation: fadeIn 1s ease-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        h2 {
            color: #4a4a4a;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
            letter-spacing: 1px;
        }
        .form-label {
            font-weight: 600;
            color: #555;
        }
        .form-control, .form-select {
            border-radius: 10px;
            border: 1px solid #ced4da;
            padding: 12px;
            transition: all 0.3s;
        }
        .form-control:focus, .form-select:focus {
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }
        .btn {
            border-radius: 10px;
            padding: 12px 20px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-warning {
            background-color: #ffc107;
            border: none;
            color: #212529;
        }
        .btn-warning:hover {
            background-color: #e0a800;
        }
        .invalid-feedback {
            font-size: 80%;
        }
    </style>
</head>
<body>
    <%@include file="mainnavbar.jsp" %>
    <div class="container">
        <h2><i class="fas fa-user-graduate me-2"></i>Student Registration</h2>
        <form id="registrationForm" method="post" action="insertStudent" novalidate>
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="name" name="cname" required placeholder="Enter your full name">
                <div class="invalid-feedback">Please enter your full name.</div>
            </div>

            <div class="mb-3">
                <label for="gender" class="form-label">Gender</label>
                <select class="form-select" id="gender" name="gender" required>
                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
                <div class="invalid-feedback">Please select your gender.</div>
            </div>

            <div class="mb-3">
                <label for="dateofbirth" class="form-label">Date of Birth</label>
                <input type="date" class="form-control" id="dateofbirth" name="dateofbirth" required>
                <div class="invalid-feedback">Please enter your date of birth.</div>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required placeholder="Enter your email">
                <div class="invalid-feedback">Please enter a valid email address.</div>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required placeholder="Create a password">
                <div class="invalid-feedback">Please enter a password.</div>
            </div>

            <div class="mb-3">
                <label for="location" class="form-label">Location</label>
                <input type="text" class="form-control" id="location" name="location" required placeholder="Enter your location">
                <div class="invalid-feedback">Please enter your location.</div>
            </div>

            <div class="mb-3">
                <label for="contact" class="form-label">Contact Number</label>
                <input type="tel" class="form-control" id="contact" name="contact" required pattern="[0-9]{10}" placeholder="Enter your contact number">
                <div class="invalid-feedback">Please enter a valid 10-digit contact number.</div>
            </div>

            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                <button type="submit" class="btn btn-primary me-md-2">Register</button>
                <button type="reset" class="btn btn-warning">Reset</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        (function () {
            'use strict'

            var form = document.getElementById('registrationForm')

            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)

            var dobInput = document.getElementById('dateofbirth')
            dobInput.addEventListener('change', function() {
                var dob = new Date(this.value)
                var today = new Date()
                var age = today.getFullYear() - dob.getFullYear()
                var m = today.getMonth() - dob.getMonth()
                if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) {
                    age--
                }
                if (age < 15) {
                    this.setCustomValidity('You must be at least 15 years old.')
                } else {
                    this.setCustomValidity('')
                }
            })

            var passwordInput = document.getElementById('password')
            passwordInput.addEventListener('input', function() {
                var password = this.value
                var strength = 0
                if (password.match(/[a-z]+/)) strength++
                if (password.match(/[A-Z]+/)) strength++
                if (password.match(/[0-9]+/)) strength++
                if (password.match(/[$@#&!]+/)) strength++
                if (password.length >= 8) strength++

                var feedback = this.nextElementSibling
                if (strength < 3) {
                    this.setCustomValidity('Password is too weak')
                    feedback.textContent = 'Password should be at least 8 characters long and contain uppercase, lowercase, number, and special character.'
                } else {
                    this.setCustomValidity('')
                    feedback.textContent = ''
                }
            })
        })()
    </script>
</body>
</html>