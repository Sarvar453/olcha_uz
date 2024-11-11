package org.pdp.controllers.category;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.CategoryDao;
import org.pdp.context.Context;
import org.pdp.entity.Category;
import org.pdp.service.CategoryService;

import java.io.IOException;

@WebServlet("/add-category")
public class CategoryAddController extends BaseCategoryController {
    private CategoryDao categoryDao;
    private CategoryService categoryService;


    @Override
    public void init(ServletConfig config) throws ServletException {
        categoryDao = new CategoryDao();
        categoryService = new CategoryService(categoryDao);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = getUsernameFromCookie(req);
        if (username == null) {
            resp.sendRedirect("/login");
            return;
        }

        String categoryName = req.getParameter("category_name");
        String parentIdParam = req.getParameter("parent_id");
        categoryService.addCategory(parentIdParam, categoryName, username);
        req.setAttribute("list", categoryDao.getCategories());
        req.setAttribute("userPermission", Context.getCurrentUser().getPermission());
        RequestDispatcher dispatcher = req.getRequestDispatcher("category-list.jsp");
        dispatcher.forward(req,resp);
    }
}
