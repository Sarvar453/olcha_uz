package org.pdp.controllers.order;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.pdp.Dao.OrderDao;
import org.pdp.controllers.category.BaseCategoryController;
import org.pdp.service.OrderService;

import java.io.IOException;

@WebServlet("/add-order")
public class OrderAddController extends BaseCategoryController {
    private  OrderDao orderDao;
    private  OrderService orderService;

    @Override
    public void init(ServletConfig config) throws ServletException {
         orderDao = new OrderDao();
         orderService = new OrderService(orderDao);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = getUsernameFromCookie(req);
        if (username == null) {
            resp.sendRedirect("/login");
            return;
        }

        String productIdParam = req.getParameter("product_id");
        String quantityParam = req.getParameter("quantity");
        orderService.addOrder(productIdParam, quantityParam);
        req.setAttribute("list", orderDao.getOrders());
        RequestDispatcher dispatcher = req.getRequestDispatcher("order-list.jsp");
        dispatcher.forward(req, resp);
    }
}
