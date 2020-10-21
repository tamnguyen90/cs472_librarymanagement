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
        HttpSession session = req.getSession();
        Collection<Book> booklist = BookData.getCurrentBookList();
        String isbn;
        String title;
        String author;
        isbn = req.getParameter("isbn");
        title = req.getParameter("title");
        author = req.getParameter("author");
        Book newBook = new Book(isbn, title);
        BookData.addNewBook(new Book(isbn,title));

        String json = null;
        json = new Gson().toJson(booklist);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (req.getAttribute("booklist") == null) {
            req.setAttribute("booklist", BookData.getCurrentBookList());
        }
        resp.sendRedirect("registerBook.jsp");
    }
}

