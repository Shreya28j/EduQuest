<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Candidate Exam - EduQuest</title>
<link rel="icon" href="images/4.png" type="image/png">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(to right, #E8FAF9, #FDE2E4);
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
        color: #343a40;
        position: relative;
        animation: fadeIn 0.8s ease-in-out;
    }

    @keyframes fadeIn {
        0% { opacity: 0; transform: translateY(-20px); }
        100% { opacity: 1; transform: translateY(0); }
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
        margin-top: 40px; 
        margin-bottom: 50px;
        width: 400px; 
    }

    h1 {
        font-size: 2em;
        color: #50C9C3;
        margin-bottom: 20px;
    }

    p {
        margin-bottom: 15px;
    }

    input[type="text"] {
        width:90%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box; 
    }

    .button {
        display: inline-block;
        padding: 10px 15px;
        background-color: #50C9C3;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
        cursor: pointer;
        width:auto;
        border: none;
    }

    .button:hover {
        
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
    .footer-image {
            position: absolute;
            right: 10px; 
            bottom: 55px;
            height: 210px;
        }
        @keyframes flipImage {
    0% {
        transform: rotateY(0deg);
        opacity: 0;
    }
    100% {
        transform: rotateY(360deg);
        opacity: 1;
    }
}
   

.footer-image {
    position: absolute;
    right: 10px; 
    bottom: 55px;
    height: 210px;
    animation: flipImage 1s ease-in-out forwards;
    opacity: 0;
    mix-blend-mode: multiply;
}
        
       .left-image {
    position: absolute;
    left: 10px;
    bottom: 35%; 
    transform: translateY(50%); 
    height: 400px; 
    mix-blend-mode: multiply;
    background-color: #E8FAF9; 
    opacity: 1; 
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

    <h1>Candidate Exam</h1>

    <div class="container">
        <p>Enter the paper code to start the test</p>
        <form action="candidateTest1.jsp">
            <input type="text" name="n1" placeholder="Enter Paper Code" required>
            <input type="submit" class="button" value="Start Test">
        </form>
    </div>
         <img class="footer-image" src="images/9.png" alt="Footer Image">
         <img class="left-image" src="images/6.jpg" alt="Left Image"> 

    <div class="footer">
        <p>Developed by Shreya</p>
    </div>
    <script>
    window.onload = function() {
        document.querySelector('.footer-image').style.opacity = "1";
    };
</script>
</body>
</html>