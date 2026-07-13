<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Candidate" %>

<%
    List<Candidate> candidates =
            (List<Candidate>) request.getAttribute("candidates");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Election Candidates</title>

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

:root {
    --bg: #030303;
    --surface: rgba(20, 20, 23, 0.6);
    --surface2: rgba(255, 255, 255, 0.03);
    --border: rgba(255, 255, 255, 0.08);
    --hover: rgba(255, 255, 255, 0.05);
    --text: #fafafa;
    --muted: #a1a1aa;
    --primary: #6366f1;
}

body {
    background: var(--bg);
    background-image: 
        radial-gradient(at 0% 0%, rgba(99, 102, 241, 0.15) 0px, transparent 50%),
        radial-gradient(at 100% 0%, rgba(168, 85, 247, 0.12) 0px, transparent 50%),
        linear-gradient(rgba(255, 255, 255, 0.015) 1px, transparent 1px),
        linear-gradient(90deg, rgba(255, 255, 255, 0.015) 1px, transparent 1px);
    background-size: 100% 100%, 100% 100%, 40px 40px, 40px 40px;
    color: var(--text);
    min-height: 100vh;
    padding: 60px 28px;
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

.container {
    max-width: 1200px;
    margin: auto;
    animation: reveal 0.85s cubic-bezier(0.16, 1, 0.3, 1) forwards;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    margin-bottom: 40px;
}

.header h1 {
    font-family: 'Syne', sans-serif;
    font-size: 36px;
    font-weight: 800;
    letter-spacing: -0.03em;
    margin-bottom: 8px;
    background: linear-gradient(180deg, #ffffff 0%, #a1a1aa 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.header p {
    color: var(--muted);
    font-size: 15px;
}

.add-btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 10px 20px;
    border-radius: 8px;
    background: #ffffff;
    border: 1px solid #ffffff;
    color: #09090b;
    text-decoration: none;
    font-size: 14px;
    font-weight: 600;
    transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
}

.add-btn:hover {
    background: #e4e4e7;
    border-color: #e4e4e7;
    transform: translateY(-1px);
}

.table-card {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 12px;
    overflow: hidden;
    backdrop-filter: blur(12px);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4), inset 0 1px 0 rgba(255, 255, 255, 0.05);
}

.table-top {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 24px 28px;
    border-bottom: 1px solid var(--border);
}

.title {
    font-family: 'Syne', sans-serif;
    font-size: 18px;
    font-weight: 700;
    color: #fafafa;
}

.subtitle {
    margin-top: 4px;
    font-size: 13px;
    color: var(--muted);
}

.live {
    padding: 4px 10px;
    border-radius: 9999px;
    border: 1px solid rgba(74, 222, 128, 0.2);
    background: rgba(74, 222, 128, 0.05);
    color: #4ade80;
    font-size: 11px;
    font-weight: 600;
    display: inline-flex;
    align-items: center;
    gap: 6px;
}

.live::before {
    content: "";
    width: 6px;
    height: 6px;
    background: #4ade80;
    border-radius: 50%;
    box-shadow: 0 0 8px #4ade80;
}

.table-wrapper {
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
}

thead {
    background: rgba(255, 255, 255, 0.02);
}

th {
    padding: 14px 24px;
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: .05em;
    font-weight: 600;
    text-align: left;
    color: var(--muted);
    border-bottom: 1px solid var(--border);
}

tbody tr {
    transition: all 0.2s ease;
}

tbody tr:hover {
    background: var(--hover);
}

td {
    padding: 16px 24px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.04);
    vertical-align: middle;
    font-size: 14px;
}

.number {
    width: 90px;
    color: #71717a;
    font-weight: 600;
}

.name {
    font-size: 14px;
    font-weight: 600;
    color: #fafafa;
}

.party {
    display: inline-flex;
    padding: 4px 10px;
    border-radius: 9999px;
    border: 1px solid var(--border);
    background: rgba(255, 255, 255, 0.03);
    font-size: 12px;
    font-weight: 500;
    color: #fafafa;
}

.vote {
    font-size: 15px;
    font-weight: 700;
    color: #fafafa;
}

.status {
    display: inline-flex;
    padding: 4px 10px;
    border-radius: 9999px;
    background: rgba(74, 222, 128, 0.05);
    border: 1px solid rgba(74, 222, 128, 0.2);
    color: #4ade80;
    font-size: 11px;
    font-weight: 600;
}

