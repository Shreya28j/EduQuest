<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home - EduQuest</title>
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
            transition: opacity 0.5s ease; 
        }
         body.page-transition-out {
            opacity: 0; 
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
            animation-delay: 4s; 
        }

        @keyframes blobAnimation {
            0% {
                transform: translate(0, 0);
            }
            50% {
                transform: translate(-20px, 10px); 
            }
            100% {
                transform: translate(0, 0);
            }
        }

    @keyframes fadeIn {
        0% { opacity: 0; transform: translateY(-20px); }
        100% { opacity: 1; transform: translateY(0); }
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

        .welcome-message {
            color: #5C9ED8;
            font-size: 2.5em;
            margin-bottom: 20px;
            text-align: center;
            animation: fadeInUp 1s ease-in-out;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .container {
            background-color: #E3EFF7;
            padding: 50px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
            max-width: 450px;
            margin-top: 20px;
            animation: containerAnimation 0.8s ease-in-out;
            position: relative;
            overflow: hidden;
        }
        .exam-management h2 {
            margin-top: -12px;
            color: #F4A87D;
            margin-bottom: 20px;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 30px;
        }

        .upload-btn, .edit-btn {
            background-color: #F4A87D;
            color: white;
            padding: 20px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .upload-btn:hover, .edit-btn:hover {
            background-color: #F15A6D;
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
            left: 20px; 
            bottom: 60px;
            height: 250px; 
        }
    </style>
     <script>
        document.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', function(event) {
                event.preventDefault();
                document.body.classList.add('page-transition-out');
                setTimeout(() => {
                    window.location.href = this.href;
                }, 500); 
            });
        });
    </script>
</head>
<body>

    <div class="navbar">
        <div class="logo-container"> <img class="logo" src="images/4.png" alt="EduQuest Logo"> </div>
        <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="admin.jsp"><i class="fas fa-user-cog"></i> Admin</a>
        <a href="candidate.jsp"><i class="fas fa-user-graduate"></i> Candidate</a>
        <a href="about.jsp"><i class="fas fa-info-circle"></i> About</a>
    </div>

    <div class="welcome-message">Welcome Admin !</div>

    <div class="container">

        <div class="exam-management">
            <h2>Exam Management</h2>
            <div class="button-group">
                <button class="upload-btn" onclick="location.href='uploadPaper.jsp'">Upload Paper</button>
                <button class="edit-btn" onclick="location.href='editq.jsp'">Edit Questions</button>
            </div>
        </div>
    </div>
     <img class="footer-image" src="images/8.png" alt="Footer Image">
     
    <div class="footer">
        <p>Developed by Shreya</p>
    </div>

</body>
</html>