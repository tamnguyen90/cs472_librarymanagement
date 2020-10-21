<%--
  Created by IntelliJ IDEA.
  User: bao.nguyen
  Date: 10/21/20
  Time: 01:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/checkout.js"></script>
    <link rel="stylesheet" type="text/css" href="css/checkout.css">
</head>
<body>
<header>
    <div>Library Management System</div>
</header>
<div id="main_content">
    <h5 align="center">Return Book</h5>

    <form action="ReturnServlet" method="post" id="frmReturnBook">
        <table>
            <tr>
                <td><label for="returnMemberId">Member ID:</label></td>
                <td><input type="text" id="returnMemberId" name="returnMemberId" placeholder="Fill out memberId" required></td>
            </tr>
            <tr>
                <td><label for="returnIsbn">ISBN:</label></td>
                <td><input type="text" id="returnIsbn" name="returnIsbn" placeholder="Fill out isbn" required></td>
            </tr>
        </table>
        <br><br>
    </form>

    <div id="errorMessage" class="ui-state-error"></div>

    <form id="tblList">
    <div id="libraryMember"></div>
    <table>
        <thead>
        <tr>
            <th></th>
            <th>Member ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Phone</th>
        </tr>
        </thead>
        <tbody id="tbodyMember">
        </tbody>
    </table>

    <p></p>
    <div id="book"></div>
    <table>
        <thead>
        <tr>
            <th></th>
            <th>ISBN</th>
            <th>Title</th>
        </tr>
        </thead>
        <tbody id="tbodyBook">
        </tbody>
    </table>
    </form>

    <div class="button"> <input type="button" id="btnReturn" value="Return Book"> </div>
</div>>
<footer>
    <h6>
        © 2020 Maharishi International University. All Rights Reserved.
    </h6>
</footer>
</body>
</html>
