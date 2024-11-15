package org.pdp.controllers.admin_product;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.ProductDao;
import org.pdp.context.Context;

import java.io.IOException;

@WebServlet("/admin/product-list")
public class ProductListController extends HttpServlet {
    private ProductDao productDao;

    @Override
    public void init(ServletConfig config) throws ServletException {
         productDao = new ProductDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("list", productDao.getProducts());
        req.setAttribute("userPermission", Context.getCurrentUser().getPermission());
        req.getRequestDispatcher("/admin/product-list.jsp").forward(req, resp);
    }
}
