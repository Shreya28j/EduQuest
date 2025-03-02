<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Paper - EduQuest</title>
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
            color: #343a40;
            position: relative;
            overflow: hidden;
            transition: opacity 0.5s ease;
        }

        body.page-transition-out {
            opacity: 0;
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
          body::before, body::after {
            content: "";
            position: absolute;
            width: 250px; /* Adjust size as needed */
            height: 250px; /* Adjust size as needed */
            border-radius: 50%;
            opacity: 0.7;
            z-index: -1; /* Place behind other content */
            transition: transform 0.8s ease-in-out; /* Optional transition */
        }

        body::before {
            background-color: #BDD5EA; /* Color of the first shape */
            top: 10%; /* Adjust vertical position */
            left: 1%; /* Adjust horizontal position */
            animation: shapeAnimation 10s infinite alternate linear; /* Optional animation */
        }

        body::after {
            background-color: #F8D9DC; /* Color of the second shape */
            bottom: 8%; /* Adjust vertical position */
            right: 1%; /* Adjust horizontal position */
            animation: shapeAnimation 12s infinite alternate-reverse linear; /* Optional animation */
        }

        @keyframes shapeAnimation {
            0% { transform: scale(1); }
            50% { transform: scale(1.2); }
            100% { transform: scale(1); }
        }

        .container {
            background-color: #E3EFF7;
            padding: 40px; /* Reduced padding */
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 75%;
            margin-top: 90px; /* Adjusted margin to fit well between header and footer */
            margin-bottom: 85px;/* Adjusted margin top */
            animation: container Animation 0.8s ease-in-out;
            position: relative;
            overflow: hidden;
        }

        .container h2 {
            color: #F4A87D;
            margin-bottom: 25px;
            margin-top: 0; /* Aligned heading a bit higher */
        }

        .container form {
            display: flex;
            flex-direction: column;
            gap: 15px; /* Spacing between form elements */
            height: auto; /* Increase the form height */
        }

        .container input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box; /* Include padding in width */
        }

        .container input[type="submit"] {
            background-color: #F4A87D;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            white-space: nowrap;
            display: block;
            width: auto;
            margin: 0 auto;
            
        }

        .container input[type="submit"]:hover {
            background-color: #F15A6D;
        }

        .footer {
            background: linear-gradient(to right, #4A90E2, #50C9C3);
            color: white;
            padding: 2px; /* Increased padding */
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
            height: 150px;
            z-index: -2;
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
    <div class="container">
        <h2>Add New Question</h2>
        <form action="addQuestion.jsp">
            <input type="text" name="n1" placeholder="Enter Question ID" required>
            <input type="text" name="n2" placeholder="Enter Paper Code" required>
            <input type="text" name="n3" placeholder="Enter Question" required>
            <input type="text" name="n4" placeholder="Option 1" required>
            <input type="text" name="n5" placeholder="Option 2" required>
            <input type="text" name="n6" placeholder="Option 3" required>
            <input type="text" name="n7" placeholder="Option 4" required>
            <input type="text" name="n8" placeholder="Answer" required>
            <input type="submit" value="Add Question">
        </form>
    </div>
    <img class="footer-image" src="images/8.png" alt="Footer Image">
    <div class="footer">
        <p>Developed by Shreya</p>
    </div>
</body>
</html>
