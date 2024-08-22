<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to DC Dogs Animal Shelter</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            overflow: hidden;
        }
        header {
            background: #333;
            color: #fff;
            padding-top: 30px;
            min-height: 70px;
            border-bottom: #ccc 1px solid;
            text-align: center;
        }
        header h1 {
            margin: 0;
            font-size: 24px;
        }
        .main-content {
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        ul {
            list-style: none;
            padding: 0;
        }
        ul li {
            margin: 10px 0;
        }
        ul li a {
            text-decoration: none;
            color: #0066cc;
            font-size: 18px;
        }
        ul li a:hover {
            text-decoration: underline;
        }
        .footer {
            background: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        .footer p {
            margin: 0;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <h1>Welcome to DC Dogs Animal Shelter</h1>
        </div>
    </header>

    <div class="container main-content">
        <h2>Please choose an option below:</h2>
        <ul>
            <!-- Link to view adoptable dogs -->
            <li><a href="${pageContext.request.contextPath}/dogs/list">View Adoptable Dogs</a></li>
            <!-- Link to apply for adoption or fostering -->
            <li><a href="${pageContext.request.contextPath}/adopters/apply">Apply to Adopt or Foster</a></li>
        </ul>

        <h2>Contact Us</h2>
        <p><strong>Address:</strong> 1234 Dogwood Lane, Washington DC, 20001</p>
        <p><strong>Phone:</strong> (202) 555-1234</p>
        <p><strong>Hours:</strong></p>
        <ul>
            <li>Monday: Closed</li>
            <li>Tuesday: Closed</li>
            <li>Wednesday - Friday: 10:00 AM - 6:00 PM</li>
            <li>Saturday - Sunday: 11:00 AM - 4:00 PM</li>
        </ul>

        <h2>Admin Login</h2>
        <ul>
            <li><a href="${pageContext.request.contextPath}/login">Admin Login</a></li>
        </ul>
    </div>

    <div class="footer">
        <p>&copy; 2024 DC Dogs Animal Shelter. All rights reserved.</p>
    </div>
</body>
</html>
