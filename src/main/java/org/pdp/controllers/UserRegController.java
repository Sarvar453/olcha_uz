package org.pdp.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.UserDao;
import org.pdp.config.PostgresDatabaseConfig;
import org.pdp.entity.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/sign-up")
public class UserRegController extends HttpServlet {
    private final PostgresDatabaseConfig postgresDatabaseConfig = new PostgresDatabaseConfig();
    private final UserDao userDao = new UserDao();
    private static final String SIGN_UP = "select * from create_user(?, ?, ?, ?, ?, ?)";
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        RequestDispatcher dispatcher = req.getRequestDispatcher("sign-up.jsp");
        dispatcher.forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String createUsername = req.getParameter("name");
        String createPhone_number = req.getParameter("phone-number");
        String createPassword = req.getParameter("create-password");
        String createEmail = req.getParameter("email");
        String confirmPassword = req.getParameter("confirm-password");
        String createRole = req.getParameter("role");
        String createPermission = req.getParameter("permission");
        if (createPassword.equals(confirmPassword)) {
            try (Connection connect = postgresDatabaseConfig.connect();
                 PreparedStatement preparedStatement = connect.prepareStatement(SIGN_UP)) {
                preparedStatement.setString(1, createUsername);
                preparedStatement.setString(2, createPhone_number);
                preparedStatement.setString(3, createPassword);
                preparedStatement.setString(4, createEmail);
                preparedStatement.setString(5, createRole);
                preparedStatement.setString(6, createPermission);

                ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    User user = new User(resultSet);
                    userDao.addUser(user);
                    RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
                    dispatcher.forward(req,resp);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "User registration failed.");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Passwords do not match.");
        }
    }
}
