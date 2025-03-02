<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Candidate Results - EduQuest</title>
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
            margin-bottom:80px;
            width: 80%;
            max-width: 600px;
        }
        @keyframes containerAnimation {
            0% {
                transform: translateY(-20px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }
        h2 {
            font-size: 2em;
            color: #50C9C3;
        }
        .input-box {
            margin: 15px 0;
        }
        .input-box input {
            padding: 10px;
            width: 80%;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .input-box button {
            padding: 10px 15px;
            background-color: #50C9C3;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        .input-box button:hover {
            background-color: #4A90E2;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        table th, table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        table th {
            background-color: #50C9C3;
            color: white;
        }
        .no-result {
            color: red;
            font-weight: bold;
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
        <h2>Candidate Exam Results</h2>

        <form method="get">
            <div class="input-box">
                <label>Enter Candidate ID:</label>
                <input type="text" name="candidate_id" required>
                <button type="submit">Search</button>
            </div>
        </form>

        <%
            String candidateId = request.getParameter("candidate_id");
            if (candidateId != null && !candidateId.isEmpty()) {
                Connection c = null;
                PreparedStatement p = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    c = DriverManager.getConnection("jdbc:mysql://localhost:3306/eduquest", "root", "shreya");
                    String query = "SELECT * FROM result WHERE candidate_id = ?";
                    p = c.prepareStatement(query);
                    p.setInt(1, Integer.parseInt(candidateId));
                    rs = p.executeQuery();

                    if (rs.next()) {
        %>

        <table>
            <tr>
                <th>Candidate ID</th>
                <th>Name</th>
                <th>Result ID</th>
                <th>Marks Scored</th>
            </tr>
            <%
                do {
            %>
            <tr>
                <td><%= rs.getInt("candidate_id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getInt("result_id") %></td>
                <td><%= rs.getInt("marks") %></td>
            </tr>
            <%
                } while (rs.next());
            %>
        </table>

        <%
                    } else {
        %>
        <p class="no-result">No results found for Candidate ID: <%= candidateId %></p>
        <%
                    }
                } catch (Exception e) {
                    out.println("<p class='no-result'>Error: " + e.getMessage() + "</p>");
                } finally {
                    if (rs != null) rs.close();
                    if (p != null) p.close();
                    if (c != null) c.close();
                }
            }
        %>
    </div>

    <div class="footer">
        <p>Developed by Shreya</p>
    </div>
</body>
</html>
