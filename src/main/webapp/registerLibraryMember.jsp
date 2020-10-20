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
    <script>
        $(document).ready(function () {
            $('#addLibraryMemberBtn').click(addLibraryMember);
        });

        function addLibraryMember(event) {
            event.preventDefault();
            $.post('registerlibrarymember',{
                "firstName": $("input[name='firstName']").val(),
                "lastName": $("input[name='lastName']").val(),
                "street": $("input[name='street']").val(),
                "city": $("input[name='city']").val(),
                "state": $("#state option:selected").text(),
                "zip": $("input[name='zip']").val(),
                "phone": $("input[name='phone']").val(),
            }).done(returnData);
        }

        function returnData(responseJson) {
            var list = $('#list');
            list.find('tr').remove();
            $.each(responseJson, function (index, value) {
                console.log(value);
                var strAdd = value.address.street + ',' + value.address.city + ',' + value.address.state + ',' + value.address.zip;
                console.log(strAdd);

                $("#returndata").append("<tr><td>" + value.firstName + "</td><td>" + value.lastName + "</td><td>" + strAdd + "</td><td>" + value.phone + "</td></tr>");
            });
        }


    </script>
</head>
<body>
<h2>List of Library Member in system</h2>
<table class="table table-striped" id="returndata">
    <thead>
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Address</th>
        <th>Phone</th>
    </tr>
    </thead>
    <tbody id="list">
    <c:forEach var="libraryMember" items="${librarymemberlist}">
        <tr>
            <td>${libraryMember.firstName}</td>
            <td>${libraryMember.lastName}</td>
            <td>${libraryMember.address}</td>
            <td>${libraryMember.phone}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<h2>Add new library member below: </h2>
<form action="registerlibrarymember" method="post">
    <table>
        <tr>
            <td>First Name</td>
            <td><input type="text" name="firstName"/></td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td><input type="text" name="lastName"/></td>
        </tr>
    <tr>
        <td>Address</td>
        <td><input type="text" name="street"/></td>
    </tr>
    <tr>
        <td>City</td>
        <td><input type="text" name="city"/></td>
    </tr>
    <tr>
        <td>State</td>
        <td><select name="state" id = "state">
            <option value="Iowa" selected>Iowa</option>
            <option value="Georgia">Georgia</option>
            <option value="Maryland">Maryland</option>
        </select></td>
    </tr>
    <tr>
        <td>Zip</td>
        <td><input type="number" name="zip"/></td>
    </tr>
    <tr>
        <td>Phone</td>
        <td><input type="number" name="phone"/></td>
    </tr>
    </table>
        <button id="addLibraryMemberBtn">Submit</button>
</form>
</body>
</html>
