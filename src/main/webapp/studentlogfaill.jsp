<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>loginfail</title>
</head>
<body>
    <h2>login failed</h2>
    <p><c:out value="${msg}"/></p>
    <a href="studentLogin">try Again</a>
</body>
</html>
