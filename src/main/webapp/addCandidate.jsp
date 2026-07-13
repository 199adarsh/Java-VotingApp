<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Add Candidate</title>

    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Syne:wght@750;800&display=swap"
          rel="stylesheet">

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
            padding: 30px;
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

        .card {
            width: 100%;
            max-width: 520px;
            background: rgba(20, 20, 23, 0.6);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 16px;
            padding: 40px;
            backdrop-filter: blur(16px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.45), inset 0 1px 0 rgba(255, 255, 255, 0.05);
            transition: border-color 0.2s ease;
            animation: reveal 0.75s cubic-bezier(0.16, 1, 0.3, 1) forwards;
        }

        .card:hover {
            border-color: rgba(255, 255, 255, 0.15);
        }

        h1 {
            font-family: 'Syne', sans-serif;
            font-size: 30px;
            font-weight: 700;
            margin-bottom: 8px;
            letter-spacing: -0.02em;
            background: linear-gradient(180deg, #ffffff 0%, #a1a1aa 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .subtitle {
            color: #a1a1aa;
            font-size: 14px;
            margin-bottom: 30px;
        }

        .group {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }

        label {
            margin-bottom: 8px;
            color: #d4d4d8;
            font-size: 13px;
            font-weight: 500;
        }

        input {
            background: rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.08);
            color: white;
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            outline: none;
        }

        input:hover {
            border-color: rgba(255, 255, 255, 0.16);
        }

        input:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 2px rgba(99, 102, 241, 0.2);
        }

        .buttons {
            display: flex;
            gap: 12px;
            margin-top: 10px;
        }

        button, .cancel {
            flex: 1;
            padding: 12px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            display: flex;
            justify-content: center;
            align-items: center;
            text-decoration: none;
        }

        button:active, .cancel:active {
            transform: scale(0.97);
        }

        .save {
            background: white;
            color: #09090b;
            border: 1px solid white;
        }

        .save:hover {
            background: #e4e4e7;
            border-color: #e4e4e7;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(255, 255, 255, 0.1);
        }

        .cancel {
            background: rgba(255, 255, 255, 0.03);
            color: #fafafa;
            border: 1px solid rgba(255, 255, 255, 0.08);
        }

        .cancel:hover {
            background: rgba(255, 255, 255, 0.08);
            border-color: rgba(255, 255, 255, 0.15);
            transform: translateY(-2px);
        }
    </style>

</head>

<body>

<div class="blur"></div>

<div class="card">

    <h1>Add Candidate</h1>

    <p class="subtitle"> Register a new candidate for the election. </p>

    <form action="Candidate" method="post">

        <input type="hidden" name="action" value="add">
        <div class="group">

            <label> Candidate Name </label>
            <input type="text" name="name" placeholder="Enter candidate name" required>

        </div>

        <div class="group">

            <label> Party Name </label>

            <input type="text" name="party" placeholder="Enter party name" required>

        </div>

        <div class="buttons">

            <button class="save" type="submit"> Add Candidate </button>

            <a href="Candidate" class="cancel"> Cancel </a>

        </div>

    </form>

</div>

</body>

</html>