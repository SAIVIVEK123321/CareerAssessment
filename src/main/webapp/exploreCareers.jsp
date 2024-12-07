<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Explore Careers - Career Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            padding-top: 70px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        .career-header {
            background: linear-gradient(135deg, #007bff, #0056b3);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
            border-radius: 10px;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            overflow: hidden;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }
        .card-body {
            padding: 1.5rem;
        }
        .card-title {
            color: #333;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }
        .card-text {
            color: #555;
            font-size: 0.9rem;
        }
        .btn-explore {
            background-color: #007bff;
            border: none;
            padding: 0.5rem 1rem;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        .btn-explore:hover {
            background-color: #0056b3;
        }
        .filters {
            background-color: white;
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 2rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .career-count {
            font-weight: bold;
            color: #007bff;
        }
    </style>
</head>
<body>
    <%@ include file="mainnavbar.jsp" %>

    <div class="career-header">
        <div class="container">
            <h1 class="text-center mb-3">Explore Exciting Career Paths</h1>
            <p class="text-center mb-0">Discover diverse opportunities and find your perfect career match</p>
        </div>
    </div>

    <div class="container">
        <div class="filters">
            <div class="row g-3">
                <div class="col-md-4">
                    <input type="text" id="searchInput" class="form-control" placeholder="Search careers...">
                </div>
                <div class="col-md-4">
                    <select id="industryFilter" class="form-select">
                        <option value="">All Industries</option>
                        <option value="Technology">Technology</option>
                        <option value="Healthcare">Healthcare</option>
                        <option value="Finance">Finance</option>
                        <option value="Education">Education</option>
                        <option value="Creative">Creative</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <select id="educationFilter" class="form-select">
                        <option value="">All Education Levels</option>
                        <option value="High School">High School</option>
                        <option value="Bachelor's">Bachelor's Degree</option>
                        <option value="Master's">Master's Degree</option>
                        <option value="PhD">PhD</option>
                    </select>
                </div>
            </div>
        </div>

        <p class="mb-4">Showing <span id="careerCount" class="career-count">0</span> career(s)</p>

        <div class="row row-cols-1 row-cols-md-3 g-4" id="careerList">
            <!-- Career cards will be dynamically inserted here -->
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Sample career data (replace with actual data from your backend)
        const careers = [
            { id: 1, title: "Software Developer", industry: "Technology", education: "Bachelor's", image: "https://i.ytimg.com/vi/Ou-R5jPRJfE/sddefault.jpg", description: "Design, develop, and maintain software applications and systems." },
            { id: 2, title: "Data Scientist", industry: "Technology", education: "Master's", image: "https://via.placeholder.com/300x200.png?text=Data+Scientist", description: "Analyze complex data to help companies make better decisions." },
            { id: 3, title: "Registered Nurse", industry: "Healthcare", education: "Bachelor's", image: "https://via.placeholder.com/300x200.png?text=Registered+Nurse", description: "Provide and coordinate patient care in various healthcare settings." },
            { id: 4, title: "Financial Analyst", industry: "Finance", education: "Bachelor's", image: "https://via.placeholder.com/300x200.png?text=Financial+Analyst", description: "Analyze financial data and provide insights for business decisions." },
            { id: 5, title: "Teacher", industry: "Education", education: "Bachelor's", image: "https://via.placeholder.com/300x200.png?text=Teacher", description: "Educate students and help them develop knowledge and skills." },
            { id: 6, title: "Graphic Designer", industry: "Creative", education: "Bachelor's", image: "https://via.placeholder.com/300x200.png?text=Graphic+Designer", description: "Create visual concepts using computer software or by hand." },
            { id: 7, title: "Marketing Manager", industry: "Creative", education: "Bachelor's", image: "https://via.placeholder.com/300x200.png?text=Marketing+Manager", description: "Develop and implement marketing strategies to promote products or services." },
            { id: 8, title: "Mechanical Engineer", industry: "Technology", education: "Bachelor's", image: "https://via.placeholder.com/300x200.png?text=Mechanical+Engineer", description: "Design, develop, and test mechanical devices, including tools, engines, and machines." },
            { id: 9, title: "Psychologist", industry: "Healthcare", education: "PhD", image: "https://via.placeholder.com/300x200.png?text=Psychologist", description: "Study cognitive, emotional, and social processes and behavior, and provide mental health care." }
        ];

        function renderCareers(filteredCareers) {
            const careerList = document.getElementById('careerList');
            careerList.innerHTML = '';
            filteredCareers.forEach(career => {
                const careerCard = `
                    <div class="col">
                        <div class="card h-100">
                            <img src="${career.image}" class="card-img-top" alt="${career.title}">
                            <div class="card-body">
                                <h5 class="card-title">${career.title}</h5>
                                <p class="card-text">${career.description}</p>
                                <p class="card-text"><small class="text-muted">Industry: ${career.industry}</small></p>
                                <p class="card-text"><small class="text-muted">Education: ${career.education}</small></p>
                                <a href="careerDetails?careerId=${career.id}" class="btn btn-primary btn-explore">Learn More</a>
                            </div>
                        </div>
                    </div>
                `;
                careerList.innerHTML += careerCard;
            });
            document.getElementById('careerCount').textContent = filteredCareers.length;
        }

        function filterCareers() {
            const searchTerm = document.getElementById('searchInput').value.toLowerCase();
            const selectedIndustry = document.getElementById('industryFilter').value;
            const selectedEducation = document.getElementById('educationFilter').value;

            const filteredCareers = careers.filter(career => {
                const matchesSearch = career.title.toLowerCase().includes(searchTerm) || career.description.toLowerCase().includes(searchTerm);
                const matchesIndustry = selectedIndustry === '' || career.industry === selectedIndustry;
                const matchesEducation = selectedEducation === '' || career.education === selectedEducation;
                return matchesSearch && matchesIndustry && matchesEducation;
            });

            renderCareers(filteredCareers);
        }

        document.getElementById('searchInput').addEventListener('input', filterCareers);
        document.getElementById('industryFilter').addEventListener('change', filterCareers);
        document.getElementById('educationFilter').addEventListener('change', filterCareers);

        // Initial render
        renderCareers(careers);
    </script>
</body>
</html>