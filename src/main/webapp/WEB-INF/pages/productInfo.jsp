<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>Informatii produs</title>

    <jsp:include page="_styles.jsp"/>

</head>
<body>


<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>


<div class="container">
    <div class="row">
        <div class="col-md-12" style="display: flex; align-items: center; justify-content: space-between">
            <h2>Product info</h2>
            <div class="btn-group<security:authorize access="hasRole('ROLE_ADMINISTRATOR')">-xs</security:authorize>"
                 role="group">

                <a class="btn btn-primary"
                   href="${pageContext.request.contextPath}/buyProduct?code=${productInfo.code}">
                    Buy Now
                </a>
                <!-- For Manager edit Product -->
                <security:authorize access="hasRole('ROLE_ADMINISTRATOR')">
                    <a class="btn btn-warning"
                       href="${pageContext.request.contextPath}/product?code=${productInfo.code}">
                        Edit
                    </a>
                    <a class="btn btn-danger"
                       href="${pageContext.request.contextPath}/deleteProduct?code=${productInfo.code}">
                        Delete
                    </a>
                </security:authorize>
            </div>
        </div>
    </div>
    <div class="row">

        <div class="col-md-6">
            <a href="${pageContext.request.contextPath}/productImage?code=${productInfo.code}">
                <img src="${pageContext.request.contextPath}/productImage?code=${productInfo.code}"
                     style="max-width: 100%"/>
            </a>
        </div>
        <div class="col-md-6">

            <table class="table">
                <thead>
                <tr>
                    <th>Type</th>
                    <th>Info</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Code</td>
                    <td>${productInfo.code}</td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>${productInfo.name}</td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>
                        <span class="price">
                            <fmt:formatNumber value="${productInfo.price}" currencySymbol="RON: " type="currency"/>
                        </span>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="col-md-12">
            <br>
            <h3>Description</h3>
            <div class="well">
                ${productInfo.description}
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <jsp:include page="_footer.jsp"/>
        </div>
    </div>
</div>
</body>
</html>