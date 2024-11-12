package org.pdp.controllers.cart;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.CartDao;
import org.pdp.entity.Cart;

import java.io.IOException;

@WebServlet("/update-cart")
public class CartUpdateController extends HttpServlet {
    private final CartDao cartDao = new CartDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int cartId = Integer.parseInt(req.getParameter("cart_id"));
        int productId = Integer.parseInt(req.getParameter("product_id"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        Cart cart = new Cart(cartId, 0, productId, quantity, false, null, null);
        cartDao.updateCart(cart);

        req.setAttribute("list", cartDao.getCarts());
        RequestDispatcher dispatcher = req.getRequestDispatcher("cart-list.jsp");
        dispatcher.forward(req, resp);
    }
}
