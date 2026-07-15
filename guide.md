
```
VotingSystem/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── voting/
│       │
│       │           ├── controller/
│       │           │     ├── LoginServlet.java
│       │           │     ├── RegisterServlet.java
│       │           │     ├── LogoutServlet.java
│       │           │     ├── VoteServlet.java
│       │           │     ├── CandidateServlet.java
│       │           │     └── AdminServlet.java
│       │           │
│       │           ├── dao/
│       │           │     ├── UserDao.java
│       │           │     └── CandidateDao.java
│       │           │
│       │           ├── model/
│       │           │     ├── User.java
│       │           │     └── Candidate.java
│       │           │
│       │           ├── util/
│       │           │     └── DBConnection.java
│       │           │
│       │           └── filter/
│       │                 └── AuthenticationFilter.java
│       │
│       ├── webapp/
│       │   │
│       │   ├── css/
│       │   │     └── style.css
│       │   │
│       │   ├── images/
│       │   │
│       │   ├── js/
│       │   │
│       │   ├── WEB-INF/
│       │   │     ├── web.xml
│       │   │     └── lib/
│       │   │
│       │   ├── index.jsp
│       │   ├── login.jsp
│       │   ├── register.jsp
│       │   ├── dashboard.jsp
│       │   ├── vote.jsp
│       │   ├── result.jsp
│       │   ├── admin.jsp
│       │   ├── addCandidate.jsp
│       │   └── error.jsp
│       │
│       └── resources/
│             └── db.properties
│
├── pom.xml
└── README.md
```

---

## Model Layer

### User.java

```java
public class User {
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String dob;
    private boolean status;
    private String role;

    // Constructors
    // Getters & Setters
}
```

### Candidate.java

```java
public class Candidate {
    private int id;
    private String name;
    private String party;
    private int votes;

    // Constructors
    // Getters & Setters
}
```

---

# DAO Layer

### UserDao.java

Methods

```java
login(String email, String password)

register(User user)

findByEmail(String email)

updateVotingStatus(int userId)

getAllVoters()
```

---

### CandidateDao.java

Methods

```java
getAllCandidates()

vote(int candidateId)

getResults()

addCandidate(Candidate c)

deleteCandidate(int id)
```

---

# Utility

### DBConnection.java

```java
public class DBConnection {

    private static final String URL="jdbc:mysql://localhost:3306/voting";

    private static final String USER="root";

    private static final String PASSWORD="root";

    public static Connection getConnection() throws Exception{
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL,USER,PASSWORD);
    }
}
```

---

# Controller Layer

## LoginServlet

```
GET
    show login.jsp

POST
    validate user

    if admin
          admin.jsp

    if voter
          dashboard.jsp

    else
          login.jsp
```

---

## RegisterServlet

```
GET
    register.jsp

POST
    save user

    redirect login
```

---

## VoteServlet

```
GET

    show all candidates

POST

    if user has not voted

           increase vote count

           update status=1

           result.jsp

    else

           Already Voted
```

---

## CandidateServlet (Admin)

```
GET

display all candidates

POST

Add Candidate

Delete Candidate

Update Candidate
```

---

## LogoutServlet

```
Destroy Session

Redirect Login
```

---

# JSP Pages

## index.jsp

```
Welcome

Login

Register
```

---

## login.jsp

```
Email

Password

Login Button
```

---

## register.jsp

```
First Name

Last Name

Email

Password

DOB

Register Button
```

---

## dashboard.jsp

```
Welcome User

Vote Button

Logout
```

---

## vote.jsp

```
List all candidates

Radio Button

Vote Button
```

---

## result.jsp

```
Candidate

Party

Votes
```

---

## admin.jsp

```
Manage Candidates

View Results

Add Candidate

Delete Candidate

Logout
```

---

# Database Tables

### users

```
id
first_name
last_name
email
password
dob
status
role
```

### candidates

```
id
name
party
votes
```

---

# Request Flow (MVC)

```
Browser
   │
   ▼
Login.jsp
   │
   ▼
LoginServlet
   │
   ▼
UserDao
   │
   ▼
MySQL
   │
   ▼
UserDao
   │
   ▼
LoginServlet
   │
   ├── Admin → admin.jsp
   └── Voter → dashboard.jsp
```

## Development order

1. Create `DBConnection`.
2. Create `User` and `Candidate` model classes.
3. Implement `UserDao` and `CandidateDao`.
4. Build `login.jsp` and `LoginServlet`.
5. Implement `RegisterServlet`.
6. Implement `VoteServlet` (including updating both the candidate's vote count and the user's `status` to prevent multiple votes).
7. Implement the admin module (`AdminServlet`/`CandidateServlet`) for candidate management and viewing results.
8. Add session handling, authentication filter, and logout.

This structure follows the standard MVC pattern commonly expected in Java Servlet/JSP coursework and is easy to extend with additional features such as password hashing, input validation, and result charts.
