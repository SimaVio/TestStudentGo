<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista produse</title>

    <jsp:include page="_styles.jsp"/>

</head>
<body>

<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-md-12">

            <fmt:setLocale value="en_US" scope="session"/>

            <h2>Lista Produse</h2>

            <div class="text-center">
                <h4>Total:
                <span class="label label-success">
                    ${paginationResult.totalRecords}
                </span>
                </h4>
            </div>

            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Numarul de ordine</th>
                        <th>Data</th>
                        <th>Nume Student</th>
                        <th>ID_Legitimatie Student</th>
                        <th>CNP Student</th>
                        <th>Total</th>
                        <th>Detalii</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach items="${paginationResult.list}" var="orderInfo">
                        <tr>
                            <td>${orderInfo.orderNum}</td>
                            <td>
                                <fmt:formatDate value="${orderInfo.orderDate}" pattern="dd-MM-yyyy HH:mm"/>
                            </td>
                            <td>${orderInfo.customerInfo.name}</td>
                            <td>${orderInfo.customerInfo.ID_Legitimatie}</td>
                            <td>${orderInfo.customerInfo.CNP}</td>
                            <td style="color:red;">
                                <fmt:formatNumber value="${orderInfo.amount}"  currencySymbol="RON: " type="currency" />
                            </td>
                            <td>
                                <a class="btn btn-default btn-xs" href="${pageContext.request.contextPath}/order?orderId=${orderInfo.id}">
                                    Detalii
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <c:if test="${paginationResult.totalPages > 1}">
                    <nav aria-label="Page navigation" class="text-center">
                        <ul class="pagination">
                            <c:forEach items="${paginationResult.navigationPages}" var="page">
                                <c:if test="${page != -1 }">

                                    <c:if test="${paginationResult.currentPage == page}">
                                        <li class="active">
                                            <a href="${pageContext.request.contextPath}/orderList?page=${page}" class="nav-item">
                                                    ${page} <span class="sr-only">(current)</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${paginationResult.currentPage != page}">
                                        <li><a href="${pageContext.request.contextPath}/orderList?page=${page}" class="nav-item">${page}</a></li>
                                    </c:if>

                                </c:if>
                                <c:if test="${page == -1 }">
                                    <span class="nav-item"> ... </span>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </nav>
            </c:if>


            <jsp:include page="_footer.jsp"/>

        </div>
    </div>
</div>
</body>
</html>