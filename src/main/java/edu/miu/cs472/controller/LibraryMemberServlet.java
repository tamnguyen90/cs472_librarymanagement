package edu.miu.cs472.controller;

import com.google.gson.Gson;
import edu.miu.cs472.data.LibraryMemberData;
import edu.miu.cs472.model.LibraryMember;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/LibraryMemberServlet")
public class LibraryMemberServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        String sMemberId = req.getParameter("memberId");

        //get data from session
//        HttpSession sess = req.getSession();
//        List<LibraryMember> members = (List<LibraryMember>)sess.getAttribute("members");

        //get data from file
        List<LibraryMember> members = (List<LibraryMember>) LibraryMemberData.getCurrentMembers();

        List<LibraryMember> matchMembers =  members.stream().
                filter(m -> (String.valueOf(m.getMemberId()).startsWith(sMemberId)))
                .collect(Collectors.toList());

        String json = "";
        json = new Gson().toJson(matchMembers);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        out.write(json);
    }
}