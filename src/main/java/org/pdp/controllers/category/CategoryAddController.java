package org.pdp.controllers.category;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.CategoryDao;
import org.pdp.service.CategoryService;

import java.io.IOException;

@WebServlet("/admin/add-category")
public class CategoryAddController extends HttpServlet {
    private CategoryService categoryService;


    @Override
    public void init(ServletConfig config) throws ServletException {
        categoryService = new CategoryService(new CategoryDao());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = (String) req.getAttribute("authentication");
        String categoryName = req.getParameter("category_name");
        String parentIdParam = req.getParameter("parent_id");
        categoryService.addCategory(parentIdParam, categoryName, username);
        resp.sendRedirect("/admin/category-list");
    }
}
