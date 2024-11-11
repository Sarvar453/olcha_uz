package org.pdp.controllers;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.OrderDao;

import java.io.IOException;


@WebServlet("/delete-order")
public class OrderDeleteController extends HttpServlet {
    private final OrderDao orderDao = new OrderDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String orderIdParam = req.getParameter("order_id");
        if (orderIdParam!=null &&!orderIdParam.isEmpty()) {
            int orderId = Integer.parseInt(orderIdParam);
            orderDao.deleteOrder(orderId);
        }
        resp.sendRedirect("order-list.jsp");
    }
}
