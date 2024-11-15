package org.pdp.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.CartDao;
import org.pdp.Dao.UserDao;
import org.pdp.context.Context;

import java.io.IOException;

@WebServlet("/admin/cart-list")
public class CartListController extends HttpServlet {
    private final CartDao cartDao = new CartDao();
    private final UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("list", cartDao.getCarts());
        req.setAttribute("userPermission", Context.getCurrentUser().getPermission());
        req.getRequestDispatcher("cart-list.jsp").forward(req, resp);
    }
}
