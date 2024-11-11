package org.pdp.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.CategoryDao;
import org.pdp.entity.Category;

import java.io.IOException;

@WebServlet("/update-category")
public class CategoryUpdateController extends HttpServlet {
    private final CategoryDao categoryDao = new CategoryDao();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer categoryId = Integer.parseInt(req.getParameter("category-id"));
        String categoryName = req.getParameter("category-name");
        String parentIdParam = req.getParameter("parent-id");
        System.out.println("category-id: " + parentIdParam);
        System.out.println("category-name: " + categoryName);
        System.out.println("parent-id: " + parentIdParam);
        Integer parentId = null;
        if (parentIdParam != null && !parentIdParam.trim().isEmpty()) {
            try {
                parentId = Integer.parseInt(parentIdParam);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        System.out.println("parent-id: " + parentIdParam);
        Category category = new Category(categoryId,categoryName,parentId,null,null,null,null,false);
        categoryDao.updateCategory(category);
        req.setAttribute("list", categoryDao.getCategories());
        RequestDispatcher dispatcher = req.getRequestDispatcher("category-list.jsp");
        dispatcher.forward(req,resp);
    }
}