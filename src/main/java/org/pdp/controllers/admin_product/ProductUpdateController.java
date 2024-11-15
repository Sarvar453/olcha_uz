package org.pdp.controllers.admin_product;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.ProductDao;
import org.pdp.service.ProductService;

import java.io.IOException;

@WebServlet("/admin/update-product")
public class ProductUpdateController extends HttpServlet {
    private ProductService productService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        productService = new ProductService(new ProductDao());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = (String) req.getAttribute("authentication");
        Integer productId = Integer.parseInt(req.getParameter("product-id"));
        Integer categoryId = Integer.parseInt(req.getParameter("category-id"));
        String productName = req.getParameter("product-name");
        Double productPrice = Double.parseDouble(req.getParameter("product-price"));
        String productDescription = req.getParameter("product-description");
        String productDiscount = req.getParameter("product-discount");
        String productFromDelivery = req.getParameter("product-from_delivery");
        String productToDelivery = req.getParameter("product-to_delivery");
        if (username == null){
            resp.sendRedirect("/login");
            return;
        }
        productService.updateProduct(productId,categoryId,productName,productPrice,null,null,null,productDescription,productDiscount,productFromDelivery,productToDelivery,username);
        resp.sendRedirect("/admin/product-list");
    }
}
