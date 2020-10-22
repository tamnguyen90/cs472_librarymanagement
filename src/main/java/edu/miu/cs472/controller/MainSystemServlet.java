package edu.miu.cs472.controller;

import edu.miu.cs472.data.BookData;
import edu.miu.cs472.data.CheckoutRecordData;
import edu.miu.cs472.data.LibraryMemberData;
import edu.miu.cs472.model.Book;
import edu.miu.cs472.model.CheckoutRecordEntry;
import edu.miu.cs472.model.LibraryMember;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

@WebServlet(name = "MainSystemServlet", urlPatterns = {"/main", "/libraryMember"})
public class MainSystemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<Integer, List<CheckoutRecordEntry>> checkoutRecordMap = CheckoutRecordData.getCurrentCheckoutRecords();
        String servletPath = request.getServletPath();
        Collection<Book> bookCollection = BookData.getCurrentBookList();
        request.setAttribute("libBooks", bookCollection);
        request.setAttribute("checkoutRecords", checkoutRecordMap.values());
        Collection<LibraryMember> libraryMembers = LibraryMemberData.getCurrentMembers();
        request.setAttribute("libMembers", libraryMembers);


        //handler when user clicking on each member
        if ("/libraryMember".equals(servletPath)) {
            String memberId = request.getParameter("memberId");
            request.setAttribute("recordsDetail", checkoutRecordMap.get(Integer.parseInt(memberId)));
            LibraryMember member = LibraryMemberData.getLibraryMemberById(Integer.parseInt(memberId));
            request.setAttribute("libMember", member);
        }

        RequestDispatcher view = request.getRequestDispatcher("main.jsp");
        view.forward(request, response);
    }
}
