<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Candidate" %>
<% List<Candidate> candidates = (List<Candidate>) request.getAttribute("candidates"); %>

<!DOCTYPE html>
<html lang="en">


<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Cast Your Vote</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Syne:wght@750;800&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Plus Jakarta Sans', sans-serif;
        }

        body {
            background: #030303;
            background-image: 
                radial-gradient(at 0% 0%, rgba(99, 102, 241, 0.15) 0px, transparent 50%),
                radial-gradient(at 100% 0%, rgba(168, 85, 247, 0.12) 0px, transparent 50%),
                linear-gradient(rgba(255, 255, 255, 0.015) 1px, transparent 1px),
                linear-gradient(90deg, rgba(255, 255, 255, 0.015) 1px, transparent 1px);
            background-size: 100% 100%, 100% 100%, 40px 40px, 40px 40px;
            color: #f4f4f5;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 60px 20px;
        }

        @keyframes reveal {
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
            width: 100%;
            max-width: 680px;
            margin: auto;
            animation: reveal 0.85s cubic-bezier(0.16, 1, 0.3, 1) forwards;
        }

        .header {
            text-align: center;
            margin-bottom: 40px;
        }

        .header h1 {
            font-family: 'Syne', sans-serif;
            font-size: 38px;
            font-weight: 800;
            margin-bottom: 12px;
            letter-spacing: -0.02em;
            background: linear-gradient(180deg, #ffffff 0%, #a1a1aa 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .header p {
            color: #a1a1aa;
            font-size: 15px;
            line-height: 1.5;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .card {
            background: rgba(20, 20, 23, 0.6);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 16px;
            padding: 24px;
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            backdrop-filter: blur(12px);
            cursor: pointer;
            position: relative;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }

        .card:hover {
            border-color: rgba(255, 255, 255, 0.15);
            transform: translateY(-2px);
            box-shadow: 0 6px 24px rgba(99, 102, 241, 0.05);
        }

        .card:has(input[type="radio"]:checked) {
            border-color: #6366f1;
            background: rgba(99, 102, 241, 0.04);
            box-shadow: 0 0 0 1px #6366f1, 0 12px 30px rgba(99, 102, 241, 0.15);
        }

        .card label {
            display: flex;
            align-items: center;
            justify-content: space-between;
            cursor: pointer;
            width: 100%;
            gap: 20px;
        }

        .left {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .avatar {
            width: 44px;
            height: 44px;
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.08);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 18px;
            color: #a1a1aa;
            transition: all 0.25s ease;
        }

        .card:has(input[type="radio"]:checked) .avatar {
            background: rgba(99, 102, 241, 0.1);
            border-color: rgba(99, 102, 241, 0.3);
            color: #818cf8;
        }

        .card input[type="radio"] {
            position: absolute;
            opacity: 0;
            width: 0;
            height: 0;
        }

        .radio-indicator {
            width: 22px;
            height: 22px;
            border: 2px solid rgba(255, 255, 255, 0.15);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.25s ease;
            position: relative;
            flex-shrink: 0;
        }

        .card:has(input[type="radio"]:checked) .radio-indicator {
            border-color: #6366f1;
            background: #6366f1;
        }

        @keyframes pop {
            0% { transform: scale(0.6); }
            50% { transform: scale(1.15); }
            100% { transform: scale(1); }
        }

        .card:has(input[type="radio"]:checked) .radio-indicator::after {
            content: "";
            width: 8px;
            height: 8px;
            background: white;
            border-radius: 50%;
            display: block;
            animation: pop 0.22s cubic-bezier(0.34, 1.56, 0.64, 1) forwards;
        }

        .info h3 {
            font-family: 'Syne', sans-serif;
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 4px;
            color: #fafafa;
        }

        .info p {
            color: #a1a1aa;
            font-size: 13px;
        }

        .right-section {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .party {
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.08);
            padding: 6px 14px;
            border-radius: 9999px;
            color: #e4e4e7;
            font-size: 12px;
            font-weight: 500;
        }

        button {
            margin-top: 20px;
            padding: 16px;
            border: 1px solid #ffffff;
            border-radius: 10px;
            background: white;
            color: #09090b;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 4px 12px rgba(255, 255, 255, 0.05);
        }

        button:hover {
            background: #e4e4e7;
            border-color: #e4e4e7;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(255, 255, 255, 0.12);
        }

        button:active {
            transform: scale(0.97);
        }

        .note {
            margin-top: 24px;
            text-align: center;
            color: #71717a;
            font-size: 13px;
        }
    </style>

</head>

<body>

<% Boolean status = (Boolean) request.getAttribute("status"); %>
<div class="container">

    <div class="header">
        <h1>Cast Your Vote</h1>
        <p>Select one candidate. Your vote can only be submitted once.</p>
    </div>

    <% if (status == null || status) { %>

        <form action="Vote" method="post">

            <% for (Candidate candidate : candidates) { %>

                <div class="card">
                    <label>

                        <div class="left">
                            <input type="radio" name="candidateId" value="<%= candidate.getId() %>" required>
                            <div class="avatar"><%= candidate.getName().substring(0, 1).toUpperCase() %></div>

                            <div class="info">
                                <h3><%= candidate.getName() %></h3>
                                <p>Candidate ID : <%= candidate.getId() %></p>
                            </div>
                        </div>

                        <div class="right-section">
                            <div class="party">
                                <%= candidate.getParty() %>
                            </div>
                            <div class="radio-indicator"></div>
                        </div>

                    </label>
                </div>

            <% } %>

            <button type="submit"> Submit Vote </button>

        </form>

    <% } else { %>

        <div class="card" style="text-align:center;">
            <h2>You have already voted.</h2>
            <p style="margin-top: 10px; color: #a1a1aa;">Thank you for participating in the election.</p>
        </div>

    <% } %>

    <div class="note">
        Once submitted, your vote cannot be changed.
    </div>

</div>

</body>

</html>