<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>Produse</title>

    <jsp:include page="_styles.jsp"/>

</head>
<body>

<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <fmt:setLocale value="en_US" scope="session"/>

            <h2>
                Cart
                <c:if test="${cartSize > 0}">
                    <span class="label label-success">${cartSize}</span>
                </c:if>
            </h2>

            <c:if test="${empty cartForm or empty cartForm.cartLines}">
                <div class="well">

                    <h3>Nu exista produse in cosul de cumparaturi</h3>
                    <br>
                    <br>
                    <a href="${pageContext.request.contextPath}/productList">Arata lista de produse</a>
                </div>
            </c:if>

            <c:if test="${not empty cartForm and not empty cartForm.cartLines   }">
                <form:form method="POST" modelAttribute="cartForm"
                           action="${pageContext.request.contextPath}/shoppingCart">

                    <c:forEach items="${cartForm.cartLines}" var="cartLineInfo"
                               varStatus="varStatus">
                        <div class="product-preview-container">
                            <ul>
                                <li class="crop">
                                    <a href="${pageContext.request.contextPath}/productInfo?code=${cartLineInfo.productInfo.code}">
                                        <img class="product-image"
                                             src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}"/>
                                    </a>
                                </li>
                                <li>Cod: ${cartLineInfo.productInfo.code} <form:hidden
                                        path="cartLines[${varStatus.index}].productInfo.code"/>

                                </li>
                                <li>Nume:
                                    <a href="${pageContext.request.contextPath}/productInfo?code=${cartLineInfo.productInfo.code}">
                                            ${cartLineInfo.productInfo.name}
                                    </a>
                                </li>
                                <li>
                                    Pret:
                                    <span class="price" id="price-${cartLineInfo.productInfo.code}">
                                            <fmt:formatNumber value="${cartLineInfo.productInfo.price}"
                                                              currencySymbol="RON: " type="currency"/>
                                    </span>
                                </li>
                                <li>
                                    Total:
                                    <span class="total" id="total-${cartLineInfo.productInfo.code}">
                                        <fmt:formatNumber value="${cartLineInfo.amount}" currencySymbol="RON: " type="currency"/>
                                    </span>
                                </li>
                                <li style="text-align: right">
                                    <a id="update-cart-product-${cartLineInfo.productInfo.code}"
                                       class="btn btn-xs btn-primary" style="display: none"
                                       onclick="update('${cartLineInfo.productInfo.code}', ${varStatus.index});">
                                        Update
                                    </a>
                                    <script>
                                        $("#cartLines${varStatus.index}").focusin(function () {
                                            $('#update-cart-product-${cartLineInfo.productInfo.code}').show();
                                        });
                                    </script>

                                    <a class="btn btn-xs btn-danger"
                                       href="${pageContext.request.contextPath}/shoppingCartRemoveProduct?code=${cartLineInfo.productInfo.code}">
                                       Sterge
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </c:forEach>
                    <div style="clear: both"></div>

                    <div class="well-sm text-center">

                        <a class="btn btn-default"
                           href="${pageContext.request.contextPath}/productList">Contina Cumparaturile</a>
                        <a class="btn btn-primary"
                           href="${pageContext.request.contextPath}/shoppingCartCustomer">Introdu informatii pentru factura</a>
                    </div>
                </form:form>


            </c:if>

            <script>
                function update(code, varStatusIndex) {
                    var url = '${pageContext.request.contextPath}/shoppingCartUpdateProduct?code=' + code + '&qty=';
                    var newQty = Number($("#cartLines" + varStatusIndex).val());
                    var price = $('#price-' + code).html();
                    var newTotal = newQty * Number(price.replace(/[^0-9\.]+/g, ""));
                    console.log(url + newQty);
                    $.get(url + newQty).then(function () {
                        $("#total-" + code).html('$' + (newTotal).formatMoney(2));
                        $('#update-cart-product-' + code).hide();
                    });
                }
                Number.prototype.formatMoney = function (c, d, t) {
                    var n = this,
                        c = isNaN(c = Math.abs(c)) ? 2 : c,
                        d = d == undefined ? "." : d,
                        t = t == undefined ? "," : t,
                        s = n < 0 ? "-" : "",
                        i = String(parseInt(n = Math.abs(Number(n) || 0).toFixed(c))),
                        j = (j = i.length) > 3 ? j % 3 : 0;
                    return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
                };
            </script>

            <jsp:include page="_footer.jsp"/>
        </div>
    </div>
</div>

</body>
</html>