<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About EduQuest</title>
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
            justify-content: flex-start;
            color: #343a40;
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

        .about-container {
            background-color: white;
            padding: 10px 10px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 800px;
            width: 90%;
            margin-top: 60px;
            margin-bottom: 20px;
            transform: translateY(-10px);
        }

        .content-wrapper {
            flex-grow: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
        }

        .about-container h1 {
            font-size: 2.3em;
            font-weight: bold;
            margin-bottom: 15px;
            background: linear-gradient(to right, #4A90E2, #50C9C3);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            transform: translateY(-5px);
        }

        .about-container p.intro {
            font-size: 1.1em;
            color: #555;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .about-content {
            text-align: left;
            margin-top: 15px;
            padding: 15px 20px;
        }

        .feature {
            display: flex;
            align-items: flex-start;
            gap: 15px;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }

        .feature:last-child {
            border-bottom: none;
        }

        .feature i {
            color: #4A90E2;
            font-size: 24px;
            min-width: 40px;
            text-align: center;
            margin-top: 5px;
        }

        .feature-content {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .feature-content strong {
            font-size: 1.1em;
            color: #333;
        }

        .feature-content p {
            font-size: 1em;
            color: #555;
            margin: 0;
            line-height: 1.4;
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
    </style>
</head>
<body>

    <div class="navbar">
        <div class="logo-container">
            <img class="logo" src="images/4.png" alt="EduQuest Logo">
        </div>
        <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="admin.jsp"><i class="fas fa-user-cog"></i> Admin</a>
        <a href="candidate.jsp"><i class="fas fa-user-graduate"></i> Candidate</a>
        <a href="about.jsp"><i class="fas fa-info-circle"></i> About</a>
    </div>

    <div class="content-wrapper">
        <div class="about-container">
            <h1>About EduQuest</h1>
            <p class="intro">EduQuest is an online examination platform that simplifies test-taking, result calculation, and management.</p>

            <div class="about-content">
                <div class="feature">
                    <i class="fas fa-user-shield"></i>
                    <div class="feature-content">
                        <strong>Admin Features</strong>
                        <p>Admins can register, log in, and manage the examination process.</p>
                    </div>
                </div>

                <div class="feature">
                    <i class="fas fa-book-open"></i>
                    <div class="feature-content">
                        <strong>Exam Paper Upload</strong>
                        <p>Admins can create and upload multiple-choice question papers.</p>
                    </div>
                </div>

                <div class="feature">
                    <i class="fas fa-user-graduate"></i>
                    <div class="feature-content">
                        <strong>Candidate Exam Participation</strong>
                        <p>Candidates can register, log in, and take exams easily.</p>
                    </div>
                </div>

                <div class="feature">
                    <i class="fas fa-poll"></i>
                    <div class="feature-content">
                        <strong>Automated Result Calculation</strong>
                        <p>Results are calculated and displayed automatically.</p>
                    </div>
                </div>

                <div class="feature">
                    <i class="fas fa-chart-line"></i>
                    <div class="feature-content">
                        <strong>Performance Analysis</strong>
                        <p>EduQuest provides insights into candidate performance.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>Developed by Shreya</p>
    </div>

</body>
</html>