package org.pdp.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/permission")
public class PermissionController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("permission.jsp");
        dispatcher.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String role = req.getParameter("role");
        if ("admin".equalsIgnoreCase(role)) {
            req.setAttribute("CREATE", true);
            req.setAttribute("UPDATE", true);
            req.setAttribute("DELETE", true);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/home.jsp");
            dispatcher.forward(req, resp);
        } else if ("user".equalsIgnoreCase(role)) {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/user/home.jsp");
            dispatcher.forward(req, resp);
        } else {
            req.setAttribute("error", "Invalid role. Please select either 'admin' or 'user'.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/sign-up.jsp");
            dispatcher.forward(req, resp);
        }
    }    
}
