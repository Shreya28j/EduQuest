<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Candidate Exam Paper - EduQuest</title>
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
        padding: 6px 10px;
        display: flex;
        align-items: center;
        justify-content: flex-start;
        gap: 10px;
        position: fixed;
        width: 100%;
        top: 0;
        z-index: 1000;
        height: 30px;
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
        height: 50px;
    }

    .navbar a:hover {
        background-color: rgba(255, 255, 255, 0.3);
        transform: scale(1.1);
    }

    h1 {
        font-size: 2.5em;
        color: #50C9C3;
        margin-top: 60px;
        margin-bottom: 2px;
        text-align: center;
    }

    .container {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        text-align: left;
        margin-top: 60px;
        width: 90%;
    }
    .form-group {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 100%;
        max-width: 800px;
        margin-bottom: 15px;
    }
    .form-group label {
    Background-color: #FDE2E4;
        font-weight: bold;
        margin-right: 10px;
        white-space: nowrap;
    }
    .form-group input {
        flex: 1;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin-right: 20px;
    }
    .question {
        font-weight: bold;
        margin-bottom: 10px;
    }
    .options {
        display: flex;
        flex-direction: column;
        align-items: flex-beginning;
    }
    .button {
        display: block;
        margin: 20px auto;
        padding: 12px 18px;
        background-color: #50C9C3;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
        cursor: pointer;
        border: none;
        font-size: 18px;
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
        height: 30px;
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
    <h1>Online Examination</h1>
    <div class="container">
        <%@ page import="java.util.Random" %>
        <%
            Random rand = new Random();
            int resultID = rand.nextInt(100);
        %>
        <form action="result.jsp">
            <div class="form-group">
                <label for="candidateID">Candidate ID:</label>
                <input type="text" id="candidateID" name="candidateID" required>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
                <label for="resultID">Result ID:</label>
                <input type="text" id="resultID" name="resultID" value="<%= resultID %>" readonly>
            </div>
            <%@ page import = "java.sql.*" %>
            <%
                Connection c = null;
                String papercode = request.getParameter("n1");
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    c = DriverManager.getConnection("jdbc:mysql://localhost:3306/eduquest", "root", "shreya");
                    PreparedStatement p = c.prepareStatement("SELECT * FROM question WHERE papercode=?");
                    p.setString(1, papercode);
                    ResultSet r = p.executeQuery();
                    int i = 1;
                    while (r.next()) {
            %>
                <div class="question">Q<%= i %>. <%= r.getString(3) %></div>
                <div class="options">
                    <label><input type="radio" name="op<%= i %>" value="<%= r.getString(4) %>"> <%= r.getString(4) %></label>
                    <label><input type="radio" name="op<%= i %>" value="<%= r.getString(5) %>"> <%= r.getString(5) %></label>
                    <label><input type="radio" name="op<%= i %>" value="<%= r.getString(6) %>"> <%= r.getString(6) %></label>
                    <label><input type="radio" name="op<%= i %>" value="<%= r.getString(7) %>"> <%= r.getString(7) %></label>
                    <input type="hidden" name="a<%= i %>" value="<%= r.getString(8) %>">
                </div>
                <hr>
            <%
                    i++;
                    }
            %>
            <input type="hidden" name="count" value="<%= i %>">
            <input type="submit" class="button" value="Submit Test">
        </form>
        <%
                } catch (Exception e) {
                    out.print("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                }
        %>
    </div>
    <div class="footer">
        <p>Developed by Shreya</p>
    </div>
</body>
</html>