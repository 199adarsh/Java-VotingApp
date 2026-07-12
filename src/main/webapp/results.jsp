<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Candidate" %>

<%
    List<Candidate> candidates =
            (List<Candidate>)request.getAttribute("candidates");
%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Election Results</title>

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
    --success: #4ade80;
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
    font-size: 15px;
    color: var(--muted);
}

.logout {
    padding: 10px 20px;
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    text-decoration: none;
    color: #fafafa;
    font-size: 13px;
    font-weight: 600;
    transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
    display: inline-flex;
    align-items: center;
}

.logout:hover {
    background: rgba(255, 255, 255, 0.08);
    border-color: rgba(255, 255, 255, 0.15);
    transform: translateY(-2px);
}

.logout:active {
    transform: scale(0.96);
}

.hero {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 36px;
    margin-bottom: 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    backdrop-filter: blur(12px);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4), inset 0 1px 0 rgba(255, 255, 255, 0.05);
    transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
}

.hero:hover {
    transform: translateY(-4px) scale(1.01);
    border-color: rgba(99, 102, 241, 0.3);
    box-shadow: 0 12px 40px rgba(0, 0, 0, 0.5), 0 0 25px rgba(99, 102, 241, 0.05);
}

.winner-label {
    font-size: 11px;
    font-weight: 700;
    letter-spacing: .1em;
    text-transform: uppercase;
    color: #fbbf24;
    margin-bottom: 12px;
    display: inline-flex;
    align-items: center;
    gap: 6px;
}

.winner-name {
    font-family: 'Syne', sans-serif;
    font-size: 36px;
    font-weight: 800;
    letter-spacing: -0.02em;
    margin-bottom: 8px;
    color: #fafafa;
}

.winner-party {
    font-size: 16px;
    color: var(--muted);
    margin-bottom: 24px;
}

.vote-count {
    display: inline-flex;
    align-items: center;
    padding: 8px 16px;
    background: rgba(251, 191, 36, 0.08);
    border: 1px solid rgba(251, 191, 36, 0.2);
    border-radius: 9999px;
    font-size: 14px;
    font-weight: 600;
    color: #fbbf24;
}

.stats {
    display: flex;
    gap: 16px;
}

.stat {
    width: 140px;
    background: rgba(255, 255, 255, 0.02);
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 20px;
    text-align: center;
}

.stat h2 {
    font-family: 'Syne', sans-serif;
    font-size: 28px;
    font-weight: 750;
    margin-bottom: 6px;
    color: #fafafa;
}

.stat p {
    font-size: 12px;
    color: var(--muted);
}

.table-card {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 12px;
    overflow: hidden;
    backdrop-filter: blur(12px);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4), inset 0 1px 0 rgba(255, 255, 255, 0.05);
}

.table-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 22px 28px;
    border-bottom: 1px solid var(--border);
}

.table-header h2 {
    font-family: 'Syne', sans-serif;
    font-size: 18px;
    font-weight: 700;
    color: #fafafa;
}

.table-header span {
    font-size: 13px;
    color: var(--muted);
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
    text-align: left;
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: .05em;
    color: var(--muted);
    font-weight: 600;
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
    font-size: 14px;
}

.rank {
    font-weight: 700;
    font-size: 16px;
    width: 80px;
    color: #fafafa;
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
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    font-size: 12px;
    font-weight: 500;
    color: #fafafa;
}

.votes {
    font-size: 15px;
    font-weight: 700;
    color: #fafafa;
}

.badge {
    display: inline-flex;
    padding: 4px 10px;
    border-radius: 9999px;
    font-size: 11px;
    font-weight: 600;
}

.gold {
    background: rgba(251, 191, 36, 0.08);
    border: 1px solid rgba(251, 191, 36, 0.2);
    color: #fbbf24;
}

.silver {
    background: rgba(229, 231, 235, 0.08);
    border: 1px solid rgba(229, 231, 235, 0.2);
    color: #e5e7eb;
}

