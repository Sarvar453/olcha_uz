package org.pdp.controllers.admin_product;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.ProductDao;
import org.pdp.entity.Product;
import org.pdp.service.ProductService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/api/product/list")
public class ProductRestController extends HttpServlet {
    private ObjectMapper objectMapper;
    private ProductService productService;

    @Override
    public void init() {
        this.objectMapper = new ObjectMapper();
        this.productService = new ProductService(new ProductDao());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<Product> productList = productService.getProductList();
        resp.setContentType("text/json");
        PrintWriter writer = resp.getWriter();
        writer.println(objectMapper.writeValueAsString(productList));
    }
}
