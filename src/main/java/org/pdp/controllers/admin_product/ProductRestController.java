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
        List<Product> productList;
        resp.setContentType("text/json");
        String categoryId = req.getParameter("categoryId");
        if (categoryId != null) {
            try {
                int parsedId = Integer.parseInt(categoryId);
                productList = productService.getProductListByCategoryId(parsedId);
            } catch (NumberFormatException e) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                resp.getWriter().write("{\"error\": \"Invalid categoryId\"}");
                return;
            }
        } else {
            productList = productService.getProductList();
        }
        PrintWriter writer = resp.getWriter();
        writer.println(objectMapper.writeValueAsString(productList));
    }
}
