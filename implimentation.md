## Project Structure

```
VotingSystem
│
├── model
│
├── dao
│
├── controller
│
├── util
│
├── filter (optional)
│
├── webapp
│     ├── jsp files
│     ├── css
│     └── WEB-INF
│
└── database
```

---

# Model Package

### User.java

**Contains**

* User attributes (id, first name, last name, email, password, DOB, voting status, role)
* Constructors
* Getters & Setters

**Requirement**

* Represents one record from the `users` table.

---

### Candidate.java

**Contains**

* Candidate attributes (id, name, party, votes)
* Constructors
* Getters & Setters

**Requirement**

* Represents one record from the `candidates` table.

---

# DAO Package

### UserDao.java

**Contains**

* Database queries related to users.
* Login validation.
* Registration.
* Update voting status.
* Fetch user details.

**Requirement**

* Handles all database operations for the `users` table.

---

### CandidateDao.java

**Contains**

* Fetch all candidates.
* Add candidate.
* Delete candidate.
* Update votes.
* Display election results.

**Requirement**

* Handles all database operations for the `candidates` table.

---

# Utility Package

### DBConnection.java

**Contains**

* Database URL.
* Username.
* Password.
* Method to establish a JDBC connection.

**Requirement**

* Provides database connections to all DAO classes.

---

# Controller Package

### LoginServlet.java

**Contains**

* Receives login form data.
* Calls `UserDao` for authentication.
* Creates session.
* Redirects to Admin or Voter dashboard.

**Requirement**

* Controls user login.

---

### RegisterServlet.java

**Contains**

* Receives registration form.
* Creates a User object.
* Calls `UserDao` to save the user.
* Redirects to login page.

**Requirement**

* Controls new user registration.

---

### VoteServlet.java

**Contains**

* Receives selected candidate.
* Checks whether user has already voted.
* Updates candidate votes.
* Updates user voting status.
* Redirects to results page.

**Requirement**

* Controls the voting process.

---

### CandidateServlet.java

**Contains**

* Admin operations.
* Add candidate.
* Delete candidate.
* View all candidates.

**Requirement**

* Controls candidate management for the admin.

---

### LogoutServlet.java

**Contains**

* Invalidates session.
* Redirects to login page.

**Requirement**

* Logs the user out securely.

---

# Filter Package (Optional)

### AuthenticationFilter.java

**Contains**

* Session validation.
* Checks if a user is logged in before accessing protected pages.

**Requirement**

* Prevents unauthorized access to secured pages.

---

# JSP Pages

### index.jsp

**Contains**

* Welcome page.
* Navigation to Login and Register.

**Requirement**

* Landing page of the application.

---

### login.jsp

**Contains**

* Login form.
* Email field.
* Password field.

**Requirement**

* Allows users to log in.

---

### register.jsp

**Contains**

* Registration form.
* Personal details fields.
* Submit button.

**Requirement**

* Allows new users to register.

---

### dashboard.jsp

**Contains**

* Welcome message.
* User information.
* Vote option.
* Logout option.

**Requirement**

* Main page after voter login.

---

### vote.jsp

**Contains**

* List of candidates.
* Radio buttons for candidate selection.
* Vote button.

**Requirement**

* Allows the voter to cast one vote.

---

### result.jsp

**Contains**

* Candidate names.
* Party names.
* Vote counts.
* Winner (optional).

**Requirement**

* Displays election results.

---

### admin.jsp

**Contains**

* Candidate management options.
* View candidates.
* Add/Delete candidate.
* View election results.
* Logout.

**Requirement**

* Main dashboard for the admin.

---

### error.jsp

**Contains**

* Error messages.
* Navigation back to login or home.

**Requirement**

* Displays application errors in a user-friendly way.

---

# WEB-INF

### web.xml

**Contains**

* Servlet declarations.
* URL mappings (if not using annotations).
* Welcome page configuration.
* Session timeout.
* Filter configuration.

**Requirement**

* Deployment descriptor for the web application.

---

# CSS Folder

### style.css

**Contains**

* Styling for all JSP pages.

**Requirement**

* Maintains a consistent user interface.

---

# Database

### voting.sql

**Contains**

* Database creation.
* Table creation.
* Sample records.
* Initial data.

**Requirement**

* Sets up the application's database.

---

## Overall MVC Flow

* **JSP Pages (View):** Display forms and data to the user.
* **Servlets (Controller):** Receive requests, validate/process input, call DAO methods, and decide which view to display.
* **DAO Classes (Model Access):** Execute SQL queries and interact with the database.
* **Model Classes:** Represent database records as Java objects.
* **DBConnection:** Provides JDBC connections to the DAO layer.
* **Filter (Optional):** Protects secured pages by checking user sessions before allowing access.
