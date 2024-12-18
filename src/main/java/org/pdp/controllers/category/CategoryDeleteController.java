package org.pdp.controllers.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.CategoryDao;

import java.io.IOException;

@WebServlet("/admin/delete-category")
public class CategoryDeleteController extends HttpServlet {
    private final CategoryDao categoryDao = new CategoryDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int categoryId = Integer.parseInt(req.getParameter("category_id"));
        categoryDao.deleteCategory(categoryId);
        resp.sendRedirect("/admin/category-list");
    }
}
