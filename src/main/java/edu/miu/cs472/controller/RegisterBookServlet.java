package edu.miu.cs472.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.miu.cs472.data.BookData;
import edu.miu.cs472.model.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.google.gson.Gson;

@WebServlet(name = "registerbook", urlPatterns = {"/registerbook"})
public class RegisterBookServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String isbn = req.getParameter("isbn");;
        String title = req.getParameter("title");;
        String authors = req.getParameter("authors");;
        String maxCheckoutDays = req.getParameter("checkoutDays");

        Book newBook = new Book(isbn, title);
        newBook.addAuthor(authors);
        newBook.setMaxCheckout(Integer.parseInt(maxCheckoutDays));
        boolean success = BookData.addNewBook(newBook);
        req.setAttribute("success", success);

        req.getRequestDispatcher("registerBook.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("registerBook.jsp").forward(req, resp);
    }
}

