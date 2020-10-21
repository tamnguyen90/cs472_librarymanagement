<%--
  Created by IntelliJ IDEA.
  User: namnguyen
  Date: 10/20/20
  Time: 1:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Register Book</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%--    <script>--%>
<%--        $(document).ready(function () {--%>
<%--            $('#addBookBtn').click(addBook);--%>
<%--        });--%>
<%--        function addBook(event) {--%>
<%--            event.preventDefault();--%>
<%--            $.post('registerbook',{--%>
<%--                "isbn": $("input[name='isbn']").val(),--%>
<%--                "title": $("input[name='title']").val(),--%>
<%--                "author": $("input[name='author']").val()--%>
<%--            }).done(returnData);--%>
<%--        }--%>

<%--        function returnData(responseJson) {--%>
<%--            var list = $('#list');--%>
<%--            list.find('tr').remove();--%>
<%--            $.each(responseJson, function (index, value) {--%>
<%--                $("table tbody").append("<tr><td>" + value.isbn + "</td><td>" + value.title + "</td><td>" + value.copies + "</td><td>" + value.authors + "</td></tr>");--%>
<%--            });--%>
<%--        }--%>


<%--    </script>--%>
    <link rel="stylesheet" type="text/css" href="css/registerBook.css">
</head>
<body>
<header>
    <div>Library Management System</div>
</header>
<%--<h1>List of Books in system</h1>--%>
<%--<table class="table table-striped">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>ISBN</th>--%>
<%--        <th>Title</th>--%>
<%--        <th>Copy</th>--%>
<%--        <th>Author</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody id="list">--%>
<%--        <c:forEach var="book" items="${booklist}">--%>
<%--            <tr>--%>
<%--                <td>${book.isbn}</td>--%>
<%--                <td>${book.title}</td>--%>
<%--                <td>${book.copies}</td>--%>
<%--                <td>${book.authors}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </tbody>--%>
<%--</table>--%>
<div id="main_content">
<h5>Add new book:</h5>
<form action="registerbook" method="post">
    <br>
    <table>
        <br>
    <tr><td><label>Book ISBN: </label></td><td><input type="text" name="isbn"/></td></tr>
        <tr> <td><label>Book Title: </label></td><td><input type="text" name="title"/></td></tr>
        <tr><td><label>Book Copies: </label></td><td><input type="text" name="copy"/></td></tr>
        <tr><td><label>Book Authors: </label></td><td><input type="text" name="author"/></td></tr>

    </table>
    <br>
    <br>
    <br>
    <br>
    <div id="button"><button id="cancelBtn">Cancel</button><button id="addBookBtn">Submit</button></div>
</form>
</div>
    <footer>
        <h6>
            © 2020 Maharishi International University. All Rights Reserved.
        </h6>
    </footer>

</body>
</html>
