<%--
  Created by IntelliJ IDEA.
  User: bao.nguyen
  Date: 10/21/20
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script type="text/javascript" src="js/checkout.js"></script>
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container-fluid">
        <div style="text-align: center;">
            <h4>Update successfully...</h4>
        </div>
        <div style="text-align: center;">
            <form id="successMessage" action="main">
                <input type="button" class="btn btn-outline-secondary" id="btnGotoHome" value="Return Home Page">
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
