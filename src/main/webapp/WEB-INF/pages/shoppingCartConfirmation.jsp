<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>Confirmare cumparaturi</title>

    <jsp:include page="_styles.jsp"/>

</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>


<div class="container">
    <div class="row">
        <div class="col-md-12">


            <fmt:setLocale value="en_US" scope="session"/>

            <h2>Confirmare</h2>

            <div class="well">
                <h3>Informatii student:</h3>
                <ul>
                    <li>Nume: ${myCart.customerInfo.name}</li>
                    <li>ID_Legitimatie: ${myCart.customerInfo.ID_Legitimatie}</li>
                    <li>CNP: ${myCart.customerInfo.CNP}</li>
                </ul>
                <h3>Sumar</h3>
                <ul>
                    <li>
                        Total:
                        <span class="total">
                            <fmt:formatNumber value="${myCart.amountTotal}" currencySymbol="RON: " type="currency"/>
                        </span>
                    </li>
                </ul>
            </div>
            <div class="text-center">

                <form method="POST" action="${pageContext.request.contextPath}/shoppingCartConfirmation">

                    <a class="btn btn-default"
                       href="${pageContext.request.contextPath}/shoppingCart">Edit Cart</a>

                    <a class="btn btn-default"
                       href="${pageContext.request.contextPath}/shoppingCartCustomer">Edit
                        Customer Info</a>

                    <input type="submit" value="Send" class="btn btn-primary"/>
                </form>

                <br>
                <br>
                <div class="container">

                    <c:forEach items="${myCart.cartLines}" var="cartLineInfo">
                        <div class="product-preview-container">
                            <ul>
                                <li class="crop">
                                    <img class="product-image"
                                         src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}"/>
                                </li>
                                <li>
                                    Code: ${cartLineInfo.productInfo.code}
                                    <input type="hidden" name="code" value="${cartLineInfo.productInfo.code}"/>
                                </li>
                                <li>Name:
                                    <a href="${pageContext.request.contextPath}/productInfo?code=${cartLineInfo.productInfo.code}">
                                            ${cartLineInfo.productInfo.name}
                                    </a>
                                </li>
                                <li>
                                    Price:
                                    <span class="price">
                                    <fmt:formatNumber value="${cartLineInfo.productInfo.price}" currencySymbol="RON: " type="currency"/>
                                </span>
                                </li>
                                <li>
                                    Subtotal:
                                    <span class="total">
                                    <fmt:formatNumber value="${cartLineInfo.amount}" currencySymbol="RON: " type="currency"/>
                                </span>
                                </li>
                            </ul>
                        </div>
                    </c:forEach>

                </div>
            </div>
            <jsp:include page="_footer.jsp"/>
        </div>
    </div>
</div>
</body>
</html>