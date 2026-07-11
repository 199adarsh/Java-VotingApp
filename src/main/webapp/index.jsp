<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Online Voting System</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link
            href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Syne:wght@750;800&display=swap"
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
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                overflow: hidden;
            }

            @keyframes reveal {
                from {
                    opacity: 0;
                    transform: translateY(24px) scale(0.98);
                }

                to {
                    opacity: 1;
                    transform: translateY(0) scale(1);
                }
            }

            .container {
                position: relative;
                width: 90%;
                max-width: 1100px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                gap: 80px;
                animation: reveal 0.85s cubic-bezier(0.16, 1, 0.3, 1) forwards;
            }

            .left {
                flex: 1;
            }

            .badge {
                display: inline-flex;
                align-items: center;
                padding: 6px 12px;
                border: 1px solid rgba(255, 255, 255, 0.08);
                border-radius: 9999px;
                color: #a1a1aa;
                font-size: 13px;
                font-weight: 600;
                font-family: 'Syne', sans-serif;
                background: rgba(255, 255, 255, 0.03);
                backdrop-filter: blur(8px);
                margin-bottom: 28px;
                gap: 8px;
            }

            .badge::before {
                content: "";
                display: inline-block;
                width: 6px;
                height: 6px;
                background: #a855f7;
                border-radius: 50%;
                box-shadow: 0 0 8px #a855f7;
            }

            h1 {
                font-family: 'Syne', sans-serif;
                font-size: 44px;
                font-weight: 800;
                line-height: 1.05;
                margin-bottom: 24px;
                letter-spacing: -0.03em;
                background: linear-gradient(180deg, #ffffff 0%, #a1a1aa 100%);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
            }

            p {
                color: #a1a1aa;
                font-size: 16px;
                line-height: 1.7;
                max-width: 520px;
            }

            .buttons {
                margin-top: 40px;
                display: flex;
                gap: 16px;
            }

            .btn {
                padding: 12px 24px;
                border-radius: 8px;
                text-decoration: none;
                transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
                font-weight: 500;
                font-size: 14px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
            }

            .btn:active {
                transform: scale(0.96);
            }

            .primary {
                background: #ffffff;
                color: #09090b;
                border: 1px solid #ffffff;
                box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
            }

            .primary:hover {
                background: #e4e4e7;
                border-color: #e4e4e7;
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(255, 255, 255, 0.1);
            }

            .secondary {
                background: rgba(255, 255, 255, 0.03);
                border: 1px solid rgba(255, 255, 255, 0.08);
                color: #fafafa;
            }

            .secondary:hover {
                background: rgba(255, 255, 255, 0.08);
                border-color: rgba(255, 255, 255, 0.15);
                transform: translateY(-2px);
            }

            .card {
                width: 360px;
                background: rgba(20, 20, 23, 0.6);
                border: 1px solid rgba(255, 255, 255, 0.08);
                border-radius: 16px;
                padding: 32px;
                backdrop-filter: blur(16px);
                box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4), inset 0 1px 0 rgba(255, 255, 255, 0.05);
                transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
            }

            .card:hover {
                transform: translateY(-4px) scale(1.02);
                border-color: rgba(99, 102, 241, 0.4);
                box-shadow: 0 12px 40px rgba(0, 0, 0, 0.5), 0 0 30px rgba(99, 102, 241, 0.1);
            }

            .card h3 {
                font-family: 'Syne', sans-serif;
                font-size: 18px;
                font-weight: 700;
                margin-bottom: 20px;
                color: #fafafa;
                letter-spacing: -0.01em;
            }

            .feature {
                display: flex;
                justify-content: space-between;
                margin-bottom: 16px;
                color: #a1a1aa;
                font-size: 14px;
                border-bottom: 1px solid rgba(255, 255, 255, 0.03);
                padding-bottom: 12px;
            }

            .feature:last-of-type {
                border-bottom: none;
                padding-bottom: 0;
                margin-bottom: 0;
            }

            .status {
                color: #4ade80;
                font-weight: 600;
                display: inline-flex;
                align-items: center;
                gap: 6px;
            }

            .status::before {
                content: "";
                width: 6px;
                height: 6px;
                background: #4ade80;
                border-radius: 50%;
                box-shadow: 0 0 8px #4ade80;
            }
        </style>

    </head>

    <body>

        <div class="bg"></div>

        <div class="container">

            <div class="left">

                <div class="badge">
                    Secure • Transparent • Fast
                </div>

                <h1>
                    Modern Online<br>
                    Voting System
                </h1>

                <p>
                    Cast your vote securely from anywhere. Built using Java Servlets,
                    JSP, JDBC and MySQL with role-based authentication and secure
                    session management.
                </p>

                <div class="buttons">
                    <a href="login.jsp" class="btn primary">Login</a>
                    <a href="register.jsp" class="btn secondary">Register</a>
                </div>

            </div>

            <div class="card">

                <h3>Election Status</h3>

                <div class="feature">
                    <span>Total Candidates</span>
                    <span>8</span>
                </div>

                <div class="feature">
                    <span>Registered Voters</span>
                    <span>150+</span>
                </div>

                <div class="feature">
                    <span>Election</span>
                    <span class="status">Active</span>
                </div>

            </div>

        </div>

    </body>

    </html>