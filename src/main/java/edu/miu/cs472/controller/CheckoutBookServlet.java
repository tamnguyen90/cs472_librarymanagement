package edu.miu.cs472.controller;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import edu.miu.cs472.data.BookData;
import edu.miu.cs472.model.Book;

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

@WebServlet("/CheckoutBookServlet")
public class CheckoutBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        String sIsbn = req.getParameter("isbn");

//        Get data from session
//        HttpSession sess = req.getSession();
//        List<Book> books = (List<Book>)sess.getAttribute("books");

        //Get data from file
        List<Book> books = BookData.getCurrentBookList().stream()
                            .filter(book -> !book.isCheckout())
                            .filter(book -> book.getIsbn().startsWith(sIsbn))
                            .collect(Collectors.toList());

        List<Book> matchBooks =  books.stream().
                filter(b -> (b.getIsbn().startsWith(sIsbn)))
                .collect(Collectors.toList());

        Gson gson = new Gson();
        String json = gson.toJson(books);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        out.write(json);
        System.out.println(json);
    }
}
