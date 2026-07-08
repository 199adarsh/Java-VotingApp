package controller;

import dao.UserDao;
import model.User;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        System.out.println(email +" "+ password);


        UserDao userDao = new UserDao();

        try {
            User user = userDao.login(email, password);
            System.out.println(user);

            if (user != null) {

                String role = user.getRole();


                HttpSession session = req.getSession();
                session.setAttribute("user", user);

                if ("admin".equals(user.getRole())) {

                    res.sendRedirect(req.getContextPath() + "/Candidate");

                }
                else if ("voter".equals(user.getRole())) {

                    res.sendRedirect(req.getContextPath() + "/Vote");

                }
            } else {

                System.out.println("User doesn't exist");

                req.setAttribute("error", "Invalid email or password");
                req.getRequestDispatcher("/login.jsp").forward(req, res);
            }


        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}