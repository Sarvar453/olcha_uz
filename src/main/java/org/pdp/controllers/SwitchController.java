package org.pdp.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Or;
import org.pdp.Dao.*;
import org.pdp.config.PostgresDatabaseConfig;
import org.pdp.context.Context;

import java.io.IOException;

@WebServlet("/admin/switch")
public class SwitchController extends HttpServlet {
    private final PostgresDatabaseConfig postgresDatabaseConfig = new PostgresDatabaseConfig();
    private CategoryDao categoryDao;
    private ProductDao productDao;
    private OrderDao orderDao;
    private CartDao cartDao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        categoryDao = new CategoryDao();
        productDao = new ProductDao();
        orderDao = new OrderDao();
        cartDao = new CartDao();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tableType = req.getParameter("table-type");

        if ("Categories".equals(tableType)){
            resp.sendRedirect("/category-list");
        } else if ("Products".equals(tableType)){
            resp.sendRedirect("/product-list");
        } else if ("Orders".equals(tableType)){
            resp.sendRedirect("/order-list");
        } else if ("Carts".equals(tableType)){
            resp.sendRedirect("/cart-list");
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid table type");
        }
    }
}
