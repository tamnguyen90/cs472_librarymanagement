<%--
  Created by IntelliJ IDEA.
  User: bao.nguyen
  Date: 10/20/20
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/checkout.js"></script>
</head>
<body>

<h2>Check out Books</h2>
<div id="errorMessage" class="ui-state-error"></div>
<form action="CheckoutServlet" method="post" id="frmCheckout">
    <label for="memberId">Member ID:</label> <input type="text" id="memberId" name="memberId" value="John"><br>
    <label for="isbn">ISBN:</label> <input type="text" id="isbn" name="isbn" value="Doe"><br><br>
    <input type="button" id="btnSubmit" value="Submit">
</form>

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
        <th># Of Copies</th>
    </tr>
    </thead>
    <tbody id="tbodyBook">
    </tbody>
</table>
</body>
</html>
