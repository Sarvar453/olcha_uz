package org.pdp.controllers.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.CategoryDao;
import org.pdp.context.Context;

import java.io.IOException;

@WebServlet("/admin/category-list")
public class CategoryListController extends HttpServlet {
    private final CategoryDao categoryDao = new CategoryDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("list", categoryDao.getCategories());
        req.setAttribute("userPermission", Context.getCurrentUser().getPermission());
        req.getRequestDispatcher("/admin/category-list.jsp").forward(req, resp);
    }
}
