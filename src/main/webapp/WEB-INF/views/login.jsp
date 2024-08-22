<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
        }
        .container {
            max-width: 400px;
            width: 100%;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        form input[type="text"], 
        form input[type="password"], 
        form input[type="submit"] {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        form input[type="text"], 
        form input[type="password"] {
            font-size: 16px;
        }
        form input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 18px;
        }
        form input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Admins, please login below</h2>
        <form:form action="/login" method="post" modelAttribute="command">
            <form:input path="username" placeholder="Username" />
            <form:input path="password" type="password" placeholder="Password" />
            <input type="submit" value="Login" />
        </form:form>
        <c:if test="${not empty errorMessage}">
            <p class="error-message">${errorMessage}</p>
        </c:if>
    </div>
</body>
</html>
