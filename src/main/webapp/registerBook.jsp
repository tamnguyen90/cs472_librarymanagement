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
    <title>ADD NEW BOOK</title>
    <meta charset="UTF-8"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
            integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
            crossorigin="anonymous"></script>
    <script src="js/addBook.js"></script>
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <div class="card text-center">
            <div class="card-header">
                <h4>Add New Book</h4>
            </div>
            <div class="card-body">
                <form action="registerbook" method="post">
                    <div class="form-group row">
                        <label for="isbn" class="col-sm-4 col-form-label">ISBN</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="isbn" name="isbn"
                                   placeholder="ISBN" required />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="title" class="col-sm-4 col-form-label">Title</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="title" name="title" placeholder="Book title" required />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="author" class="col-sm-4 col-form-label">Authors</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="author" name="authors" placeholder="Authors">
                            <small id="authorHelp" class="form-text text-muted">Each author separated by the comma(',').</small>
                        </div>
                    </div>
                    <div class="form-group" style="text-align: center;">
                        <button type="submit" class="btn btn-outline-primary" id="addBookBtn">Add Book</button>
                        <button type="button" class="btn btn-outline-secondary" id="cancelBtn">Back To Main</button>
                    </div>
                    <div>
                        <c:if test="${success}">
                            <p>Added successfully</p>
                        </c:if>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />

</body>
</html>
