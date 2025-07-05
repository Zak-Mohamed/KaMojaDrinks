package com.mycompany.kamojadrinks;

import com.mycompany.kamojadrinks.dao.BranchDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/branches")
public class BranchListServlet extends HttpServlet {
    private BranchDAO branchDAO;
    @Override
    public void init() {
        branchDAO = new BranchDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<BranchDAO.Branch> branches = branchDAO.getAllBranches();
            request.setAttribute("branches", branches);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
} 