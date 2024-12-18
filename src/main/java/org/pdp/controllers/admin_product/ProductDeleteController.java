package org.pdp.controllers.admin_product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.ProductDao;

import java.io.IOException;

@WebServlet("/admin/delete-product")
public class ProductDeleteController extends HttpServlet {
    private  final ProductDao productDao = new ProductDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productIdParam = req.getParameter("product_id");
        if(productIdParam != null && !productIdParam.isEmpty()) {
            int productId = Integer.parseInt(productIdParam);
            productDao.deleteProduct(productId);
        }
        resp.sendRedirect("/admin/product-list");
    }
}
