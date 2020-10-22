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
    <jsp:include page="header.jsp" />
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-2 left-panel">
                <div class="searchBox">
                    <input type="text" class="bd-search d-flex align-items-center" id="searchBox" placeholder="Search..."/>
                </div>
                <div class="member">
                    <ul id="memLst">
                        <h5>Library members</h5>
                        <c:forEach var="mem" items="${libMembers}">
                            <li>
                                <a href="libraryMember?memberId=${mem.memberId}">${mem.fullName}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div style="text-align: center; padding-top: 0.5em;">
                    <form action="registerlibrarymember" method="get">
                        <button type="submit" class="btn btn-outline-primary" id="addMember">Add Member</button>
                    </form>
                </div>
            </div>
            <div class="col-sm-10 right-panel">
                <c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
                <c:choose>
                    <c:when test="${'/main' eq path}">
                        <jsp:include page="main-panel.jsp" />
                    </c:when>

                    <c:when test="${'/libraryMember' eq path}">
                        <jsp:include page="memberDetail.jsp" />
                    </c:when>
                </c:choose>

            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
