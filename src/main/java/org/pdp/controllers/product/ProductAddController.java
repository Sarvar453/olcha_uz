package org.pdp.controllers.product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.ProductDao;
import org.pdp.controllers.BaseController;
import org.pdp.entity.Product;
import org.pdp.service.ProductService;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/add-product")
public class ProductAddController extends BaseProductController {
    private ProductDao productDao;
    private ProductService productService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        productDao=new ProductDao();
        productService=new ProductService(productDao);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName = req.getParameter("product-name");
        Double productPrice = Double.parseDouble(req.getParameter("product-price"));
        String productDescription = req.getParameter("product-description");
        String productDiscount = req.getParameter("product-discount");
        Date productFromDelivery = Date.valueOf(req.getParameter("product-from_delivery")) ;
        Date productToDelivery = Date.valueOf(req.getParameter("product-to_delivery"));
        productService.addProduct(productName,productPrice,productDescription,productDiscount,productFromDelivery,productToDelivery,BaseController.getUsernameFromCookie(req));
        req.setAttribute("list", productDao.getProducts());
        RequestDispatcher dispatcher = req.getRequestDispatcher("product-list.jsp");
        dispatcher.forward(req, resp);
    }
}
