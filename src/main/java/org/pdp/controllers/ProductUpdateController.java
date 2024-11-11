package org.pdp.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.ProductDao;
import org.pdp.entity.Product;

import java.io.IOException;

@WebServlet("/update-product")
public class ProductUpdateController extends HttpServlet {
    private final ProductDao productDao = new ProductDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("product_id"));
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        int categoryId = Integer.parseInt(req.getParameter("category_id"));

        Product product = new Product(productId, categoryId, name, price, false, null, null);
        productDao.updateProduct(product);

        req.setAttribute("list", productDao.getProducts());
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("product-list.jsp");
        requestDispatcher.forward(req, resp);
    }
}
