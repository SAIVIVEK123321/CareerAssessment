<%@page import="com.klef.jfsd.project.StudentCarrerProject.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    // Retrieve the student object from the session
    Student s = (Student) session.getAttribute("student"); 
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile - Career Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f2f5;
            color: #333;
        }
        .container {
            width: 90%;
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background: #ffffff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h3 {
            text-align: center;
            color: #1a237e;
            margin-bottom: 1.5rem;
            font-size: 2rem;
        }
        .profile {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            font-size: 16px;
            line-height: 1.8;
        }
        .profile-section {
            flex-basis: 100%;
            margin-bottom: 1.5rem;
            padding: 1rem;
            background-color: #f8f9fa;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        .profile-section:hover {
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transform: translateY(-2px);
        }
        .profile-section h4 {
            color: #3f51b5;
            margin-top: 0;
            margin-bottom: 0.5rem;
            font-size: 1.2rem;
        }
        .profile-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.5rem;
        }
        .profile-label {
            font-weight: bold;
            color: #555;
        }
        .profile-value {
            color: #333;
        }
        .error-message {
            color: #d32f2f;
            text-align: center;
            font-weight: bold;
            margin-top: 20px;
            padding: 1rem;
            background-color: #ffcdd2;
            border-radius: 5px;
        }
        .edit-profile {
            display: block;
            width: 200px;
            margin: 2rem auto 0;
            padding: 0.75rem 1.5rem;
            background-color: #1a237e;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .edit-profile:hover {
            background-color: #3949ab;
            text-decoration: none;
        }
        .profile-picture {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin: 0 auto 1rem;
            display: block;
            border: 3px solid #1a237e;
        }
        @media (min-width: 768px) {
            .profile-section {
                flex-basis: calc(50% - 1rem);
            }
        }
    </style>
</head>
<body>
    <%@include file="studentrnav.jsp" %>

    <div class="container">
        <h3>My Profile</h3>
        <% if (s != null) { %>
            <img src="https://via.placeholder.com/150" alt="Profile Picture" class="profile-picture" id="profilePicture">
            <div class="profile">
                <div class="profile-section">
                    <h4><i class="fas fa-user"></i> Personal Information</h4>
                    <div class="profile-item">
                        <span class="profile-label">ID:</span>
                        <span class="profile-value"><%= s.getId() %></span>
                    </div>
                    <div class="profile-item">
                        <span class="profile-label">Name:</span>
                        <span class="profile-value"><%= s.getName() %></span>
                    </div>
                    <div class="profile-item">
                        <span class="profile-label">Gender:</span>
                        <span class="profile-value"><%= s.getGender() %></span>
                    </div>
                    <div class="profile-item">
                        <span class="profile-label">Date of Birth:</span>
                        <span class="profile-value"><%= s.getDataofbirth() %></span>
                    </div>
                </div>
                <div class="profile-section">
                    <h4><i class="fas fa-address-card"></i> Contact Information</h4>
                    <div class="profile-item">
                        <span class="profile-label">Email:</span>
                        <span class="profile-value"><%= s.getEmail() %></span>
                    </div>
                    <div class="profile-item">
                        <span class="profile-label">Location:</span>
                        <span class="profile-value"><%= s.getLocation() %></span>
                    </div>
                    <div class="profile-item">
                        <span class="profile-label">Contact:</span>
                        <span class="profile-value"><%= s.getContact() %></span>
                    </div>
                </div>
            </div>
            <a href="editProfile.jsp" class="edit-profile">
                <i class="fas fa-edit"></i> Edit Profile
            </a>
        <% } else { %>
            <p class="error-message">
                <i class="fas fa-exclamation-triangle"></i>
                Session expired or student data not found. Please log in again.
            </p>
        <% } %>
    </div>

    <script>
        // Add some interactivity
        document.addEventListener('DOMContentLoaded', function() {
            const profileSections = document.querySelectorAll('.profile-section');
            profileSections.forEach(section => {
                section.addEventListener('mouseenter', function() {
                    this.style.backgroundColor = '#e8eaf6';
                });
                section.addEventListener('mouseleave', function() {
                    this.style.backgroundColor = '#f8f9fa';
                });
            });

            // Simulating profile picture click to change
            const profilePicture = document.getElementById('profilePicture');
            if (profilePicture) {
                profilePicture.addEventListener('click', function() {
                    alert('Feature coming soon: Change profile picture');
                });
            }
        });
    </script>
</body>
</html>