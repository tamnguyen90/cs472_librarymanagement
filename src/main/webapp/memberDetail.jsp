<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="checkoutTable">
    <h3>CHECKOUT RECORDS</h3>
    <h4>Library member: ${libMember.fullName}</h4>
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th>Title</th>
            <th>Checkout Date</th>
            <th>Due Date</th>
            <th>Returned</th>
        </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${!empty recordDetail}">
                    <c:forEach var="record" items="${recordsDetail}">
                        <tr>
                            <td>${record.book.title}</td>
                            <td>${record.checkoutDate}</td>
                            <td>${record.dueDate}</td>
                            <td>${record.book.checkout ? 'No' : 'Yes'}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr style="text-align: center">
                        <td colspan="4">No record found...</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
    <div style="text-align: center;">
        <button type="button" class="btn btn-outline-primary" id="checkout">Checkout</button>
        <button type="button" class="btn btn-outline-secondary" id="return" ${!empty recordDetail ? "" : "disabled"}>Return</button>
    </div>
</div>
