package org.pdp.controllers.category;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.CategoryDao;
import org.pdp.entity.Category;
import org.pdp.service.CategoryService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/api/category/list")
public class CategoryRestController extends HttpServlet {
    private ObjectMapper objectMapper;
    private CategoryService categoryService;
    @Override
    public void init() {
        this.objectMapper = new ObjectMapper();
        this.categoryService = new CategoryService(new CategoryDao());
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<Category> categoryList = categoryService.getCategoryList();
        resp.setContentType("text/json");
        PrintWriter writer = resp.getWriter();
        writer.println(objectMapper.writeValueAsString(categoryList));
    }
}