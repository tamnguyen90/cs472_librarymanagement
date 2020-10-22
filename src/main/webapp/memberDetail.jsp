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
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${!empty recordsDetail}">
                    <c:forEach var="record" items="${recordsDetail}">
                        <tr>
                            <td>${record.book.title}</td>
                            <td>${record.checkoutDate}</td>
                            <td>${record.dueDate}</td>
                            <td>
                                <form action="ReturnServlet" method="post">
                                    <input type="hidden" name="returnMemberId" value="${record.owner.memberId}" />
                                    <input type="hidden" name="returnIsbn" value="${record.book.isbn}" />
                                    <button type="submit" class="btn btn-outline-primary" >Return</button>
                                </form>
                            </td>
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
        <form action="main" method="get">
            <button type="submit" class="btn btn-outline-secondary" id="back">Back To Main</button>
        </form>
    </div>
</div>
