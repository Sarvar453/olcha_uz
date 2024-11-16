package org.pdp.auth;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = userDao.getUserByUsernameAndPassword(username, password);
        if (user != null) {
            Context.setCurrentUser(user);
            req.setAttribute("userPermission", user.getPermission());
            addUsernameToCookie(resp, username);
            if(user.getRole().equals("USER")){
                resp.sendRedirect("/user/home-page.jsp");
            }
            else{
                resp.sendRedirect("/admin/category-list");
            }
        } else {
            req.setAttribute("error", "Invalid username or password. Please try again.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req, resp);
        }
    }

    private void addUsernameToCookie(HttpServletResponse response, String username) {
        Cookie cookie = new Cookie("username", username);
        cookie.setMaxAge(240);
        response.addCookie(cookie);
    }
}