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

@WebServlet(name = "registerbook", urlPatterns = {"/registerbook"})
public class RegisterBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("booklist") == null){
            ArrayList<Book> booklist = new ArrayList<>();
            booklist.add(new Book("9781593275846","Eloquent JavaScript, Second Edition",null, null));
            booklist.add(new Book("9781449331818","Learning JavaScript Design Patterns",null, null));
            booklist.add(new Book("9781449365035","Speaking JavaScript",null, null));
            session.setAttribute("booklist",booklist);
        }
        else {
            ArrayList<Book> booklist = (ArrayList<Book>)session.getAttribute("booklist");
        }



    }




}

