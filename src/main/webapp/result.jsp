<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Exam Result - EduQuest</title>
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
        text-align: center;
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
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
    margin-top: 100px; 
    margin-bottom: 80px; 
    width: 80%;
    max-width: 500px;
}

    h1 {
        font-size: 2.5em;
        color: #50C9C3;
        margin-bottom: 15px;
    }
    .result-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
    }
    .result-table th, .result-table td {
        padding: 10px;
        border: 1px solid #ddd;
        text-align: left;
    }
    .result-table th {
        background-color: #50C9C3;
        color: white;
    }
    .score {
        font-size: 22px;
        font-weight: bold;
        color: #4A90E2;
    }
    .back-home {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 15px;
        background-color: #50C9C3;
        color: white;
        text-decoration: none;
        font-weight: bold;
        border-radius: 5px;
        transition: 0.3s;
    }
    .back-home:hover {
        background-color: #4A90E2;
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
        <h1>Exam Result</h1>

        <%
            int count = 0;
            String noofquestions = request.getParameter("count");
            int noq = Integer.parseInt(noofquestions) - 1; 

            for (int i = 1; i <= noq; i++) {
                String op = request.getParameter("op" + i);
                String ans = request.getParameter("a" + i);

                if (op != null && op.equals(ans)) {
                    count++;
                }
            }

            String candidateID = request.getParameter("candidateID");
            int candidateID1 = Integer.parseInt(candidateID);
            String name = request.getParameter("name");
            String resultID = request.getParameter("resultID");
            int resultID1 = Integer.parseInt(resultID);

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eduquest", "root", "shreya");

                String sql = "INSERT INTO result (result_id, candidate_id, name, marks) VALUES (?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, resultID1);
                pstmt.setInt(2, candidateID1);
                pstmt.setString(3, name);
                pstmt.setInt(4, count);

                int rowsInserted = pstmt.executeUpdate();
                if (rowsInserted > 0) {
        %>

        <table class="result-table">
            <tr><th>Result ID</th><td><%= resultID %></td></tr>
            <tr><th>Candidate ID</th><td><%= candidateID %></td></tr>
            <tr><th>Name</th><td><%= name %></td></tr>
            <tr><th>Marks Scored</th><td><%= count %></td></tr>
            <tr><th>Total Marks</th><td><%= noq %></td></tr>
        </table>

        <p style='color:green; font-weight:bold;'>Result successfully saved!</p>

        <% 
                } else {
                    out.println("<p style='color:red; font-weight:bold;'>Failed to save the result.</p>");
                }
                conn.close();
            } catch (Exception e) {
                out.println("<p style='color:red; font-weight:bold;'>Error: " + e.getMessage() + "</p>");
            }
        %>

        <% if (count == 0) { %>
            <p class="score">Oops! You have scored <%= count %> out of <%= noq %>. Better luck next time!</p>
        <% } else { %>
            <p class="score">Congratulations! You have scored <%= count %> out of <%= noq %></p>
        <% } %>

        <a href="index.jsp" class="back-home">Home</a>
    </div>

    <div class="footer">
        <p>Developed by Shreya</p>
    </div>

   

</body>
</html>
