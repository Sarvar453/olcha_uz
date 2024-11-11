package org.pdp.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.config.PostgresDatabaseConfig;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/home")
public class CategoryController extends HttpServlet {

    private final PostgresDatabaseConfig postgresDatabaseConfig = new PostgresDatabaseConfig();
    private static final String ADD_CATEGORY_QUERY = "select * from add_category(?,?,?);";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        String name = req.getParameter("name");
        String description = req.getParameter("description");
        boolean isActive = Boolean.parseBoolean(req.getParameter("isActive"));

        try (Connection connection = postgresDatabaseConfig.connect();
             PreparedStatement preparedStatement = connection.prepareStatement(ADD_CATEGORY_QUERY)) {

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.setBoolean(3, isActive);

            int result = preparedStatement.executeUpdate();
            if (result > 0) {
                req.setAttribute("message", "Category successfully added!");
            } else {
                req.setAttribute("message", "Failed to add category.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("message", "Error: " + e.getMessage());
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
        dispatcher.forward(req, resp);
    }
}
