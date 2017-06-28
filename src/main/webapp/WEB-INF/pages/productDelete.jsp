<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product</title>

    <jsp:include page="_styles.jsp"/>

</head>
<body>

<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-12">

            <div style="text-align: left;">
                <a href="${pageContext.request.contextPath}/productList">
                    &crarr; Back
                </a>
            </div>

            <h2>Confirmare stergere produs</h2>

            <form:form modelAttribute="productForm" method="POST" enctype="multipart/form-data">
                <table class="table" style="text-align:left;">
                    <tr>
                        <td class="col-md-2">Code *</td>
                        <td class="col-md-10">${productForm.code}</td>
                    </tr>

                    <tr>
                        <td class="col-md-2">Name *</td>
                        <td class="col-md-10"> ${productForm.name}</td>
                    </tr>
                    <tr>
                        <td class="col-md-2">Description *</td>
                        <td class="col-md-10"> ${productForm.description}</td>
                    </tr>

                    <tr>
                        <td class="col-md-2">Price *</td>
                        <td class="col-md-10"> ${productForm.price}</td>
                    </tr>
                    <tr>
                        <td class="col-md-2">Image</td>
                        <td class="col-md-10">
                            <img src="${pageContext.request.contextPath}/productImage?code=${productForm.code}"
                                 width="100"/>
                        </td>
                    </tr>


                    <tr>
                        <td class="col-md-2">&nbsp;</td>
                        <td class="col-md-10">
                            <input class="btn btn-danger" type="submit" value="Delete"/>
                        </td>
                    </tr>
                </table>
            </form:form>


            <jsp:include page="_footer.jsp"/>
        </div>
    </div>
</div>
</body>
</html>