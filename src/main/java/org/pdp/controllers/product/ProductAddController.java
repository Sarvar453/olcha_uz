package org.pdp.controllers.product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.ProductDao;
import org.pdp.entity.Product;

import java.io.IOException;

@WebServlet("/add-product")
public class ProductAddController extends HttpServlet {
    private final ProductDao productDao = new ProductDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName = req.getParameter("product_name");
        String priceParam = req.getParameter("price");
        double price = Double.parseDouble(priceParam);
        String categoryIdParam = req.getParameter("category_id");
        Integer categoryId = categoryIdParam != null ? Integer.parseInt(categoryIdParam) : null;

        Product product = new Product(0, categoryId, productName, price, false, null, null);
        productDao.addProduct(product);
        req.setAttribute("list", productDao.getProducts());
        RequestDispatcher dispatcher = req.getRequestDispatcher("product-list.jsp");
        dispatcher.forward(req, resp);
    }
}
