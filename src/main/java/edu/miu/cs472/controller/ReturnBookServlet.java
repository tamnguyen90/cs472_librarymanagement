package edu.miu.cs472.controller;


import com.google.gson.Gson;
import com.google.gson.JsonElement;
import edu.miu.cs472.data.BookData;
import edu.miu.cs472.data.CheckoutRecordData;
import edu.miu.cs472.model.Book;
import edu.miu.cs472.model.CheckoutRecordEntry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/ReturnBookServlet")
public class ReturnBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        String sMemberId = req.getParameter("memberId");
        String sIsbn = req.getParameter("isbn");

        int memberId = Integer.parseInt(sMemberId.trim());

        //Get data from BookDat
        List<Book> books = CheckoutRecordData.getCurrentCheckoutRecords().get(memberId).stream()
                                                .map(entry -> entry.getBook())
                                                .filter(book -> book.isCheckout())
                                                .filter(book -> book.getIsbn().startsWith(sIsbn))
                                                .collect(Collectors.toList());

        Gson gson = new Gson();
        String json = gson.toJson(books);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        out.write(json);
    }
}
