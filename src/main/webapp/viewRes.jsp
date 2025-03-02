<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Result - EduQuest</title>
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
            height: 100vh;
            color: #343a40;
            text-align: center;
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
        .container {
            background-color: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
            width: 80%;
            max-width: 400px;
        }
        h2 {
            color: #50C9C3;
            margin-bottom: 15px;
        }
        label {
            font-size: 16px;
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }
        input {
            width: 90%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 16px;
        }
        button {
            background-color: #50C9C3;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
            width: auto;
        }
        button:hover {
        opacity: 0.85;
        transform: scale(1.05);
    }
         .footer {
        background: linear-gradient(to right, #4A90E2, #50C9C3);
        color: white;
        padding: 3px;
        position: fixed;
        bottom: 0;
        width: 100%;
        text-align: center;
        font-size: 14px;
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
        <h2>View Exam Result</h2>
        <form action="displayRes.jsp" method="post">
            <label for="candidate_id">Enter Candidate ID:</label>
            <input type="text" id="candidate_id" name="candidate_id" required>
            <button type="submit">View Result</button>
        </form>
    </div>
    
     <div class="footer">
        <p>Developed by Shreya</p>
    </div>
</body>
</html>
