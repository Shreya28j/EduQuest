<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Question Paper - EduQuest</title>
<link rel="icon" href="images/4.png" type="image/png">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(to right, #D6E6F2, #FDE2E4);
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
        align-items: center;
        justify-content: center;
        color: #343a40;
        position: relative;
        overflow: hidden;
    }
    .navbar {
        background: linear-gradient(to right, #4A90E2, #50C9C3);
        padding: 8px 12px;
        display: flex;
        align-items: center;
        justify-content: flex-start;
        gap: 15px;
        position: fixed;
        width: 100%;
        top: 0;
        z-index: 1000;
    }
    .navbar a {
        text-decoration: none;
        color: white;
        font-weight: bold;
        padding: 8px 16px;
        border-radius: 5px;
        display: flex;
        align-items: center;
        gap: 8px;
        font-size: 18px;
    }
    .container {
        background-color: #E3EFF7;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        text-align: center;
        width: 280px;
        height: 350px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin: auto;
    }
    .container h2 {
        color: #FF5733;
        margin-bottom: 20px;
        margin-top: -30px;
        animation: fadeIn 1s ease-in-out;
    }
    .container form {
        display: flex;
        flex-direction: column;
        gap: 15px;
        width: 90%;
        align-items: center;
    }
    .container label {
        font-size: 16px;
        font-weight: bold;
        color: #333;
    }
    .container input[type="text"] {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        width: 100%;
        box-sizing: border-box;
        text-align: center;
    }
    .container input[type="submit"] {
        background-color: #F4A87D;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 18px;
        width: 120px;
        text-align: center;
        margin-top: 20px;
    }
    .container input[type="submit"]:hover {
        background-color: #F15A6D;
    }
    .footer {
        background: linear-gradient(to right, #4A90E2, #50C9C3);
        color: white;
        padding: 5px;
        text-align: center;
        font-size: 13px;
        position: fixed;
        bottom: 0;
        width: 100%;
    }
    body::before, body::after {
        content: "";
        position: absolute;
        width: 250px;
        height: 250px;
        border-radius: 50%;
        opacity: 0.7;
        z-index: -1;
    }
    body::before {
        background-color: #BDD5EA;
        top: 10%;
        left: 1%;
        animation: shapeFloat 8s infinite alternate ease-in-out;
    }
    body::after {
        background-color: #F8D9DC;
        bottom: 8%;
        right: 1%;
        animation: shapeFloat 10s infinite alternate-reverse ease-in-out;
    }
    @keyframes shapeFloat {
        0% { transform: scale(1); }
        50% { transform: scale(1.2); }
        100% { transform: scale(1); }
    }
    @keyframes fadeIn {
        0% { opacity: 0; transform: translateY(-10px); }
        100% { opacity: 1; transform: translateY(0); }
    }
</style>
</head>
<body>
    <div class="navbar">
        <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="admin.jsp"><i class="fas fa-user-cog"></i> Admin</a>
        <a href="candidate.jsp"><i class="fas fa-user-graduate"></i> Candidate</a>
        <a href="about.jsp"><i class="fas fa-info-circle"></i> About</a>
    </div>
    <div class="container">
        <h2>Edit Question Paper</h2>
        <form action="editq1.jsp">
            <label for="qid">Enter Question ID:</label>
            <input type="text" id="qid" name="n1" placeholder="Enter Question ID">
            <input type="submit" value="Search">
        </form>
    </div>
    <div class="footer">
        <p>Developed by Shreya</p>
    </div>
</body>
</html>