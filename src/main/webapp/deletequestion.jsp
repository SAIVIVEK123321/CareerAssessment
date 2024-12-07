<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="adminnavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Question</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<h1 align="center">Delete Question by ID</h1>

<form action="/questions/delete" align="center">
    <label for="id">Enter Question ID to Delete:</label>
    <input type="number" id="id" name="id" required>
    <button type="submit" class="btn btn-danger">Delete Question</button>
</form>

<c:if test="${not empty error}">
    <p style="color: red;" align="center">${error}</p>
</c:if>

<c:if test="${not empty success}">
    <p style="color: green;" align="center">${success}</p>
</c:if>

</body>
</html>
