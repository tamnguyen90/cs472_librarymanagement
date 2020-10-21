<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="checkoutTable">
    <h3>CHECKOUT RECORDS</h3>
    <div class="searchBox">
        <input type="text" id="searchRecord" class="bd-search d-flex align-items-center" placeholder="Search Record..."/>
    </div>
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th>Title</th>
            <th>Checkout Date</th>
            <th>Due Date</th>
            <th>Member Id</th>
            <th>Returned</th>
        </tr>
        </thead>
        <tbody id="recordTable">
        <c:set var="listOfRecords" value="${checkoutRecordMap.value}" />
        <c:choose>
            <c:when test="${!empty listOfRecords}">
                <c:forEach var="records" items="${listOfRecords}">
                    <c:forEach var="record" items="${records}">
                        <tr>
                            <td>${record.book.title}</td>
                            <td>${record.checkoutDate}</td>
                            <td>${record.dueDate}</td>
                            <td>${record.owner.memberId}</td>
                            <td>${record.book.checkout ? 'No' : 'Yes'}</td>
                        </tr>
                    </c:forEach>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr style="text-align: center">
                    <td colspan="5">No record found...</td>
                </tr>
            </c:otherwise>
        </c:choose>

        </tbody>
    </table>
</div>
<div id="bookDetailTable">
    <h3>BOOK COLLECTION</h3>
    <div class="searchBox">
        <input type="text" class="bd-search d-flex align-items-center" id="searchBook" placeholder="Search Book..."/>
    </div>
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th>ISBN</th>
            <th>Title</th>
            <th>Author</th>
            <th>Days</th>
            <th>Checkout?</th>
        </tr>
        </thead>
        <tbody id="bookTable">
        <c:choose>
            <c:when test="${!empty libBooks}">
                <c:forEach var="book" items="${libBooks}">
                    <tr>
                        <td>${book.isbn}</td>
                        <td>${book.title}</td>
                        <td>${book.authorStr}</td>
                        <td>${book.maxCheckout}</td>
                        <td>${book.checkout ? 'Yes' : 'Not yet'}</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr style="text-align: center">
                    <td colspan="5">No record found...</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>
<div style="text-align: center;">
    <button type="button" class="btn btn-outline-primary" id="addBook">Add Book</button>
</div>

