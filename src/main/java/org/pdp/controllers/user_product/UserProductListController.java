package org.pdp.controllers.user_product;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.CategoryDao;
import org.pdp.Dao.ProductDao;
import org.pdp.context.Context;

import java.io.IOException;

@WebServlet("/user/home-page")
public class UserProductListController extends HttpServlet {
    private ProductDao productDao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        productDao = new ProductDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/user/home-page.jsp").forward(req, resp);
    }
}
