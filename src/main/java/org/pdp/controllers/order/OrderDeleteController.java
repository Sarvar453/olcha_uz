package org.pdp.controllers.order;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.OrderDao;
import org.pdp.controllers.category.BaseCategoryController;
import org.pdp.service.OrderService;

import java.io.IOException;


@WebServlet("/delete-order")
public class OrderDeleteController extends BaseCategoryController {
    private  OrderDao orderDao;
    private OrderService orderService;

    @Override
    public void init(ServletConfig config) throws ServletException {
         orderDao = new OrderDao();
         orderService = new OrderService(orderDao);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username = getUsernameFromCookie(req);
        if (username == null) {
            resp.sendRedirect("/login");
            return;
        }
        String orderIdParam = req.getParameter("order_id");
        orderService.deleteOrder(orderIdParam);
        resp.sendRedirect("order-list.jsp");
    }
}
