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

@WebServlet(name = "registerlibrarymember", urlPatterns = {"/registerlibrarymember"})
public class RegisterLibraryMember extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ArrayList<LibraryMember> librarymemberlist = (ArrayList<LibraryMember>) session.getAttribute("librarymemberlist");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String street = req.getParameter("street");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String zip = req.getParameter("zip");
        Address address = new Address(street,city,state,zip);
        String phone = req.getParameter("phone");
        librarymemberlist.add(new LibraryMember(firstName,lastName,address,phone));
        String json = null;
        json = new Gson().toJson(librarymemberlist);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ArrayList<LibraryMember> librarymemberlist = new ArrayList<>();
        librarymemberlist.add(new LibraryMember("Nam", "Nguyen",new Address("25/3 Ha Huy Tap","Da Lat","Lam Dong","70000"),"123456"));
        librarymemberlist.add(new LibraryMember("Tam", "Nguyen",new Address("20 Huynh Thuc Khang","Ho Chi Minh"," ","70000"),"123456"));
        librarymemberlist.add(new LibraryMember("Bao", "Vo",new Address("220 To Vinh Dien","Ho Chi Minh"," ","70000"),"123456"));


        if (session.getAttribute("librarymemberlist") == null) {
            session.setAttribute("librarymemberlist", librarymemberlist);
        } else {
            librarymemberlist = (ArrayList<LibraryMember>) session.getAttribute("librarymemberlist");
        }
        resp.sendRedirect("registerLibraryMember.jsp");
    }
}

