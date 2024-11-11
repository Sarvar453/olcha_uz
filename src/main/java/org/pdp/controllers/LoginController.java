package org.pdp.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.pdp.Dao.CategoryDao;
import org.pdp.Dao.UserDao;
import org.pdp.context.Context;
import org.pdp.entity.User;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private final UserDao userDao = new UserDao();
    private final CategoryDao categoryDao = new CategoryDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
        dispatcher.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("name");
        String password = req.getParameter("password");
        User user = userDao.getUserByUsernameAndPassword(username, password);
        if (user != null) {
            Context.setCurrentUser(user);
            req.setAttribute("list", categoryDao.getCategories());
            req.setAttribute("userPermission", user.getPermission());
            RequestDispatcher dispatcher = req.getRequestDispatcher("category-list.jsp");
            dispatcher.forward(req,resp);
        } else {
            req.setAttribute("error", "Invalid username or password. Please try again.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req, resp);
        }
    }
}