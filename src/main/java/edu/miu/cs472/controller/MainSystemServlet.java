package edu.miu.cs472.controller;

import edu.miu.cs472.data.BookData;
import edu.miu.cs472.data.LibraryMemberData;
import edu.miu.cs472.model.Book;
import edu.miu.cs472.model.LibraryMember;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "MainSystemServlet", urlPatterns = "/main")
public class MainSystemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<Book> bookCollection = BookData.getCurrentBookList();
        request.setAttribute("libBooks", bookCollection);
        Collection<LibraryMember> libraryMembers = LibraryMemberData.getCurrentMembers();
        request.setAttribute("libMembers", libraryMembers);
    }
}
