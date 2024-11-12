package org.pdp.controllers.cart;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.CartDao;

import java.io.IOException;

@WebServlet("/delete-cart")
public class CartDeleteController extends HttpServlet {
    private final CartDao cartDao = new CartDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String cartIdParam = req.getParameter("cart_id");
        if (cartIdParam != null && !cartIdParam.isEmpty()) {
            int cartId = Integer.parseInt(cartIdParam);
            cartDao.deleteCart(cartId);
        }
        resp.sendRedirect("cart-list.jsp");
    }
}
