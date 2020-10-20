<%--
  Created by IntelliJ IDEA.
  User: namnguyen
  Date: 10/20/20
  Time: 1:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Book</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#addBookBtn').click(addBook);
        });

        function addBook(event) {
            $.ajax('registerbook', {
                "type": "POST",
                "data": {
                    "isbn": $("input[name='isbn']").val(),
                    "title": $("input[name='title']").val()
                }
            }, function () {
                console.log(responseJson);
            });
        }

        function returnData(responseJson) {
            console.log(responseJson);
            $.each(responseJson, function (index, value) {
                $("table tbody").append("<tr><td>" + value.isbn + "</td><td>" + value.title + "</td><td>" + value.copy + "</td><td>" + value.author + "</td></tr>");
            });
        }


    </script>
</head>
<body>
<h1>Add new book below</h1>
<form action="registerbook" method="post">
    <p>Book ISBN: <input type="text" name="isbn"/>
    <p>Book Title: <input type="text" name="title"/>
    <p>Book Copies: <input type="text" name="copy"/>
    <p>Book Authors: <input type="text" name="author"/>
        <button id="addBookBtn">Submit</button>
</form>

<h1>List of Books in system</h1>
<table>
    <thead>
    <tr>
        <th>ISBN</th>
        <th>Title</th>
        <th>Copy</th>
        <th>Author</th>
    </tr>
    </thead>
    <tbody>

    </tbody>
</table>
</body>
</html>
