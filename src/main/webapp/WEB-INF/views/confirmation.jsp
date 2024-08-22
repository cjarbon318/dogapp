<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f9f9f9;
        }
        .container {
            max-width: 500px;
            width: 100%;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            color: #28a745;
            margin-bottom: 20px;
        }
        p {
            font-size: 18px;
            color: #333;
            margin-bottom: 30px;
        }
        a {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Application Submitted</h1>
        <p>${message}</p>
        <a href="/">Back to Home</a>
    </div>
</body>
</html>
