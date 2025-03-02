<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Question - EduQuest</title>
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
            border-radius: 5px;
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 18px;
        }

        .navbar a:hover {
            background-color: rgba(255, 255, 255, 0.3);
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
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 75%;
            margin-top: 90px;
            margin-bottom: 85px;
            position: relative;
            overflow: hidden;
        }

        .container h2 {
            color: #F4A87D;
            margin-bottom: 25px;
        }

        .container form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .container input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .container input[type="submit"] {
            background-color: #F4A87D;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: auto;
            margin: 0 auto;
        }

        .container input[type="submit"]:hover {
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
            height: 150px;
            z-index: -2;
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
        <h2>Update Question</h2>
        <%
            String q_id = request.getParameter("n1");
            int qid = Integer.parseInt(q_id);
            Connection c = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                c = DriverManager.getConnection("jdbc:mysql://localhost:3306/eduquest", "root", "shreya");
                PreparedStatement p = c.prepareStatement("SELECT * FROM question WHERE qid=?");
                p.setInt(1, qid);
                ResultSet r = p.executeQuery();
                while (r.next()) {
        %>
        <form action="updatequestion1.jsp">
            <input type="text" name="qid" value="<%= r.getInt(1) %>" required>
            <input type="text" name="papercode" value="<%= r.getString(2) %>" required>
            <input type="text" name="question" value="<%= r.getString(3) %>" required>
            <input type="text" name="option1" value="<%= r.getString(4) %>" required>
            <input type="text" name="option2" value="<%= r.getString(5) %>" required>
            <input type="text" name="option3" value="<%= r.getString(6) %>" required>
            <input type="text" name="option4" value="<%= r.getString(7) %>" required>
            <input type="text" name="ans" value="<%= r.getString(8) %>" required>
            <input type="submit" value="Update Question">
        </form>
        <%
                }
            } catch (Exception e) {
                out.println("Exception occurred: " + e.getMessage());
            } finally {
                if (c != null) c.close();
            }
        %>
    </div>
    <div class="footer">
    <img class="footer-image" src="images/8.png" alt="Footer Image">
        <p>Developed by Shreya</p>
    </div>
</body>
</html>
