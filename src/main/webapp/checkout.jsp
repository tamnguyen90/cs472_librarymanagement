<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Checkout Book</title>
    <meta charset="UTF-8"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
            integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
            crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/checkout.js"></script>
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<jsp:include page="header.jsp" />
    <div class="container">
        <div class="card text-center">
            <div class="card-header">
                <h4>Checkout Book</h4>
            </div>
            <div class="card-body">
                <form action="CheckoutServlet" method="post" id="frmCheckout">
                    <div class="form-group row">
                        <label for="memberId" class="col-sm-4 col-form-label">Member Id</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="memberId" name="memberId" value="${memberId}" placeholder="Member Id" required />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="isbn" class="col-sm-4 col-form-label">ISBN</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="isbn" name="isbn" value="${isbn}" placeholder="ISBN" required />
                        </div>
                    </div>
                </form>
                <div id="errorMessage" class="ui-state-error row"></div>

                <table class="table table-striped" name="checkoutBook">
                    <thead class="thead-light">
                    <tr>
                        <th></th>
                        <th>Member Id</th>
                        <th>First name</th>
                        <th>Last name</th>
                        <th>Phone</th>
                    </tr>
                    </thead>
                    <tbody id="tbodyMember">
                    </tbody>
                </table>
                <div class="row" id="book"></div>
                <table class="table table-striped">
                    <thead class="thead-light">
                    <tr>
                        <th></th>
                        <th>ISBN</th>
                        <th>Title</th>
                    </tr>
                    </thead>
                    <tbody id="tbodyBook">
                    </tbody>
                </table>
                <div style="text-align: center;">
                    <form action="main" method="get">
                        <button type="button" class="btn btn-outline-primary" id="btnSubmit">Checkout Book</button>
                        <button type="submit" class="btn btn-outline-secondary" >Back To Main</button>
                    </form>

                </div>
            </div>

        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
