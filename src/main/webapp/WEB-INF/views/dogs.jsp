<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Dogs</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
            background-color: #f9f9f9;
        }
        h2, h3 {
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .section {
            margin-bottom: 30px;
        }
        .section h3 {
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
        }
        form {
            margin-top: 20px;
        }
        form label {
            display: block;
            margin: 5px 0;
        }
        form input[type="text"], form input[type="submit"], form input[type="hidden"] {
            display: block;
            margin: 5px 0;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        form input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        form input[type="submit"]:hover {
            background-color: #45a049;
        }
        .success-message {
            color: #4CAF50;
            font-weight: bold;
            margin-top: 20px;
        }
        .link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
        }
        .link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Manage Dogs</h2>

        <!-- Success Message -->
        <c:if test="${not empty successMessage}">
            <p class="success-message">${successMessage}</p>
        </c:if>

        <!-- List of Dogs -->
        <div class="section">
            <h3>List of Dogs</h3>
            <c:forEach var="dog" items="${dogs}">
                <p>${dog.name} - ${dog.age} - ${dog.breed}</p>
            </c:forEach>
        </div>

        <!-- Add Dog Form -->
        <div class="section">
            <h3>Add New Dog</h3>
            <form:form action="/admin/dogs/add" method="post" modelAttribute="dog">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <label for="name">Name:</label>
                <form:input path="name" id="name" />
                <label for="age">Age:</label>
                <form:input path="age" id="age" />
                <label for="breed">Breed:</label>
                <form:input path="breed" id="breed" />
                <input type="submit" value="Add Dog" />
            </form:form>
        </div>

        <!-- Delete Dog Form -->
        <div class="section">
            <h3>Delete Dog</h3>
            <form action="/admin/dogs/delete" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <label for="dogName">Dog Name:</label>
                <input type="text" id="dogName" name="name" />
                <input type="submit" value="Delete Dog" />
            </form>
        </div>

        <!-- Back to Admin Page -->
        <a class="link" href="/admin">Back to Admin Page</a>
    </div>
</body>
</html>
