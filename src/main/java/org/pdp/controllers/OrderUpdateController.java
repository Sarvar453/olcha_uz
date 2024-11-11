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

@WebServlet("/update-order")
public class OrderUpdateController extends HttpServlet {
    private final OrderDao orderDao = new OrderDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int orderId = Integer.parseInt(req.getParameter("order_id"));
        int productId = Integer.parseInt(req.getParameter("product_id"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        Order order = new Order(orderId, productId, null, true, quantity, null, null);
        orderDao.updateOrder(order);

        req.setAttribute("list", orderDao.getOrders());
        RequestDispatcher dispatcher = req.getRequestDispatcher("order-list.jsp");
        dispatcher.forward(req, resp);
    }
}
