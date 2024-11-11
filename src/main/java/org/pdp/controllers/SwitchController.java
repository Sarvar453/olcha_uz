package org.pdp.controllers;

import jakarta.servlet.RequestDispatcher;
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
    private final CategoryDao categoryDao = new CategoryDao();
    private final ProductDao productDao = new ProductDao();
    private final OrderDao orderDao = new OrderDao();
    private final CartDao cartDao = new CartDao();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("table-type").equals("Categories")){
            req.setAttribute("list", categoryDao.getCategories());
            req.setAttribute("userPermission", Context.getCurrentUser());
            RequestDispatcher dispatcher = req.getRequestDispatcher("category-list.jsp");
            dispatcher.forward(req,resp);
        }
        else if (req.getParameter("table-type").equals("Products")){
            req.setAttribute("list", productDao.getProducts());
            req.setAttribute("userPermission", Context.getCurrentUser());
            RequestDispatcher dispatcher = req.getRequestDispatcher("product-list.jsp");
            dispatcher.forward(req,resp);
        }
        else if (req.getParameter("table-type").equals("Orders")){
            req.setAttribute("list", orderDao.getOrders());
            req.setAttribute("userPermission", Context.getCurrentUser());
            RequestDispatcher dispatcher = req.getRequestDispatcher("order-list.jsp");
            dispatcher.forward(req,resp);
        }
        else if (req.getParameter("table-type").equals("Carts")){
            req.setAttribute("list", cartDao.getCarts());
            req.setAttribute("userPermission", Context.getCurrentUser());
            RequestDispatcher dispatcher = req.getRequestDispatcher("cart-list.jsp");
            dispatcher.forward(req,resp);
        }
    }
}