.bronze {
    background: rgba(253, 186, 116, 0.08);
    border: 1px solid rgba(253, 186, 116, 0.2);
    color: #fdba74;
}

.normal {
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    color: var(--muted);
}
</style>

</head>

<body>

<div class="container">

<div class="header">

<div>

<h1>

Election Results

</h1>

<p>

Official live vote count.

</p>

</div>

<a href="index.jsp"
class="logout">

Logout

</a>

</div>

<%
Candidate winner=null;

if(candidates!=null && !candidates.isEmpty()){

winner=candidates.get(0);

}
%>

<% if(winner!=null){ %>

<div class="hero">

<div>

<div class="winner-label">

Winner

</div>

<div class="winner-name">

<%=winner.getName()%>

</div>

<div class="winner-party">

<%=winner.getParty()%>

</div>

<div class="vote-count">

<%=winner.getVotes()%> Votes

</div>

</div>

<div class="stats">

<div class="stat">

<h2>

<%=candidates.size()%>

</h2>

<p>

Candidates

</p>

</div>

<div class="stat">

<h2>

<%=winner.getVotes()%>

</h2>

<p>

Highest Votes

</p>

</div>

</div>

</div>

<% } %>

<div class="table-card">

<div class="table-header">

<h2>

Official Ranking

</h2>

<span>

Election Commission Records

</span>

</div>

<table>

<thead>

<tr>

<th>Rank</th>

<th>Candidate</th>

<th>Party</th>

<th>Votes</th>

<th>Status</th>

</tr>

</thead>

<tbody>

<%
if(candidates!=null && !candidates.isEmpty()){

    for(int i=0;i<candidates.size();i++){

        Candidate candidate=candidates.get(i);

        String badgeClass="normal";
        String badgeText="Candidate";

        if(i==0){
            badgeClass="gold";
            badgeText="Winner";
        }
        else if(i==1){
            badgeClass="silver";
            badgeText="Runner Up";
        }
        else if(i==2){
            badgeClass="bronze";
            badgeText="Third Place";
        }
%>

<tr>

    <td class="rank">

        <% if(i==0){ %>
            🥇
        <% }else if(i==1){ %>
            🥈
        <% }else if(i==2){ %>
            🥉
        <% }else{ %>
            #<%=i+1%>
        <% } %>

    </td>

    <td>

        <div class="name">

            <%=candidate.getName()%>

        </div>

    </td>

    <td>

        <span class="party">

            <%=candidate.getParty()%>

        </span>

    </td>

    <td>

        <span class="votes">

            <%=candidate.getVotes()%>

        </span>

    </td>

    <td>

        <span class="badge <%=badgeClass%>">

            <%=badgeText%>

        </span>

    </td>

</tr>

<%
    }
}else{
%>

<tr>

<td colspan="5">

<div style="

padding:90px;

display:flex;

flex-direction:column;

align-items:center;

justify-content:center;

text-align:center;

">

<div style="

width:72px;

height:72px;

border-radius:18px;

background:#18181b;

border:1px solid #2a2a2a;

display:flex;

align-items:center;

justify-content:center;

font-size:28px;

margin-bottom:24px;

">

🗳

</div>

<h2 style="

font-size:28px;

margin-bottom:10px;

">

No Election Data

</h2>

<p style="

color:#9ca3af;

line-height:1.8;

max-width:450px;

">

No candidates have been registered yet.

Election results will appear here once voting begins.

</p>

</div>

</td>

</tr>

<%
}
%>

</tbody>

</table>

</div>

<div style="

margin-top:22px;

display:flex;

justify-content:space-between;

align-items:center;

color:#71717a;

font-size:13px;

">

<div>

Election Management System

</div>

<div>

Total Candidates :

<strong style="color:#fafafa;">

<%=candidates==null?0:candidates.size()%>

</strong>

</div>

</div>

</div>

</body>

</html>