.actions {
    display: flex;
    gap: 8px;
}

.edit {
    padding: 6px 14px;
    border-radius: 6px;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    text-decoration: none;
    color: #fafafa;
    font-size: 13px;
    font-weight: 500;
    transition: all 0.2s ease;
    display: inline-flex;
    align-items: center;
}

.edit:hover {
    background: rgba(255, 255, 255, 0.08);
    border-color: rgba(255, 255, 255, 0.15);
}

.edit:active {
    transform: scale(0.96);
}

.delete button {
    padding: 6px 14px;
    background: transparent;
    border: 1px solid rgba(239, 68, 68, 0.2);
    color: #f87171;
    border-radius: 6px;
    cursor: pointer;
    font-size: 13px;
    font-weight: 500;
    transition: all 0.2s ease;
}

.delete button:hover {
    background: rgba(239, 68, 68, 0.08);
    border-color: rgba(239, 68, 68, 0.4);
}

.delete button:active {
    transform: scale(0.96);
}

.footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 18px 28px;
    font-size: 13px;
    color: #71717a;
    border-top: 1px solid var(--border);
}

.footer strong {
    color: white;
}
</style>

</head>

<body>

<div class="container">

<div class="header">

<div>

<h1>Candidate Management</h1>

<p>
Manage election candidates and monitor live ballot information.
</p>

</div>

<a href="Candidate?action=add"
class="add-btn">

＋ Add Candidate

</a>

</div>

<div class="table-card">

<div class="table-top">

<div>

<div class="title">

Official Candidate Register

</div>

<div class="subtitle">

Election Commission • Live Candidate Records

</div>

</div>

<div class="live">

LIVE

</div>

</div>

<div class="table-wrapper">

<table>

<thead>

<tr>

<th>ID</th>

<th>Candidate</th>

<th>Party</th>

<th>Votes</th>

<th>Status</th>

<th>Actions</th>

</tr>

</thead>

<tbody>

<% if (candidates != null && !candidates.isEmpty()) { %>

    <% for (Candidate candidate : candidates) { %>

    <tr>

        <td class="number">
            #<%= candidate.getId() %>
        </td>

        <td>

            <div class="name">
                <%= candidate.getName() %>
            </div>

        </td>

        <td>

            <span class="party">
                <%= candidate.getParty() %>
            </span>

        </td>

        <td>

            <span class="vote">
                <%= candidate.getVotes() %>
            </span>

        </td>

        <td>

            <span class="status">
                Active
            </span>

        </td>

        <td>

            <div class="actions">

                <a
                    href="Candidate?action=edit&id=<%=candidate.getId()%>"
                    class="edit">

                    Edit

                </a>

                <form
                        action="Candidate"
                        method="post"
                        class="delete"
                        onsubmit="return confirm('Delete <%=candidate.getName()%>?');">

                    <input
                            type="hidden"
                            name="action"
                            value="delete">

                    <input
                            type="hidden"
                            name="id"
                            value="<%=candidate.getId()%>">

                    <button
                            type="submit">

                        Delete

                    </button>

                </form>

            </div>

        </td>

    </tr>

    <% } %>

<% } else { %>

<tr>

<td colspan="6">

<div style="

padding:90px 20px;

display:flex;

flex-direction:column;

align-items:center;

justify-content:center;

text-align:center;

">

<div style="

width:68px;
height:68px;

border-radius:18px;

background:#18181b;

border:1px solid #2d2d30;

display:flex;

justify-content:center;

align-items:center;

font-size:26px;

margin-bottom:24px;

">

🗳️

</div>

<h2 style="

font-size:24px;

margin-bottom:10px;

">

No Candidates Registered

</h2>

<p style="

color:#9ca3af;

max-width:450px;

line-height:1.7;

">

No candidates have been added to the election yet.

Click <strong style="color:white;">+ Add Candidate</strong>
to register the first participant.

</p>

</div>

</td>

</tr>

<% } %>

</tbody>

</table>

</div>

<div class="footer">

<div>

Election Management System

</div>

<div>

Total Candidates

<strong>

<%= candidates == null ? 0 : candidates.size() %>

</strong>

</div>

</div>

</div>

</div>

</body>

</html>