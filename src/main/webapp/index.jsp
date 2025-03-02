<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EduQuest - Online Examination Portal</title>
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
            color: #343a40;
            align-items: center;
            justify-content: center;
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
            transition: all 0.3s ease;
        }

        .navbar .logo-container {
            background-color: #f8f9fa;
            padding: 5px;
            border-radius: 5px;
            margin-right: 15px;
            margin-left: 8px;
            display: flex;
            align-items: center;
        }

        .navbar .logo {
            height: 40px;
            margin-right: 0;
        }

        .navbar a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            padding: 8px 16px;
            cursor: pointer;
            transition: background 0.3s ease;
            border-radius: 5px;
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 18px;
        }

        .navbar a:hover {
            background-color: rgba(255, 255, 255, 0.3);
            transform: scale(1.1);
        }

        .hamburger {
            display: none;
            flex-direction: column;
            cursor: pointer;
            margin-left: auto;
        }

        .hamburger div {
            width: 25px;
            height: 3px;
            background-color: white;
            margin: 4px;
            transition: all 0.3s ease;
        }

        @media (max-width: 768px) {
            .navbar a {
                display: none;
            }
            .hamburger {
                display: flex;
            }
            .navbar.active a {
                display: block;
                background-color: rgba(0, 0, 0, 0.8);
                width: 100%;
                text-align: center;
                padding: 10px 0;
            }
        }

        .hero {
            background-color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: left;
            padding: 40px 40px;
            max-width: 1100px;
            width: 90%;
            height: 55vh;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            position: relative;
            overflow: hidden;
            opacity: 0;
            transform: translateY(50px);
            animation: fadeInUp 1s ease forwards;
        }

        .hero::before {
            content: "";
            position: absolute;
            width: 500px;
            height: 120%;
            background: rgba(74, 144, 226, 0.2);
            border-radius: 50%;
            top: -10%;
            right: -150px;
            z-index: -1;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .hero-content {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 40px;
            flex-wrap: wrap;
            width: 100%;
        }

        .hero-text {
            flex: 1;
            text-align: left;
            max-width: 500px;
            animation: slideInLeft 1s ease-out;
        }

        .hero img {
            max-width: 550px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            flex: 1;
            animation: slideInRight 1s ease-out;
        }

        @keyframes slideInLeft {
            from { transform: translateX(-50px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        @keyframes slideInRight {
            from { transform: translateX(50px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        .hero h1 {
            font-size: 3.8em;
            font-weight: bold;
            margin-bottom: 10px;
            background: linear-gradient(to right, #4A90E2, #50C9C3);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        @media (max-width: 768px) {
            .hero-content {
                flex-direction: column;
                text-align: center;
            }
            .hero-text {
                text-align: center;
            }
            .hero img {
                order: -1;
                max-width: 100%;
                height: auto;
            }
        }

        .footer {
            background: linear-gradient(to right, #4A90E2, #50C9C3);
            color: white;
            padding: 2px;
            text-align: center;
            font-size: 13px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo-container"> <img class="logo" src="images/4.png" alt="EduQuest Logo"> </div>
        <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="admin.jsp"><i class="fas fa-user-cog"></i> Admin</a>
        <a href="candidate.jsp"><i class="fas fa-user-graduate"></i> Candidate</a>
        <a href="viewRes.jsp"><i class="fas fa-chart-bar"></i> View Result</a>
        <a href="about.jsp" style="margin-left: auto;"><i class="fas fa-info-circle"></i> About</a>
        <div class="hamburger" onclick="toggleNavbar()">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <div id="home" class="hero">
        <div class="hero-content">
            <div class="hero-text">
                <h1>Welcome to EduQuest</h1>
                <p>Seamless testing, automated results, and a user-friendly experience.</p>
            </div>
            <img src="images/1.jpg" alt="Online Exam Illustration">
        </div>
    </div>

    <div class="footer">
        <p>Developed by Shreya</p>
    </div>

    <script>
        function toggleNavbar() {
            document.querySelector('.navbar').classList.toggle('active');
        }
    </script>
</body>
</html>
