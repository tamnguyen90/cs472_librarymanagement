package edu.miu.cs472.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.miu.cs472.data.LibraryMemberData;
import edu.miu.cs472.model.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;

@WebServlet(name = "registerlibrarymember", urlPatterns = {"/registerlibrarymember"})
public class RegisterLibraryMember extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstname");
        String lastName = req.getParameter("lastname");
        String street = req.getParameter("street");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String zip = req.getParameter("zip");
        Address address = new Address(street,city,state,zip);
        String phone = req.getParameter("phone");
        boolean success = LibraryMemberData.addNewMember(new LibraryMember(firstName,lastName,address,phone));
        req.setAttribute("success", success);

        req.getRequestDispatcher("registerLibraryMember.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("registerLibraryMember.jsp").forward(req, resp);
    }
}

