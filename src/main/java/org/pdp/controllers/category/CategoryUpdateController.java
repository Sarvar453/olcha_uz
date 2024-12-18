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

@WebServlet("/admin/update-category")
public class CategoryUpdateController extends HttpServlet {
    private CategoryService categoryService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        categoryService = new CategoryService(new CategoryDao());
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer categoryId = Integer.parseInt(req.getParameter("category-id"));
        String categoryName = req.getParameter("category-name");
        String parentIdParam = req.getParameter("parent-id");
        String username = (String) req.getAttribute("authentication");
        if (username == null){
            resp.sendRedirect("/login");
            return;
        }
        categoryService.updateCategory(parentIdParam,categoryId,categoryName,username);
        resp.sendRedirect("/admin/category-list");
    }
}
