package edu.miu.cs472.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.miu.cs472.model.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

@WebServlet(name = "registerbook", urlPatterns = {"/registerbook"})
public class RegisterBookServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ArrayList<Book> booklist = (ArrayList<Book>) session.getAttribute("booklist");
        String isbn;
        String title;
        List<BookCopy> copies = new ArrayList<BookCopy>();
        String author;
        isbn = req.getParameter("isbn");
        title = req.getParameter("title");
        copies = null;
        author = req.getParameter("author");
        booklist.add(new Book(isbn,title,copies,author));
        String json = null;
        json = new Gson().toJson(booklist);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ArrayList<Book> booklist = new ArrayList<>();
        booklist.add(new Book("9781593275846", "Eloquent JavaScript, Second Edition", null, "Marijn Haverbeke"));
        booklist.add(new Book("9781449331818", "Learning JavaScript Design Patterns", null, "Addy Osmani"));
        booklist.add(new Book("9781449365035", "Speaking JavaScript", null, "Axel Rauschmayer"));
        if (session.getAttribute("booklist") == null) {
            session.setAttribute("booklist", booklist);
        } else {
            booklist = (ArrayList<Book>) session.getAttribute("booklist");
        }
        resp.sendRedirect("registerBook.jsp");
    }
}

