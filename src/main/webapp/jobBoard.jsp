<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Board</title>
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
        .job-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 15px;
            background-color: #fff;
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }
        .job-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .job-title {
            font-size: 1.25rem;
            font-weight: bold;
        }
        .job-company, .job-location {
            font-size: 1rem;
            color: #555;
        }
        .btn-apply {
            text-transform: uppercase;
            font-weight: bold;
        }
        .job-type-badge {
            font-size: 0.8rem;
            padding: 0.3rem 0.6rem;
            margin-right: 0.5rem;
        }
        .filters {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4">
            <i class="fas fa-briefcase me-2"></i>Job Board
        </h2>

        <%-- Filters --%>
        <div class="filters mb-4">
            <div class="row">
                <div class="col-md-4 mb-3">
                    <input type="text" id="searchInput" class="form-control" placeholder="Search jobs...">
                </div>
                <div class="col-md-4 mb-3">
                    <select id="locationFilter" class="form-select">
                        <option value="">All Locations</option>
                        <option value="New York">New York</option>
                        <option value="San Francisco">San Francisco</option>
                        <option value="London">London</option>
                        <option value="Remote">Remote</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <select id="jobTypeFilter" class="form-select">
                        <option value="">All Job Types</option>
                        <option value="Full-time">Full-time</option>
                        <option value="Part-time">Part-time</option>
                        <option value="Contract">Contract</option>
                        <option value="Internship">Internship</option>
                    </select>
                </div>
            </div>
        </div>

        <%-- Success or Error Message --%>
        <c:if test="${not empty message}">
            <div class="alert alert-success text-center">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger text-center">${error}</div>
        </c:if>

        <%-- Job Listings --%>
        <div id="jobListings">
            <div class="job-card" data-location="New York" data-type="Full-time">
                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <div class="job-title">Senior Software Engineer</div>
                        <div class="job-company">
                            <i class="fas fa-building me-2"></i>Tech Innovations Inc.
                        </div>
                        <div class="job-location">
                            <i class="fas fa-map-marker-alt me-2"></i>New York
                        </div>
                    </div>
                    <span class="badge bg-primary job-type-badge">Full-time</span>
                </div>
                <div class="job-description mt-3">
                    We are seeking a talented Senior Software Engineer to join our dynamic team. The ideal candidate will have strong experience in full-stack development and a passion for creating innovative solutions.
                </div>
                <button class="btn btn-primary btn-apply mt-3" onclick="showJobDetails(1)">
                    <i class="fas fa-paper-plane me-2"></i>Apply Now
                </button>
            </div>

            <div class="job-card" data-location="San Francisco" data-type="Contract">
                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <div class="job-title">UX/UI Designer</div>
                        <div class="job-company">
                            <i class="fas fa-building me-2"></i>Creative Designs Co.
                        </div>
                        <div class="job-location">
                            <i class="fas fa-map-marker-alt me-2"></i>San Francisco
                        </div>
                    </div>
                    <span class="badge bg-warning text-dark job-type-badge">Contract</span>
                </div>
                <div class="job-description mt-3">
                    We're looking for a talented UX/UI Designer to help create beautiful and intuitive user interfaces for our products. The ideal candidate will have a strong portfolio and experience in user-centered design processes.
                </div>
                <button class="btn btn-primary btn-apply mt-3" onclick="showJobDetails(2)">
                    <i class="fas fa-paper-plane me-2"></i>Apply Now
                </button>
            </div>

            <div class="job-card" data-location="Remote" data-type="Part-time">
                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <div class="job-title">Content Writer</div>
                        <div class="job-company">
                            <i class="fas fa-building me-2"></i>Global Media Group
                        </div>
                        <div class="job-location">
                            <i class="fas fa-map-marker-alt me-2"></i>Remote
                        </div>
                    </div>
                    <span class="badge bg-success job-type-badge">Part-time</span>
                </div>
                <div class="job-description mt-3">
                    We are seeking a creative and versatile Content Writer to join our team on a part-time basis. The ideal candidate will have excellent writing skills and the ability to produce engaging content across various topics.
                </div>
                <button class="btn btn-primary btn-apply mt-3" onclick="showJobDetails(3)">
                    <i class="fas fa-paper-plane me-2"></i>Apply Now
                </button>
            </div>

            <div class="job-card" data-location="London" data-type="Internship">
                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <div class="job-title">Marketing Intern</div>
                        <div class="job-company">
                            <i class="fas fa-building me-2"></i>StartUp Ventures
                        </div>
                        <div class="job-location">
                            <i class="fas fa-map-marker-alt me-2"></i>London
                        </div>
                    </div>
                    <span class="badge bg-info job-type-badge">Internship</span>
                </div>
                <div class="job-description mt-3">
                    We're offering an exciting internship opportunity for a Marketing enthusiast to join our growing startup. This role will provide hands-on experience in various aspects of digital marketing and brand strategy.
                </div>
                <button class="btn btn-primary btn-apply mt-3" onclick="showJobDetails(4)">
                    <i class="fas fa-paper-plane me-2"></i>Apply Now
                </button>
            </div>
        </div>

        <%-- No Jobs Available --%>
        <div id="noJobs" class="alert alert-warning text-center" style="display: none;">
            No job listings match your search criteria. Please try different filters.
        </div>
    </div>

    <%-- Job Details Modal --%>
    <div class="modal fade" id="jobModal" tabindex="-1" aria-labelledby="jobModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="jobModalLabel">Job Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="jobModalBody">
                    <!-- Job details will be dynamically inserted here -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="applyForJob()">Apply for this Job</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const searchInput = document.getElementById('searchInput');
        const locationFilter = document.getElementById('locationFilter');
        const jobTypeFilter = document.getElementById('jobTypeFilter');
        const jobListings = document.getElementById('jobListings');
        const noJobs = document.getElementById('noJobs');

        function filterJobs() {
            const searchTerm = searchInput.value.toLowerCase();
            const selectedLocation = locationFilter.value.toLowerCase();
            const selectedJobType = jobTypeFilter.value.toLowerCase();
            let visibleCount = 0;

            Array.from(jobListings.children).forEach(card => {
                const title = card.querySelector('.job-title').textContent.toLowerCase();
                const company = card.querySelector('.job-company').textContent.toLowerCase();
                const description = card.querySelector('.job-description').textContent.toLowerCase();
                const location = card.dataset.location.toLowerCase();
                const jobType = card.dataset.type.toLowerCase();

                const matchesSearch = title.includes(searchTerm) || company.includes(searchTerm) || description.includes(searchTerm);
                const matchesLocation = selectedLocation === '' || location === selectedLocation;
                const matchesJobType = selectedJobType === '' || jobType === selectedJobType;

                if (matchesSearch && matchesLocation && matchesJobType) {
                    card.style.display = 'block';
                    visibleCount++;
                } else {
                    card.style.display = 'none';
                }
            });

            noJobs.style.display = visibleCount === 0 ? 'block' : 'none';
        }

        searchInput.addEventListener('input', filterJobs);
        locationFilter.addEventListener('change', filterJobs);
        jobTypeFilter.addEventListener('change', filterJobs);

        function showJobDetails(jobId) {
            const job = document.querySelector(`.job-card:nth-child(${jobId})`);
            const modalBody = document.getElementById('jobModalBody');
            
            modalBody.innerHTML = `
                <h3>${job.querySelector('.job-title').textContent}</h3>
                <p><strong>Company:</strong> ${job.querySelector('.job-company').textContent}</p>
                <p><strong>Location:</strong> ${job.querySelector('.job-location').textContent}</p>
                <p><strong>Job Type:</strong> ${job.querySelector('.job-type-badge').textContent}</p>
                <h4>Job Description:</h4>
                <p>${job.querySelector('.job-description').textContent}</p>
                <h4>Requirements:</h4>
                <ul>
                    <li>Bachelor's degree in related field</li>
                    <li>3+ years of relevant experience</li>
                    <li>Strong communication skills</li>
                    <li>Ability to work in a fast-paced environment</li>
                </ul>
                <h4>Benefits:</h4>
                <ul>
                    <li>Competitive salary</li>
                    <li>Health insurance</li>
                    <li>401(k) matching</li>
                    <li>Professional development opportunities</li>
                </ul>
            `;

            const jobModal = new bootstrap.Modal(document.getElementById('jobModal'));
            jobModal.show();
        }

        function applyForJob() {
            alert('Your application has been submitted successfully!');
            bootstrap.Modal.getInstance(document.getElementById('jobModal')).hide();
        }
    </script>
</body>
</html>