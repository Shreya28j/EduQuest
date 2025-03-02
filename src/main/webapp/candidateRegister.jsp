<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Candidate Registration - EduQuest</title>
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
        align-items: center;
        justify-content: center;
        min-height: 100vh;
        color: #343a40;
        position: relative;
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
    }

    .navbar .logo-container {
        background-color: #f8f9fa;
        padding: 5px;
        border-radius: 5px;
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

    .container {
        background-color: white;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        text-align: center;
        max-width: 430px;
        width: 90%;
        margin: auto;
        margin-top: 80px;
        margin-bottom: 80px;
        animation: fadeIn 0.8s ease-in-out;
    }

    @keyframes fadeIn {
        0% { opacity: 0; transform: translateY(-20px); }
        100% { opacity: 1; transform: translateY(0); }
    }

    h2 {
        font-size: 2em;
        color: #50C9C3;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 5px;
        margin-top: -15px; 
        margin-bottom: 20px;
    }

    label {
        display: block;
        font-weight: bold;
        margin: 6px 0 3px;
        text-align: left;
    }

    input {
        width: 90%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    button {
        background-color: #50C9C3;
        color: white;
        border: none;
        padding: 10px 14px;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        border-radius: 8px;
        width: auto;
        transition: 0.3s;
        margin-top: 15px;
    }

    button:hover {
        opacity: 0.85;
            transform: scale(1.05);
    }
     .container .message {
            margin-top: 20px;
            font-size: 16px;
            color: #555;
        }

        .container .message a {
            color: #50C9C3;
            text-decoration: none;
            font-weight: bold;
        }

        .container .message a:hover {
            text-decoration: underline;
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
        <div class="logo-container"><img class="logo" src="images/4.png" alt="EduQuest Logo"></div>
        <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="admin.jsp"><i class="fas fa-user-cog"></i> Admin</a>
        <a href="candidate.jsp"><i class="fas fa-user-graduate"></i> Candidate</a>
        <a href="about.jsp"><i class="fas fa-info-circle"></i> About</a>
    </div>

    <div class="container">
        <h2><i class="fas fa-user-plus"></i> Candidate Registration</h2>
        <form action="candidateRegister1.jsp" method="post">
            <label for="candidate_id">Candidate ID:</label>
            <input type="text" id="candidate_id" name="candidate_id" placeholder="Enter your Candidate ID" required>

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your Name" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your Password" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter your Email" required>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" placeholder="Enter your Address" required>

            <button type="submit">Register</button>
        </form>
        <div class="message">
            Already have an account? <a href="candidateLogin.jsp">Login here</a>
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
