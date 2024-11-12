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

@WebServlet("/add-cart")
public class CartAddController extends HttpServlet {            
    private final CartDao cartDao = new CartDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productIdParam = req.getParameter("product_id");
        String quantityParam = req.getParameter("quantity");
        int quantity = Integer.parseInt(quantityParam);
        Integer productId = productIdParam != null ? Integer.parseInt(productIdParam) : null;

        Cart cart = new Cart(0, 0, 0, 0, false, null, null);
        cartDao.addCart(cart);
        req.setAttribute("list", cartDao.getCarts());
        RequestDispatcher dispatcher = req.getRequestDispatcher("cart-list.jsp");
        dispatcher.forward(req, resp);
    }
}
