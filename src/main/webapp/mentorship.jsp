<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentorship Opportunities</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
        }
        .container {
            margin-top: 30px;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .mentor-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 15px;
            background-color: #fff;
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }
        .mentor-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .mentor-name {
            font-size: 1.25rem;
            font-weight: bold;
        }
        .mentor-field {
            font-size: 1rem;
            color: #555;
        }
        .btn-connect {
            text-transform: uppercase;
            font-weight: bold;
        }
        .mentor-avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
        }
        .field-badge {
            font-size: 0.8rem;
            padding: 0.3rem 0.6rem;
            margin-right: 0.5rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4">Mentorship Opportunities</h2>

        <%-- Search and Filter --%>
        <div class="row mb-4">
            <div class="col-md-6">
                <input type="text" id="searchInput" class="form-control" placeholder="Search mentors...">
            </div>
            <div class="col-md-6">
                <select id="fieldFilter" class="form-select">
                    <option value="">All Fields</option>
                    <option value="Web Development">Web Development</option>
                    <option value="Data Science">Data Science</option>
                    <option value="Machine Learning">Machine Learning</option>
                    <option value="Mobile Development">Mobile Development</option>
                </select>
            </div>
        </div>

        <%-- Success or Error Message --%>
        <c:if test="${not empty message}">
            <div class="alert alert-success text-center">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger text-center">${error}</div>
        </c:if>

        <%-- Mentor List --%>
        <div id="mentorList">
            <div class="mentor-card" data-field="Web Development">
                <div class="row">
                    <div class="col-md-2">
                        <img src="https://randomuser.me/api/portraits/men/1.jpg" alt="John Doe" class="mentor-avatar">
                    </div>
                    <div class="col-md-10">
                        <div class="mentor-name">John Doe</div>
                        <div class="mentor-field">
                            <span class="badge bg-primary field-badge">Web Development</span>
                        </div>
                        <div class="mentor-experience">Experience: 8 years</div>
                        <div class="mentor-description">Experienced full-stack developer specializing in React and Node.js.</div>
                        <button class="btn btn-primary btn-connect mt-3" onclick="showMentorDetails(1)">Connect with Mentor</button>
                    </div>
                </div>
            </div>

            <div class="mentor-card" data-field="Data Science">
                <div class="row">
                    <div class="col-md-2">
                        <img src="https://randomuser.me/api/portraits/women/2.jpg" alt="Jane Smith" class="mentor-avatar">
                    </div>
                    <div class="col-md-10">
                        <div class="mentor-name">Jane Smith</div>
                        <div class="mentor-field">
                            <span class="badge bg-success field-badge">Data Science</span>
                        </div>
                        <div class="mentor-experience">Experience: 6 years</div>
                        <div class="mentor-description">Data scientist with expertise in Python, R, and machine learning algorithms.</div>
                        <button class="btn btn-primary btn-connect mt-3" onclick="showMentorDetails(2)">Connect with Mentor</button>
                    </div>
                </div>
            </div>

            <div class="mentor-card" data-field="Machine Learning">
                <div class="row">
                    <div class="col-md-2">
                        <img src="https://randomuser.me/api/portraits/men/3.jpg" alt="Mike Johnson" class="mentor-avatar">
                    </div>
                    <div class="col-md-10">
                        <div class="mentor-name">Mike Johnson</div>
                        <div class="mentor-field">
                            <span class="badge bg-info field-badge">Machine Learning</span>
                        </div>
                        <div class="mentor-experience">Experience: 10 years</div>
                        <div class="mentor-description">AI researcher and practitioner with focus on deep learning and computer vision.</div>
                        <button class="btn btn-primary btn-connect mt-3" onclick="showMentorDetails(3)">Connect with Mentor</button>
                    </div>
                </div>
            </div>

            <div class="mentor-card" data-field="Mobile Development">
                <div class="row">
                    <div class="col-md-2">
                        <img src="https://randomuser.me/api/portraits/women/4.jpg" alt="Emily Chen" class="mentor-avatar">
                    </div>
                    <div class="col-md-10">
                        <div class="mentor-name">Emily Chen</div>
                        <div class="mentor-field">
                            <span class="badge bg-warning field-badge">Mobile Development</span>
                        </div>
                        <div class="mentor-experience">Experience: 7 years</div>
                        <div class="mentor-description">Mobile app developer skilled in iOS and Android platforms.</div>
                        <button class="btn btn-primary btn-connect mt-3" onclick="showMentorDetails(4)">Connect with Mentor</button>
                    </div>
                </div>
            </div>
        </div>

        <%-- No Mentors Available --%>
        <div id="noMentors" class="alert alert-warning text-center" style="display: none;">
            No mentors available for your search or filter. Please try different criteria.
        </div>
    </div>

    <%-- Mentor Details Modal --%>
    <div class="modal fade" id="mentorModal" tabindex="-1" aria-labelledby="mentorModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="mentorModalLabel">Mentor Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="mentorModalBody">
                    <!-- Mentor details will be dynamically inserted here -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="requestMentorship()">Request Mentorship</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const searchInput = document.getElementById('searchInput');
        const fieldFilter = document.getElementById('fieldFilter');
        const mentorList = document.getElementById('mentorList');
        const noMentors = document.getElementById('noMentors');

        function filterMentors() {
            const searchTerm = searchInput.value.toLowerCase();
            const selectedField = fieldFilter.value.toLowerCase();
            let visibleCount = 0;

            Array.from(mentorList.children).forEach(card => {
                const name = card.querySelector('.mentor-name').textContent.toLowerCase();
                const description = card.querySelector('.mentor-description').textContent.toLowerCase();
                const field = card.dataset.field.toLowerCase();

                const matchesSearch = name.includes(searchTerm) || description.includes(searchTerm);
                const matchesField = selectedField === '' || field === selectedField;

                if (matchesSearch && matchesField) {
                    card.style.display = 'block';
                    visibleCount++;
                } else {
                    card.style.display = 'none';
                }
            });

            noMentors.style.display = visibleCount === 0 ? 'block' : 'none';
        }

        searchInput.addEventListener('input', filterMentors);
        fieldFilter.addEventListener('change', filterMentors);

        function showMentorDetails(mentorId) {
            const mentor = document.querySelector(`.mentor-card:nth-child(${mentorId})`);
            const modalBody = document.getElementById('mentorModalBody');
            
            modalBody.innerHTML = `
                <div class="row">
                    <div class="col-md-4">
                        <img src="${mentor.querySelector('.mentor-avatar').src}" alt="${mentor.querySelector('.mentor-name').textContent}" class="img-fluid rounded">
                    </div>
                    <div class="col-md-8">
                        <h3>${mentor.querySelector('.mentor-name').textContent}</h3>
                        <p><strong>Field:</strong> ${mentor.querySelector('.mentor-field').textContent}</p>
                        <p><strong>Experience:</strong> ${mentor.querySelector('.mentor-experience').textContent}</p>
                        <p>${mentor.querySelector('.mentor-description').textContent}</p>
                        <h4>Expertise:</h4>
                        <ul>
                            <li>JavaScript</li>
                            <li>React</li>
                            <li>Node.js</li>
                            <li>Python</li>
                        </ul>
                        <h4>Available Times:</h4>
                        <p>Monday-Friday: 2PM - 6PM (EST)</p>
                        <p>Saturday: 10AM - 2PM (EST)</p>
                    </div>
                </div>
            `;

            const mentorModal = new bootstrap.Modal(document.getElementById('mentorModal'));
            mentorModal.show();
        }

        function requestMentorship() {
            alert('Mentorship request sent! The mentor will contact you soon.');
            bootstrap.Modal.getInstance(document.getElementById('mentorModal')).hide();
        }
    </script>
</body>
</html>