<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        /* Header Styling */
        header {
            background-color: #004080;
            color: white;
            padding: 20px;
            text-align: center;
        }

        header h1 {
            margin: 0;
            font-size: 36px;
        }

        /* Container Styling */
        .container {
            margin: 30px auto;
            width: 60%;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .container h2 {
            margin-bottom: 20px;
            color: #004080;
        }

        /* Contact Info Section */
        .contact-info {
            margin-bottom: 30px;
        }

        .contact-info p {
            font-size: 16px;
            margin: 5px 0;
            color: #333;
        }

        .contact-info i {
            color: #004080;
            margin-right: 10px;
        }

        /* Contact Form Styling */
        .contact-form {
            display: flex;
            flex-direction: column;
        }

        .contact-form label {
            font-size: 16px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .contact-form input, .contact-form textarea {
            font-size: 14px;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box;
        }

        .contact-form textarea {
            height: 150px;
            resize: vertical;
        }

        .contact-form button {
            background-color: #004080;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .contact-form button:hover {
            background-color: #003366;
        }

        /* Footer Styling */
        footer {
            background-color: #004080;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        footer p {
            margin: 0;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <header>
        <h1>Contact Us</h1>
    </header>

    <!-- Main Content Section -->
    <div class="container">
        <h2>We'd Love to Hear From You!</h2>
        <p>If you have any questions, comments, or suggestions, feel free to reach out to us using the form below or contact us directly.</p>
        
        <!-- Contact Information -->
        <div class="contact-info">
            <p><i class="fas fa-phone"></i> Phone: +1-234-567-8901</p>
            <p><i class="fas fa-envelope"></i> Email: support@careermanagement.com</p>
            <p><i class="fas fa-map-marker-alt"></i> Address: 123 Career Street, Job City, USA</p>
        </div>

        <!-- Contact Form -->
        <form class="contact-form">
            <label for="name">Your Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>

            <label for="email">Your Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="message">Your Message:</label>
            <textarea id="message" name="message" placeholder="Enter your message" required></textarea>

            <button type="submit">Send Message</button>
        </form>
    </div>

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2024 Career Management System. All Rights Reserved.</p>
    </footer>
</body>
</html>
