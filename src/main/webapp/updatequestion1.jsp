<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Question 1 - EduQuest</title>
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
    .navbar a {
        text-decoration: none;
        color: white;
        font-weight: bold;
        padding: 8px 16px;
        transition: background 0.3s ease;
        border-radius: 5px;
        display: flex;
        align-items: center;
        gap: 8px;
    }
    .navbar a:hover {
        background-color: rgba(255, 255, 255, 0.3);
        transform: scale(1.1);
    }
     
          body::before, body::after {
            content: "";
            position: absolute;
            width: 250px; 
            height: 250px; 
            border-radius: 50%;
            opacity: 0.7;
            z-index: -1;
            transition: transform 0.8s ease-in-out;
        }

        body::before {
            background-color: #BDD5EA; 
            top: 50%;
            left: 25%; 
            animation: shapeAnimation 10s infinite alternate linear;
        }

        body::after {
            background-color: #F8D9DC; 
            bottom: 40%; 
            right: 25%; 
            animation: shapeAnimation 12s infinite alternate-reverse linear;
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
        max-width: 450px;
        margin-top: 80px;
        position: relative;
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
    .message {
        color: #4D7BAF;
        font-weight: bold;
        margin-top: 20px;
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
   
    @keyframes floatAnimation {
        0% { transform: translateY(0); }
        100% { transform: translateY(-10px); }
    }
</style>
</head>
<body>
    <div class="navbar">
        <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="admin.jsp"><i class="fas fa-user-cog"></i> Admin</a>
        <a href="candidate.jsp"><i class="fas fa-user-graduate"></i> Candidate</a>
        <a href="about.jsp"><i class="fas fa-info-circle"></i> About</a>
    </div>

    <div class="container">
        <h2>Update Question 1</h2>
        <% 
            String qid = request.getParameter("qid");
            int qId = Integer.parseInt(qid);
            String papercode = request.getParameter("papercode");
            String question = request.getParameter("question");
            String option1 = request.getParameter("option1");
            String option2 = request.getParameter("option2");
            String option3 = request.getParameter("option3");
            String option4 = request.getParameter("option4");
            String ans = request.getParameter("ans");
            Connection c = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                c = DriverManager.getConnection("jdbc:mysql://localhost:3306/eduquest", "root", "shreya");
                PreparedStatement p = c.prepareStatement("UPDATE question SET papercode=?, question=?, option1=?, option2=?, option3=?, option4=?, ans=? WHERE qid=?");
                p.setString(1, papercode);
                p.setString(2, question);
                p.setString(3, option1);
                p.setString(4, option2);
                p.setString(5, option3);
                p.setString(6, option4);
                p.setString(7, ans);
                p.setInt(8, qId);
                int i = p.executeUpdate();
                if (i == 1) {
                    out.print("<div class='message'>Question updated successfully</div>");
                } else {
                    out.print("<div class='message'>Question not updated</div>");
                }
            } catch (Exception e) {
                out.println("<div class='message'>Exception occurred: " + e.getMessage() + "</div>");
            } finally {
                if (c != null) c.close();
            }
        %>
    </div>
    
    <div class="footer">
        <p>Developed by Shreya</p>
    </div>
</body>
</html>