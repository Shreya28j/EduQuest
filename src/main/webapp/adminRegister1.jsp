<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Registration - EduQuest</title>
     <link rel="icon" href="images/4.png" type="image/png">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #D6E6F2;
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

       body::before, body::after {
            content: "";
            position: absolute;
            width: 350px;
            height: 200px;
            background-color: rgba(70, 130, 180, 0.2);
            z-index: -1;
            animation: pulse 8s infinite alternate linear;
            opacity: 0.4;
            border-radius: 10px;
        }

        body::before {
            top: 20px;
            left: 20px;
            transform-origin: center;
        }

        body::after {
            bottom: 20px;
            right: 20px;
            animation-delay: 4s;
            transform-origin: center;
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
                opacity: 0.4;
            }
            50% {
                transform: scale(1.1);
                opacity: 0.8;
            }
            100% {
                transform: scale(1);
                opacity: 0.4;
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

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
            max-width: 400px;
            margin-top: 60px;
            transform: translateY(-10px);
            animation: containerAnimation 0.8s ease-in-out;
        }

        @keyframes containerAnimation {
            0% { transform: translateY(-20px); opacity: 0; }
            100% { transform: translateY(0); opacity: 1; }
        }

        .container h3 {
            font-size: 2em;
            margin-top: 0;
            color: #4A90E2;
            display: flex;
            align-items: center;
            justify-content: center;
            white-space: nowrap;
        }

        .container h3 i {
            margin-right: 8px;
            color: #4A90E2;
        }

        .container p {
            font-size: 1.2em;
            color: #555;
            margin-top: 20px;
        }
        .back-button { 
            background-color: #4A90E2;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        text-decoration: none;
        font-size: 16px;
        width: auto;
        }

        .back-button:hover {
            background-color: #336699;
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

    <div class="container">
       <%@page import = "java.sql.*" %>
       <%
       String email = request.getParameter("email");
       String password = request.getParameter("password");
       
       try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/eduquest" , "root" , "shreya");
           
           PreparedStatement p = c.prepareStatement("INSERT INTO administrator (emailid, password) VALUES(?, ?)");
           p.setString(1, email);
           p.setString(2, password);
           
           int i = p.executeUpdate();
           if(i == 1){
               response.sendRedirect("adminHome.jsp"); 
           }
           else{
               out.print("<p>Failed to register admin.</p>");
               out.print("<a href='adminRegister.jsp' class='back-button'>Register</a>");
           }
           c.close();
       }
       catch(Exception e){
           out.print("<p>Error: " + e.getMessage() + "</p>");
           out.print("<a href='adminRegister.jsp' class='back-button'>Register</a>"); 
       }
       %>
    </div>

    <div class="footer">
        <p>Developed by Shreya</p>
    </div>

</body>
</html>