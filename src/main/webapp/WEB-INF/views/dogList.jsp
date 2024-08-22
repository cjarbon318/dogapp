<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dog List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #0066cc;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #333;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px 0;
            font-size: 16px;
            text-align: center;
            color: #fff;
            background-color: #0066cc;
            text-decoration: none;
            border-radius: 5px;
            border: none;
        }
        .button:hover {
            background-color: #004d99;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>List of Adoptable Dogs</h1>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Breed</th>
                    <th>Size</th>
                    <th>Age</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${dogs}" var="dog">
                    <tr>
                        <td><c:out value="${dog.name}" /></td>
                        <td><c:out value="${dog.breed}" /></td>
                        <td><c:out value="${dog.size}" /></td>
                        <td><c:out value="${dog.age}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/" class="button">Return to Home Page</a>
    </div>
</body>
</html>
