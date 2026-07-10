package controller;

import dao.CandidateDao;
import model.Candidate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/Results")
public class Results extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse res)
            throws ServletException, IOException {

        try {

            CandidateDao dao = new CandidateDao();

            List<Candidate> candidates = dao.getCandidates();

            req.setAttribute("candidates", candidates);

            req.getRequestDispatcher("results.jsp")
                    .forward(req, res);

        }
        catch (Exception e) {

            throw new RuntimeException(e);

        }

    }

}