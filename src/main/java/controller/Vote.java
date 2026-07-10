package controller;

import dao.CandidateDao;
import dao.UserDao;
import model.Candidate;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "Vote", value = "/Vote")
public class Vote extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");
        System.out.println("Vote doGet called");
        System.out.println(session);


        if(session==null){res.sendRedirect("login.jsp");return;}

        if (user.getvStatus()) {
            CandidateDao candidateDao = new CandidateDao();
            List<Candidate> candidates = null;

            try {
                candidates = candidateDao.getCandidates();

            } catch (Exception e) {throw new RuntimeException(e);}

            req.setAttribute("status", user.getvStatus());
            req.setAttribute("candidates", candidates);
            req.getRequestDispatcher("vote.jsp").forward(req, res);
        }
        else {
                res.sendRedirect(req.getContextPath() + "/Results");
        }

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println(" DO POST CALLED");
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");


        int candidateId = Integer.parseInt(req.getParameter("candidateId"));
        System.out.println(candidateId);

        if (user.getvStatus()) {

            CandidateDao candidateDao = new CandidateDao();
            UserDao userDao = new UserDao();

            try {

                userDao.updateStatus(user.getId());

                candidateDao.vote(candidateId);

                user.setvStatus(false);

                session.setAttribute("user", user);

                res.sendRedirect(req.getContextPath() + "/Results");

            } catch (Exception e) {
                throw new RuntimeException(e);
            }

        } else {

            res.sendRedirect(req.getContextPath() + "/Results");

        }

    }
}