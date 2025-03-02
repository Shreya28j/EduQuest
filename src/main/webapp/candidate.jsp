<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Candidate Panel - EduQuest</title>
    <link rel="icon" href="images/4.png" type="image/png">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
       body {
            font-family: 'Poppins', sans-serif;
            background: #E8FAF9;
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
            transition: opacity 0.3s ease, transform 0.3s ease;
        }

        body.page-transition {
            opacity: 0;
            transform: translateY(20px); 
        }

        body::before, body::after {
            content: "";
            position: absolute;
            width: 500px;
            height: 500px;
            border-radius: 50%;
            opacity: 0.2;
            z-index: -1;
            animation: blobAnimation 8s infinite linear; 
        }

        body::before {
            background: #B0C4DE;
            top: -100px;
            left: -100px;
        }

        body::after {
            background: #4682B4;
            bottom: -150px;
            right: -150px;
            animation-delay: 4s; /* Offset animation delay */
        }

        @keyframes blobAnimation {
            0% {
                transform: translate(0, 0);
            }
            50% {
                transform: translate(-20px, 10px); /* Example movement */
            }
            100% {
                transform: translate(0, 0);
            }
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
            margin-left:8px;
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
        .candidate-container {
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
            max-width: 400px;
            margin-top: 20px;
            animation: containerAnimation 0.8s ease-in-out;
        }

        @keyframes containerAnimation {
            0% {
                transform: translateY(-20px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .candidate-container h1 {
            font-size: 2.5em;
            margin-top: 1px;
            color: #50C9C3;
            display: flex;
            align-items: center;
            justify-content: center; 
        }

        .candidate-container h1 i {
            margin-right: 10px; 
            color: #50C9C3; /
        }


        .candidate-instructions {
            font-size: 16px;
            color: #555;
            margin-bottom: 25px;

        }

        .btn-container {
            display: flex;
            justify-content: center;
            gap: 25px;
            flex-wrap: wrap;
        }

        .btn {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 14px 22px;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            border: none;
            cursor: pointer;
            border-radius: 8px;
            transition: 0.3s;
            text-decoration: none;
            width: 220px;
        }

        .btn i {
            margin-right: 12px;
            font-size: 20px;
        }

        .btn-register {
            background-color: #4A90E2;
            color: white;
        }

        .btn-login {
            background-color: #50C9C3;
            color: white;
        }

        .btn:hover {
            opacity: 0.85;
            transform: scale(1.05);
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
        <a href="about.jsp"><i class="fas fa-info-circle"></i> About</a>
    </div>

    <div class="candidate-container">
        <h1><i class="fas fa-user-graduate"></i>Candidate Panel</h1>
        <p class="candidate-instructions">
            Welcome to the Candidate Section. Please register if you are a new candidate, or log in if you already have an account.
        </p>
        <div class="btn-container">
            <a href="candidateRegister.jsp" class="btn btn-register"><i class="fas fa-user-plus"></i> Register</a>
            <a href="candidateLogin.jsp" class="btn btn-login"><i class="fas fa-sign-in-alt"></i> Login</a>
        </div>
    </div>

    <div class="footer">
        <p>Developed by Shreya</p>
    </div>

    <script>
    const links = document.querySelectorAll('a');

    links.forEach(link => {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            document.body.classList.add('page-transition');

            setTimeout(() => {
                window.location.href = this.href;
            }, 300); 
        });
    });
    </script>

</body>
</html>