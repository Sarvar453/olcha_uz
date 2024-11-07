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
    private static final String SIGN_UP = "select * from create_users(?, ?, ?)";
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        RequestDispatcher dispatcher = req.getRequestDispatcher("sign-up.jsp");
        dispatcher.forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String createUsername = req.getParameter("create-username");
        String createEmail = req.getParameter("create-email");
        String createPassword = req.getParameter("create-password");
        String confirmPassword = req.getParameter("confirm-password");

        if (createPassword.equals(confirmPassword)) {
            try (Connection connect = postgresDatabaseConfig.connect();
                 PreparedStatement preparedStatement = connect.prepareStatement(SIGN_UP)) {

                preparedStatement.setString(1, createUsername);
                preparedStatement.setString(2, createEmail);
                preparedStatement.setString(3, createPassword);

                ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    User user = new User(resultSet);
                    userDao.addUser(user);
                    RequestDispatcher dispatcher = req.getRequestDispatcher("sign-in.jsp");
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
