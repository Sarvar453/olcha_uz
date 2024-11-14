package org.pdp.controllers.order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.OrderDao;
import org.pdp.context.Context;
import org.pdp.controllers.BaseController;

import java.io.IOException;

@WebServlet("/admin/order-list")
public class OrderListController extends BaseController {
    private final OrderDao orderDao = new OrderDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("list", orderDao.getOrders());
        req.setAttribute("userPermission", Context.getCurrentUser().getPermission());
        req.getRequestDispatcher("/admin/order-list.jsp").forward(req, resp);
    }
}
