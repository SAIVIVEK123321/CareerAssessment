<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Learning Resources</title>
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
        .resource-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 15px;
            background-color: #fff;
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }
        .resource-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .resource-title {
            font-size: 1.25rem;
            font-weight: bold;
        }
        .resource-link {
            color: #007bff;
            text-decoration: none;
        }
        .resource-link:hover {
            text-decoration: underline;
        }
        .btn-view-all {
            text-transform: uppercase;
            font-weight: bold;
        }
        .category-badge {
            font-size: 0.8rem;
            padding: 0.3rem 0.6rem;
            margin-right: 0.5rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4">Recommended Learning Resources</h2>

        <%-- Search Bar --%>
        <div class="mb-4">
            <input type="text" id="searchInput" class="form-control" placeholder="Search resources...">
        </div>

        <%-- Category Filter --%>
        <div class="mb-4">
            <select id="categoryFilter" class="form-select">
                <option value="">All Categories</option>
                <option value="Programming">Programming</option>
                <option value="Web Development">Web Development</option>
                <option value="Data Science">Data Science</option>
                <option value="Machine Learning">Machine Learning</option>
            </select>
        </div>

        <%-- Success or Error Message --%>
        <c:if test="${not empty message}">
            <div class="alert alert-success text-center">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger text-center">${error}</div>
        </c:if>

        <%-- Resource List --%>
        <div id="resourceList">
            <div class="resource-card" data-category="Programming">
                <div class="resource-title">Introduction to Python</div>
                <div class="resource-category">
                    <span class="badge bg-primary category-badge">Programming</span>
                </div>
                <div class="resource-description">Learn the basics of Python programming language.</div>
                <a href="https://www.python.org/about/gettingstarted/" class="resource-link" target="_blank">Visit Resource</a>
            </div>

            <div class="resource-card" data-category="Web Development">
                <div class="resource-title">HTML & CSS Fundamentals</div>
                <div class="resource-category">
                    <span class="badge bg-success category-badge">Web Development</span>
                </div>
                <div class="resource-description">Master the building blocks of web development.</div>
                <a href="https://developer.mozilla.org/en-US/docs/Learn/HTML" class="resource-link" target="_blank">Visit Resource</a>
            </div>

            <div class="resource-card" data-category="Data Science">
                <div class="resource-title">Data Analysis with Pandas</div>
                <div class="resource-category">
                    <span class="badge bg-info category-badge">Data Science</span>
                </div>
                <div class="resource-description">Learn how to analyze data using the Pandas library in Python.</div>
                <a href="https://pandas.pydata.org/docs/getting_started/index.html" class="resource-link" target="_blank">Visit Resource</a>
            </div>

            <div class="resource-card" data-category="Machine Learning">
                <div class="resource-title">Introduction to Machine Learning</div>
                <div class="resource-category">
                    <span class="badge bg-warning category-badge">Machine Learning</span>
                </div>
                <div class="resource-description">Discover the basics of machine learning algorithms and applications.</div>
                <a href="https://www.coursera.org/learn/machine-learning" class="resource-link" target="_blank">Visit Resource</a>
            </div>

            <div class="resource-card" data-category="Web Development">
                <div class="resource-title">JavaScript Essentials</div>
                <div class="resource-category">
                    <span class="badge bg-success category-badge">Web Development</span>
                </div>
                <div class="resource-description">Learn the core concepts of JavaScript for dynamic web development.</div>
                <a href="https://javascript.info/" class="resource-link" target="_blank">Visit Resource</a>
            </div>
        </div>

        <%-- No Resources Available --%>
        <div id="noResources" class="alert alert-warning text-center" style="display: none;">
            No resources available for your search or filter. Please try different criteria.
        </div>

        <%-- View All Resources Button --%>
        <div class="d-grid mt-4">
            <button type="button" class="btn btn-primary btn-view-all" onclick="viewAllResources()">View All Resources</button>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const searchInput = document.getElementById('searchInput');
        const categoryFilter = document.getElementById('categoryFilter');
        const resourceList = document.getElementById('resourceList');
        const noResources = document.getElementById('noResources');

        function filterResources() {
            const searchTerm = searchInput.value.toLowerCase();
            const selectedCategory = categoryFilter.value.toLowerCase();
            let visibleCount = 0;

            Array.from(resourceList.children).forEach(card => {
                const title = card.querySelector('.resource-title').textContent.toLowerCase();
                const description = card.querySelector('.resource-description').textContent.toLowerCase();
                const category = card.dataset.category.toLowerCase();

                const matchesSearch = title.includes(searchTerm) || description.includes(searchTerm);
                const matchesCategory = selectedCategory === '' || category === selectedCategory;

                if (matchesSearch && matchesCategory) {
                    card.style.display = 'block';
                    visibleCount++;
                } else {
                    card.style.display = 'none';
                }
            });

            noResources.style.display = visibleCount === 0 ? 'block' : 'none';
        }

        searchInput.addEventListener('input', filterResources);
        categoryFilter.addEventListener('change', filterResources);

        function viewAllResources() {
            searchInput.value = '';
            categoryFilter.value = '';
            filterResources();
        }
    </script>
</body>
</html>