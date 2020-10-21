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
    <title>Register Library Member</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <%--    <script>--%>
    <%--        $(document).ready(function () {--%>
    <%--            $('#addLibraryMemberBtn').click(addLibraryMember);--%>
    <%--        });--%>

    <%--        function addLibraryMember(event) {--%>
    <%--            event.preventDefault();--%>
    <%--            $.post('registerlibrarymember',{--%>
    <%--                "firstName": $("input[name='firstName']").val(),--%>
    <%--                "lastName": $("input[name='lastName']").val(),--%>
    <%--                "street": $("input[name='street']").val(),--%>
    <%--                "city": $("input[name='city']").val(),--%>
    <%--                "state": $("#state option:selected").text(),--%>
    <%--                "zip": $("input[name='zip']").val(),--%>
    <%--                "phone": $("input[name='phone']").val(),--%>
    <%--            }).done(returnData);--%>
    <%--        }--%>

    <%--        function returnData(responseJson) {--%>
    <%--            var list = $('#list');--%>
    <%--            list.find('tr').remove();--%>
    <%--            $.each(responseJson, function (index, value) {--%>
    <%--                console.log(value);--%>
    <%--                var strAdd = value.address.street + ',' + value.address.city + ',' + value.address.state + ',' + value.address.zip;--%>
    <%--                console.log(strAdd);--%>

    <%--                $("#returndata").append("<tr><td>" + value.firstName + "</td><td>" + value.lastName + "</td><td>" + strAdd + "</td><td>" + value.phone + "</td></tr>");--%>
    <%--            });--%>
    <%--        }--%>


    <%--    </script>--%>
    <link rel="stylesheet" type="text/css" href="css/registerLibraryMember.css">
</head>
<body>
<%--<h2>List of Library Member in system</h2>--%>
<%--<table class="table table-striped" id="returndata">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>First Name</th>--%>
<%--        <th>Last Name</th>--%>
<%--        <th>Address</th>--%>
<%--        <th>Phone</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody id="list">--%>
<%--    <c:forEach var="libraryMember" items="${librarymemberlist}">--%>
<%--        <tr>--%>
<%--            <td>${libraryMember.firstName}</td>--%>
<%--            <td>${libraryMember.lastName}</td>--%>
<%--            <td>${libraryMember.address}</td>--%>
<%--            <td>${libraryMember.phone}</td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--</table>--%>

<header>
    <div>Library Management System</div>
</header>

<div id="main_content">
    <h5>Add new member: </h5>
    <form action="registerlibrarymember" method="post">
        <table>
            <tr><td><label>First Name</label></td>
                <td><input type="text" name="firstName"/></td></tr>
            <tr><td><label>Last Name</label></td>
            <td><input type="text" name="lastName"/><td></tr>
            <tr><td><label class="address">Address:</label></td><td></td></tr>

            <tr><td><label>Street</label></td>
            <td><input type="text" name="street"/></td></tr>

            <tr><td><label>City</label></td>
            <td><input type="text" name="city"/></td></tr>

            <tr><td><label>State</label></td>
                <td>
                <select name="state" id="state">
                    <option value="Iowa" selected>Iowa</option>
                    <option value="Georgia">Georgia</option>
                    <option value="Maryland">Maryland</option>
                </select></td></tr>

            <tr><td><label>Zip</label></td>
                <td> <input type="text" name="zip"/></td></tr>

            <tr><td><label class="phone">Phone</label></td>
                <td> <input type="text" name="phone"/></td></tr>
        </table>
        <div id="button">
            <button id="cancelBtn">Cancel</button>
        <button id="addLibraryMemberBtn">Submit</button>
        </div>
    </form>

</div>
<footer>
    <h6>
        © 2020 Maharishi International University. All Rights Reserved.
    </h6>
</footer>
</body>
</html>
