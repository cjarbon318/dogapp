<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Adoption Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        fieldset {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            background-color: #f9f9f9;
        }
        legend {
            font-size: 1.2em;
            font-weight: bold;
            color: #007bff;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }
        form:input {
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
            margin-top: 10px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Adoption Form</h1>
        <c:if test="${not empty errorMessage}">
            <div class="error-message">${errorMessage}</div>
        </c:if>
        <form:form method="post" action="${pageContext.request.contextPath}/adopters/apply" modelAttribute="adopter">
            <fieldset>
                <legend>Application Details</legend>

                <label for="name">Name:</label>
                <form:input path="name" id="name" required="true"/>

                <label for="email">Email:</label>
                <form:input path="email" id="email" type="email" required="true"/>

                <label for="address">Address:</label>
                <form:input path="address" id="address" required="true"/>

                <label for="interest">Interested in (Adopting/Fostering):</label>
                <form:input path="interest" id="interest" required="true"/>

                <label for="experience">Have you had experience with dogs/pets?:</label>
                <form:input path="experience" id="experience" required="true"/>

                <label for="dogId">Is there a particular dog you are interested in adopting/fostering?:</label>
                <form:input path="dogId" id="dogId"/>

                <input type="submit" value="Submit" />
            </fieldset>
        </form:form>
    </div>
</body>
</html>
