<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Register</title>

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
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #030303;
            background-image: 
                radial-gradient(at 0% 0%, rgba(99, 102, 241, 0.15) 0px, transparent 50%),
                radial-gradient(at 100% 0%, rgba(168, 85, 247, 0.12) 0px, transparent 50%),
                linear-gradient(rgba(255, 255, 255, 0.015) 1px, transparent 1px),
                linear-gradient(90deg, rgba(255, 255, 255, 0.015) 1px, transparent 1px);
            background-size: 100% 100%, 100% 100%, 40px 40px, 40px 40px;
            color: #f4f4f5;
            padding: 40px 20px;
            overflow-x: hidden;
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
            max-width: 560px;
            background: rgba(20, 20, 23, 0.6);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 16px;
            padding: 40px;
            backdrop-filter: blur(16px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.45), inset 0 1px 0 rgba(255, 255, 255, 0.05);
            animation: reveal 0.75s cubic-bezier(0.16, 1, 0.3, 1) forwards;
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .card:hover {
            border-color: rgba(99, 102, 241, 0.3);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.5), 0 0 25px rgba(99, 102, 241, 0.05);
        }

        h2 {
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
            line-height: 1.5;
        }

        .row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 13px;
            font-weight: 500;
            color: #d4d4d8;
        }

        input {
            width: 100%;
            padding: 12px 16px;
            border-radius: 8px;
            border: 1px solid rgba(255, 255, 255, 0.08);
            background: rgba(0, 0, 0, 0.2);
            color: white;
            outline: none;
            font-size: 14px;
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
        }

        input:hover {
            border-color: rgba(255, 255, 255, 0.16);
        }

        input:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 2px rgba(99, 102, 241, 0.2);
        }

        button {
            width: 100%;
            margin-top: 10px;
            padding: 14px;
            border: 1px solid #ffffff;
            border-radius: 8px;
            background: white;
            color: #09090b;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
        }

        button:hover {
            background: #e4e4e7;
            border-color: #e4e4e7;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(255, 255, 255, 0.1);
        }

        button:active {
            transform: scale(0.97);
        }

        .footer {
            margin-top: 24px;
            text-align: center;
            color: #a1a1aa;
            font-size: 13px;
        }

        .footer a {
            color: white;
            text-decoration: none;
            font-weight: 500;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            .row {
                grid-template-columns: 1fr;
            }

            .card {
                padding: 30px 20px;
            }
        }
    </style>
</head>

<body>

    <div class="blur"></div>

    <div class="card">

        <h2>Create Account</h2>

        <p class="subtitle"> Register to participate securely in the online voting system. </p>

        <form action="Register" method="post">

            <div class="row">

                <div class="input-group">
                    <label>First Name</label>
                    <input type="text" name="firstName" placeholder="John" required>
                </div>

                <div class="input-group">
                    <label>Last Name</label>
                    <input type="text" name="lastName" placeholder="Doe" required>
                </div>

            </div>

            <div class="input-group">
                <label>Email Address</label>
                <input type="email" name="email" placeholder="john@example.com" required>
            </div>

            <div class="row">

                <div class="input-group">
                    <label>Password</label>
                    <input type="password" name="password" placeholder="Create password" required>
                </div>

                <div class="input-group">
                    <label>Date of Birth</label>
                    <input type="date" name="dob" required>
                </div>

            </div>

            <button type="submit"> Create Account </button>

        </form>

        <div class="footer">
            Already have an account?
            <a href="login.jsp">Sign In</a>
        </div>

    </div>

</body>

</html>