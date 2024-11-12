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

@WebServlet("/switch")
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
        if (req.getParameter("table-type").equals("Categories")){
            req.setAttribute("list", categoryDao.getCategories());
            resp.sendRedirect("/category-list");
        }
        else if (req.getParameter("table-type").equals("Products")){
            req.setAttribute("list", productDao.getProducts());
            resp.sendRedirect("/product-list");
        }
        else if (req.getParameter("table-type").equals("Orders")){
            req.setAttribute("list", orderDao.getOrders());
            req.setAttribute("userPermission", Context.getCurrentUser().getPermission());
            resp.sendRedirect("/order-list");
        }
        else if (req.getParameter("table-type").equals("Carts")){
            req.setAttribute("list", cartDao.getCarts());
            req.setAttribute("userPermission", Context.getCurrentUser().getPermission());
            resp.sendRedirect("/cart-list");
        }
    }
}
