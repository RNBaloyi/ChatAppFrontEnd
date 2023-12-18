package com.chatappfrontend.chatappfrontend.controller;

import com.chatappfrontend.chatappfrontend.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "SignupServlet", value = "/signup")
public class SignUpServlet extends HttpServlet {

    private static final SessionFactory sessionFactory;

    static {
        try {
            // Create a SessionFactory based on hibernate.cfg.xml configuration
            Configuration configuration = new Configuration();
            configuration.configure("hibernate.cfg.xml");
            sessionFactory = configuration.buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String enteredUsername = request.getParameter("signupUsername");
        String enteredEmail = request.getParameter("signupEmail");
        String enteredPassword = request.getParameter("signupPassword");
        String enteredAddress = request.getParameter("signupAddress");
        String selectedGender = request.getParameter("gender");

        User userDetails = new User();
        userDetails.setUsername(enteredUsername);
        userDetails.setEmail(enteredEmail);
        userDetails.setAddress(enteredAddress);
        userDetails.setGender(selectedGender);
        userDetails.setPassword(enteredPassword);
        userDetails.setCreatedAt(LocalDateTime.now());

        // Save the user details to the database using Hibernate
        saveUser(userDetails);


        request.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
    }

    private void saveUser(User user) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
           // session.save(user);
            session.persist(user);
            transaction.commit();


        }
    }
}
