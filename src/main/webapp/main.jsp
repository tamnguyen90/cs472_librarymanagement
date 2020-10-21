<%--
  Created by IntelliJ IDEA.
  User: tamnguyen
  Date: 10/20/20
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Library Management System</title>
    <meta charset="UTF-8"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
            integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
            crossorigin="anonymous"></script>
    <script src="js/main.js"></script>
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div class="header">
    Library Management System
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-2 left-panel">
            <div class="left-component">
            <div class="searchBox">
                <input type="text" id="search" placeholder="Search..." oninput="filterContent(this)"/>
            </div>
            <div class="member">
                <ul>
                    <c:forEach var="mem" items="${libMembers}">
                        <li>
                            <a href="#">${mem.fullName}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            </div>
            <div>
                <button id="addLibraryMemberBtn">Add Library Member</button>
            </div>
        </div>
        <div class="col-sm-10 right-panel">
            <div class="right-component">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>ISBN</th>
                    <th>Title</th>
                    <th>Copy</th>
                    <th>Author</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="book" items="${booklist}">
                    <tr>
                        <td>${book.isbn}</td>
                        <td>${book.title}</td>
                        <td>${book.copies}</td>
                        <td>${book.authorStr}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            </div>
            <div class="addBookBtn">
                <button id="addBookBtn">Add Book</button>
            </div>
        </div>
    </div>
</div>
<footer>
    <h6>
        © 2020 Maharishi International University. All Rights Reserved.
    </h6>
</footer>
</body>
</html>
