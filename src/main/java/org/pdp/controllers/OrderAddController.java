package org.pdp.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.OrderDao;
import org.pdp.entity.Order;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/add-order")
public class OrderAddController extends HttpServlet {
    private final OrderDao orderDao = new OrderDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productIdParam = req.getParameter("product_id");
        String quantityParam = req.getParameter("quantity");
        int quantity = Integer.parseInt(quantityParam);
        Integer productId = productIdParam != null ? Integer.parseInt(productIdParam) : null;

        Order order = new Order(0, 0, null, false, 0, null, null);
        orderDao.addOrder(order);
        req.setAttribute("list", orderDao.getOrders());
        RequestDispatcher dispatcher = req.getRequestDispatcher("order-list.jsp");
        dispatcher.forward(req, resp);
    }
}
