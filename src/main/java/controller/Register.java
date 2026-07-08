package controller;

import dao.UserDao;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;

@WebServlet(name = "Register", value = "/Register")
public class Register extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String dateOfBirth = req.getParameter("dob");
        java.sql.Date dob = java.sql.Date.valueOf(dateOfBirth);


        User user = new User(firstName,lastName, email, password, dob );
        UserDao userDao = new UserDao();


        try {
            boolean registered = userDao.register(user);

            if (registered){
                System.out.println("Registration Success");
                req.getRequestDispatcher("/login.jsp").forward(req, resp);
            }
            else{
                req.getRequestDispatcher("/index.jsp").forward(req, resp);
            }

        } catch (Exception e) {throw new RuntimeException(e);}

    }
}