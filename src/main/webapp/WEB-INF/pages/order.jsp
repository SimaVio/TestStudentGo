<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>StudentGo</title>

    <jsp:include page="_styles.jsp"/>

</head>
<body>

<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-md-12">

            <div>
                <a href="${pageContext.request.contextPath}/orderList">
                    &crarr; Back
                </a>
            </div>

            <fmt:setLocale value="en_US" scope="session"/>

            <h2>Order #${orderInfo.orderNum}</h2>

            <div class="well">
                <h3>Informatii student</h3>
                <ul>
                    <li>Nume: ${orderInfo.customerInfo.name}</li>
                    <li>ID_Legitimatie: ${orderInfo.customerInfo.ID_Legitimatie}</li>
                    <li>CNP: ${orderInfo.customerInfo.CNP}</li>
                </ul>
                <h3>Descriere factura:</h3>
                <ul>
                    <li>Total:
                        <span class="total">
                            <fmt:formatNumber value="${orderInfo.amount}" currencySymbol="RON: " type="currency"/>
                        </span>
                    </li>
                </ul>
            </div>

            <br/>

            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>Codul Produsului</th>
                    <th>Numele Produsului</th>
                    <th>Pretul</th>
                    <th>Total</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${orderInfo.details}" var="orderDetailInfo">
                    <tr>
                        <td>${orderDetailInfo.productCode}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/productInfo?code=${orderDetailInfo.productCode}">
                                    ${orderDetailInfo.productName}
                            </a>
                        </td>
                        <td>
                            <fmt:formatNumber value="${orderDetailInfo.price}" currencySymbol="RON: " type="currency"/>
                        </td>
                        <td>
                            <b><fmt:formatNumber value="${orderDetailInfo.amount}" currencySymbol="RON: " type="currency"/></b>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <c:if test="${paginationResult.totalPages > 1}">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <c:forEach items="${paginationResult.navigationPages}" var="page">
                            <c:if test="${page != -1 }">

                                <c:if test="${paginationResult.currentPage == page}">
                                    <li class="active">
                                        <a href="orderList?page=${page}" class="nav-item">
                                                ${page} <span class="sr-only">(current)</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${paginationResult.currentPage != page}">
                                    <li><a href="orderList?page=${page}" class="nav-item">${page}</a></li>
                                </c:if>

                            </c:if>
                            <c:if test="${page == -1 }">
                                <span class="nav-item"> ... </span>
                            </c:if>
                        </c:forEach>
                    </ul>
                </nav>
            </c:if>
            <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Confirm Cerere</h4>
                        </div>
                        <div class="modal-body">
                            <p>Doriti sa aprobati aceasta cerere <b><i class="title"></i></b></p>
                            <p>Continuati?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <button type="button" class="btn btn-danger btn-ok">YES</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-right">
                <a class="btn btn-warning"
                   href="${pageContext.request.contextPath}/editOrder?orderId=${orderInfo.id}">
                   Editare comanda
                </a>

                <button class="btn btn-danger"
                        data-record-num="${orderInfo.orderNum}"
                        data-path="${pageContext.request.contextPath}"
                        data-path-add="/deleteOrder?orderId="
                        data-record-id="${orderInfo.id}" data-record-title="Cerere"
                        data-toggle="modal" data-target="#confirm-delete">
                 Aprobare cerere
                </button>
                <%--Delete order--%>
                <%--</button>--%>
            </div>
            <jsp:include page="_footer.jsp"/>
        </div>
    </div>
</div>
</body>
</html>