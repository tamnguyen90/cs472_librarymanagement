package edu.miu.cs472.controller;

import edu.miu.cs472.data.BookData;
import edu.miu.cs472.data.CheckoutRecordData;
import edu.miu.cs472.data.LibraryMemberData;
import edu.miu.cs472.model.Book;
import edu.miu.cs472.model.CheckoutRecordEntry;
import edu.miu.cs472.model.LibraryMember;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sMemberId = req.getParameter("memberId");
        String sIsbn = req.getParameter("isbn");

        int memberId = Integer.parseInt(sMemberId.trim());

//        Load data from session
//        HttpSession sess = req.getSession();
//        List<LibraryMember> members = (List<LibraryMember>)sess.getAttribute("members");
//        List<Book> books = (List<Book>)sess.getAttribute("books");

        Optional<LibraryMember> member =  LibraryMemberData.getCurrentMembers().stream()
                                    .filter(m -> (m.getMemberId() == memberId ))
                                    .findFirst();

        Optional<Book> book = BookData.getCurrentBookList().stream()
                        .filter(b -> b.getIsbn().equals(sIsbn))
                        .filter(b -> !b.isCheckout())
                        .findFirst();

        if(book.isPresent() && member.isPresent()) {
            //process checkout the book for memberId.
            checkOut(book.get(), member.get());

            resp.sendRedirect("success.jsp");
        } else {
            //already borrowed the book, can not check it out.
            resp.sendRedirect("errorCheckout.jsp");
        }
    }

    public void checkOut(Book book, LibraryMember member) {
            book.setCheckout(true);
            LocalDate date = LocalDate.now();

            CheckoutRecordEntry checkoutEntry = new CheckoutRecordEntry(date, date.plusDays(30),book);
            checkoutEntry.setOwner(member);
            CheckoutRecordData.addNewCheckoutRecord(checkoutEntry);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("isbn", req.getParameter("isbn"));
        req.setAttribute("memberId", req.getParameter("memberId"));
        req.getRequestDispatcher("checkout.jsp").forward(req, resp);
    }
}
