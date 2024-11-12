package org.pdp.controllers.order;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.CategoryDao;
import org.pdp.Dao.OrderDao;
import org.pdp.controllers.category.BaseCategoryController;

import java.io.IOException;

public class OrderListController extends BaseCategoryController {
    private final OrderDao orderDao = new OrderDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("list", orderDao.getOrders());
        req.getRequestDispatcher("order-list.jsp").forward(req, resp);
    }
}
