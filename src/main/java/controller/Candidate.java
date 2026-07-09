package controller;
import model.User;
import dao.CandidateDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Candidate", value = "/Candidate")
public class Candidate extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (user == null || !"admin".equals(user.getRole())) {

            res.sendError(HttpServletResponse.SC_FORBIDDEN);

            return;
        }
        try {
            String action = req.getParameter("action");
            if(action == null) {
                CandidateDao candidateDao = new CandidateDao();
                List<model.Candidate> candidates = null;
                candidates = candidateDao.getCandidates();

                req.setAttribute("candidates", candidates);
                req.getRequestDispatcher("candidate.jsp").forward(req, res);

            } else if (action.equals("add")) {
                req.getRequestDispatcher("addCandidate.jsp").forward(req, res);

            } else if (action.equals("edit")) {

                int id = Integer.parseInt(req.getParameter("id"));
                CandidateDao cd = new CandidateDao();
                model.Candidate candidate = cd.getCandidateById(id);
                req.setAttribute("candidate", candidate);
                req.getRequestDispatcher("editCandidate.jsp").forward(req, res);

            }else {
                req.getRequestDispatcher("candidate.jsp").forward(req, res);
            }

        } catch (Exception e) {throw new RuntimeException(e);}


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (user == null || !"admin".equals(user.getRole())) {

            res.sendError(HttpServletResponse.SC_FORBIDDEN);

            return;
        }
        String action = req.getParameter("action");

        if (action.equals("add")){
            String name = req.getParameter("name");
            String party = req.getParameter("party");

            model.Candidate can = new model.Candidate( name,party, 0);
            CandidateDao cd = new CandidateDao();

            try {
                cd.addCandidate(can);
            } catch (Exception e) {throw new RuntimeException(e);}
            req.getAttribute("candidates");
            res.sendRedirect("Candidate");;


        } else if (action.equals("update")) {
            String name = req.getParameter("name");
            String party = req.getParameter("party");
            int id = Integer.parseInt(req.getParameter("id"));
            int votes = Integer.parseInt(req.getParameter("votes"));
            model.Candidate candidate = new model.Candidate(id, name, party, votes);

            CandidateDao cd = new CandidateDao();

            try {
                cd.updateCandidate(id,candidate);
            } catch (Exception e) {throw new RuntimeException(e);}
            req.getAttribute("candidates");

            res.sendRedirect("Candidate");;

        } else if (action.equals("delete")) {
            int id = Integer.parseInt(req.getParameter("id"));
            CandidateDao cd = new CandidateDao();

            try {
                cd.deleteCandidate(id);
            } catch (Exception e) {throw new RuntimeException(e);}

            req.getAttribute("candidates");
            res.sendRedirect("Candidate");;

        }


    }
}


/*GET

display all candidates

POST

Add Candidate

Delete Candidate

Update Candidate
*/