package org.pdp.controllers.category;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.CategoryDao;
import org.pdp.config.PostgresDatabaseConfig;
import org.pdp.context.Context;

import java.io.IOException;

@WebServlet("/delete-category")
public class CategoryDeleteController extends BaseCategoryController {
    private final PostgresDatabaseConfig postgresDatabaseConfig = new PostgresDatabaseConfig();
    private final CategoryDao categoryDao = new CategoryDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int categoryId = Integer.parseInt(req.getParameter("category_id"));
        categoryDao.deleteCategory(categoryId);
        req.setAttribute("list", categoryDao.getCategories());
        req.setAttribute("userPermission", Context.getCurrentUser().getPermission());
        RequestDispatcher dispatcher = req.getRequestDispatcher("category-list.jsp");
        dispatcher.forward(req,resp);
    }
}
