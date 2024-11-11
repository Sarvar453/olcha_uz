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

@WebServlet("/add-category")
public class CategoryAddController extends HttpServlet {
    private final CategoryDao categoryDao = new CategoryDao();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryName = req.getParameter("category_name");
        String parentIdParam = req.getParameter("parent_id");
        Integer parentId = null;
        if (parentIdParam!=null && !parentIdParam.isEmpty()){
            try {
                parentId = Integer.parseInt(parentIdParam);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        Category category = new Category(0,categoryName,parentId,null,null,null,null,true);
        categoryDao.addCategory(category);
        req.setAttribute("list", categoryDao.getCategories());
        RequestDispatcher dispatcher = req.getRequestDispatcher("category-list.jsp");
        dispatcher.forward(req,resp);
    }
}