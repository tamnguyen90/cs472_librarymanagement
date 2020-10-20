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
    <script>
        $(document).ready(function () {
            $('#addBookBtn').click(addBook);
        });
        function addBook(event) {
            event.preventDefault();
            $.post('registerbook',{
                "isbn": $("input[name='isbn']").val(),
                "title": $("input[name='title']").val(),
                "author": $("input[name='author']").val()
            }).done(returnData);
        }

        function returnData(responseJson) {
            var list = $('#list');
            list.find('tr').remove();
            $.each(responseJson, function (index, value) {
                $("table tbody").append("<tr><td>" + value.isbn + "</td><td>" + value.title + "</td><td>" + value.copies + "</td><td>" + value.authors + "</td></tr>");
            });
        }


    </script>
</head>
<body>
<h1>List of Books in system</h1>
<table class="table table-striped">
    <thead>
    <tr>
        <th>ISBN</th>
        <th>Title</th>
        <th>Copy</th>
        <th>Author</th>
    </tr>
    </thead>
    <tbody id="list">
        <c:forEach var="book" items="${booklist}">
            <tr>
                <td>${book.isbn}</td>
                <td>${book.title}</td>
                <td>${book.copies}</td>
                <td>${book.authors}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<h1>Add new book below: </h1>
<form action="registerbook" method="post">
    <p>Book ISBN: <input type="text" name="isbn"/>
    <p>Book Title: <input type="text" name="title"/>
    <p>Book Copies: <input type="text" name="copy"/>
    <p>Book Authors: <input type="text" name="author"/>
    <br>
    <button id="addBookBtn">Submit</button>
</form>
</body>
</html>
