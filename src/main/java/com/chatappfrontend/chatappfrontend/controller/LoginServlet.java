package com.chatappfrontend.chatappfrontend.controller;

import com.chatappfrontend.chatappfrontend.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    static String Username;

    private static final SessionFactory sessionFactory;

    static {
        try {
            Configuration configuration = new Configuration();
            configuration.configure("hibernate.cfg.xml");
            sessionFactory = configuration.buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loginEmail = request.getParameter("loginEmail");
        String loginPassword = request.getParameter("loginPassword");

        User loggedInUser = getLoggedInUser(loginEmail, loginPassword);

        if (loggedInUser != null) {

            Username = loggedInUser.getUsername();
            System.out.println("Welcome, " + Username);


            request.getSession().setAttribute("username", Username);

            response.sendRedirect(request.getContextPath() + "/ChatRoom.jsp");
        } else {
            request.getSession().setAttribute("error", "Invalid Email or Password");
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=invalid");
            System.out.println("Error: Invalid Email or Password");
        }
    }

    private User getLoggedInUser(String email, String password) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM com.chatappfrontend.chatappfrontend.model.User WHERE email = :email AND password = :password";
            User user = (User) session.createQuery(hql)
                    .setParameter("email", email)
                    .setParameter("password", password)
                    .uniqueResult();

            // If the user exists, the email and password match
            return user;
        }
    }
}
