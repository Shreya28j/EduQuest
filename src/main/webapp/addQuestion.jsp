<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Question - EduQuest</title>
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
    }

    .container {
        background-color: #E3EFF7;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        text-align: center;
        max-width: 500px;
        margin-top: 100px;
        margin-top: 40px;
    }

    h2 {
        color: #F4A87D;
        margin-bottom: 20px;
    }

    .message {
        background-color:#D6E6F2 ;
        padding: 10px;
        border-radius: 5px;
        margin-top: 20px;
        color: #4A90E2;
        font-weight: bold;
    }
     
    .back-btn {
        background-color: #4A90E2;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin-top: 15px;
    }
    .back-btn:hover {
        background-color: #357ABD;
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
        <h2>Add New Question</h2>
        <%
            String qid = request.getParameter("n1");
            if (qid != null && !qid.isEmpty()) {
                int quesid = Integer.parseInt(qid);
                String pcode = request.getParameter("n2");
                String question = request.getParameter("n3");
                String op1 = request.getParameter("n4");
                String op2 = request.getParameter("n5");
                String op3 = request.getParameter("n6");
                String op4 = request.getParameter("n7");
                String ans = request.getParameter("n8");

                Connection c = null;
                PreparedStatement p = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    c = DriverManager.getConnection("jdbc:mysql://localhost:3306/eduquest", "root", "shreya");
                    String sql = "INSERT INTO question (qid, papercode, question, option1, option2, option3, option4, ans) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                    p = c.prepareStatement(sql);
                    p.setInt(1, quesid);
                    p.setString(2, pcode);
                    p.setString(3, question);
                    p.setString(4, op1);
                    p.setString(5, op2);
                    p.setString(6, op3);
                    p.setString(7, op4);
                    p.setString(8, ans);
                    int rows = p.executeUpdate();
                    if (rows > 0) {
                    	 out.println("<div class='message'>Question added successfully!</div>");
                         response.sendRedirect("uploadPaper.jsp");
                     } else {
                         out.println("<div class='message'>Failed to add question.</div>");
                     }
                 } catch (SQLIntegrityConstraintViolationException e) {
                     out.println("<div class='message'>Duplicate entry detected. Please try again.</div>");
                     out.println("<button class='back-btn' onclick='history.back()'>Retry</button>");
                 } catch (Exception e) {
                     out.println("<div class='message'>Error: " + e.getMessage() + "</div>");
                 } finally {
                     if (p != null) p.close();
                     if (c != null) c.close();
                 }
             } else {
                 out.println("<div class='message'>Question ID is required.</div>");
             }
        %>
    </div>

    <div class="footer">
        <p>Developed by Shreya</p>
    </div>
</body>
</html>