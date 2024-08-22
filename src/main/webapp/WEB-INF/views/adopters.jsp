<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Adopters</title>
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete the selected adopters?");
        }
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            text-align: center;
        }
        h3 {
            color: #555;
            margin-top: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .form-actions {
            text-align: center;
            margin: 20px 0;
        }
        .form-actions input[type="submit"] {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
        }
        .form-actions input[type="submit"]:hover {
            background-color: #c82333;
        }
        .success-message {
            color: green;
            text-align: center;
            margin: 20px 0;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Manage Adopters</h2>

        <!-- List of Adopters -->
        <h3>List of Adopters</h3>
        <form action="/admin/adopters/delete" method="post" onsubmit="return confirmDelete();">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <table>
                <thead>
                    <tr>
                        <th>Select</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Interest</th>
                        <th>Experience</th>
                        <th>Dog ID</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="adopter" items="${adopters}">
                        <tr>
                            <td><input type="checkbox" name="ids" value="${adopter.id}" /></td>
                            <td>${adopter.id}</td>
                            <td>${adopter.name}</td>
                            <td>${adopter.email}</td>
                            <td>${adopter.address}</td>
                            <td>${adopter.interest}</td>
                            <td>${adopter.experience}</td>
                            <td>${adopter.dogId}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="form-actions">
                <input type="submit" value="Delete Selected Adopters" />
            </div>
        </form>

        <!-- Success Message -->
        <c:if test="${not empty successMessage}">
            <div class="success-message">${successMessage}</div>
        </c:if>

        <!-- Back to Admin Page -->
        <a href="/admin" class="back-link">Back to Admin Page</a>
    </div>
</body>
</html>
