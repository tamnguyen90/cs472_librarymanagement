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

@WebServlet("/ReturnServlet")
public class ReturnServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sMemberId = req.getParameter("returnMemberId");
        String sIsbn = req.getParameter("returnIsbn");

        int memberId = Integer.parseInt(sMemberId.trim());

        System.out.println(memberId);
        System.out.println(sIsbn);


        //Update checkout record entries
        List<CheckoutRecordEntry> entryList = CheckoutRecordData.getCurrentCheckoutRecords().get(memberId);
        List<CheckoutRecordEntry> updatedEntries =  entryList.stream()
                .filter(entry -> !entry.getBook().getIsbn().equals(sIsbn))
                .collect(Collectors.toList());
        CheckoutRecordData.updateMemberCheckoutRecords(memberId, updatedEntries);

        //Update status checkout of book
        Optional<Book> book = BookData.getCurrentBookList().stream()
                .filter(b -> b.getIsbn().equals(sIsbn))
                .findFirst();

        if(book.isPresent()) {
            book.get().setCheckout(false);
        }

        resp.sendRedirect("success.jsp");
    }
}
