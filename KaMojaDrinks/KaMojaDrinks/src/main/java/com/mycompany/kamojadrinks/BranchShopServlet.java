package com.mycompany.kamojadrinks;

import com.mycompany.kamojadrinks.dao.DrinkDAO;
import com.mycompany.kamojadrinks.dao.BranchDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/shop")
public class BranchShopServlet extends HttpServlet {
    private DrinkDAO drinkDAO;
    private BranchDAO branchDAO;
    @Override
    public void init() {
        drinkDAO = new DrinkDAO();
        branchDAO = new BranchDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String branchIdStr = request.getParameter("branch_id");
        int branchId = 1;
        try {
            if (branchIdStr != null) {
                branchId = Integer.parseInt(branchIdStr);
            }
            List<DrinkDAO.BranchDrink> drinks = drinkDAO.getDrinksForBranch(branchId);
            BranchDAO.Branch branch = null;
            for (BranchDAO.Branch b : branchDAO.getAllBranches()) {
                if (b.getId() == branchId) {
                    branch = b;
                    break;
                }
            }
            request.setAttribute("drinks", drinks);
            request.setAttribute("branch", branch);
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
} 