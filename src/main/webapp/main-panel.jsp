<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--Checkout records table-->
<div class="card text-center">
    <div class="card-header">
        <h3>CHECKOUT RECORDS</h3>
    </div>
    <div class="card-body">
        <div class="searchBox col-sm-2">
            <input type="text" id="searchRecord" class="form-control" placeholder="Search Record..."/>
        </div>
        <table class="table table-striped" id="recordtb">
            <thead class="thead-light">
            <tr>
                <th>Title</th>
                <th>Checkout Date</th>
                <th>Due Date</th>
                <th>Member Id</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody id="recordTable">
            <c:choose>
                <c:when test="${!empty checkoutRecords}">
                    <c:forEach var="records" items="${checkoutRecords}">
                        <c:forEach var="record" items="${records}">
                            <tr>
                                <td>${record.book.title}</td>
                                <td>${record.checkoutDate}</td>
                                <td>${record.dueDate}</td>
                                <td>${record.owner.memberId}</td>
                                <td>
                                    <form action="ReturnServlet" method="post">
                                        <input type="hidden" name="returnMemberId" value="${record.owner.memberId}" />
                                        <input type="hidden" name="returnIsbn" value="${record.book.isbn}" />
                                        <button type="submit" class="btn btn-outline-primary" >Return</button>
                                    </form>
                                </td>
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
        <div class="pagination-container">
            <nav>
                <ul class="pagination__record" ></ul>
            </nav>
        </div>
        <div style="text-align: center;">
            <form action="CheckoutServlet" method="get">
                <button type="submit" class="btn btn-outline-primary" id="checkout">Checkout</button>
            </form>

        </div>
    </div>
</div>

<!--Expired books table-->
<div class="card text-center">
    <div class="card-header">
        <h3>EXPIRED CHECKOUT BOOKS</h3>
    </div>
    <div class="card-body">
        <div class="searchBox col-sm-2">
            <input type="text" id="searchExpired" class="form-control" placeholder="Search Record..."/>
        </div>
        <table class="table table-striped" id="expiredtb">
            <thead class="thead-light">
            <tr>
                <th>Title</th>
                <th>Checkout Date</th>
                <th>Due Date</th>
                <th>Member Id</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody id="expireTable">
            <c:choose>
                <c:when test="${!empty expiredCheckoutRecords}">
                        <c:forEach var="expired" items="${expiredCheckoutRecords}">
                            <tr>
                                <td>${expired.book.title}</td>
                                <td>${expired.checkoutDate}</td>
                                <td>${expired.dueDate}</td>
                                <td>${expired.owner.memberId}</td>
                                <td>
                                    <form action="ReturnServlet" method="post">
                                        <input type="hidden" name="returnMemberId" value="${expired.owner.memberId}" />
                                        <input type="hidden" name="returnIsbn" value="${expired.book.isbn}" />
                                        <button type="submit" class="btn btn-outline-primary" >Return</button>
                                    </form>
                                </td>
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
        <div class="pagination-container">
            <nav>
                <ul class="pagination__expired" ></ul>
            </nav>
        </div>
    </div>
</div>

<!--Book collection table-->
<div class="card text-center">
    <div class="card-header">
        <h3>BOOK COLLECTION</h3>
    </div>
    <div class="card-body">
        <div class="searchBox col-sm-2">
            <input type="text" class="form-control" id="searchBook" placeholder="Search Book..."/>
        </div>
        <table class="table table-striped" id="booktb">
            <thead class="thead-light">
            <tr>
                <th>ISBN</th>
                <th>Title</th>
                <th>Author</th>
                <th>Days</th>
                <th>Checkout</th>
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
                            <c:choose>
                                <c:when test="${book.checkout}">
                                    <td>Yes</td>
                                </c:when>
                                <c:otherwise>
                                    <td>
                                        <form action="CheckoutServlet" method="get">
                                            <input type="hidden" name="isbn" value="${book.isbn}" />
                                            <button type="submit" class="btn btn-outline-primary">Checkout</button>
                                        </form>
                                    </td>
                                </c:otherwise>
                            </c:choose>

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
        <div class="pagination-container">
            <nav>
                <ul class="pagination__book" ></ul>
            </nav>
        </div>
    </div>
    <div style="text-align: center; padding-bottom: 0.5em;">
        <button type="button" class="btn btn-outline-primary" id="addBook">Add Book</button>
    </div>
</div>


