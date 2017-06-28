<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

            <div>
                <a href="${pageContext.request.contextPath}/productList">
                    &crarr; Back
                </a>
            </div>

            <h2>
            <c:if test="${not productForm.newProduct}">
               Editeaza produse
            </c:if>
            <c:if test="${productForm.newProduct}">
                Adauga produse
            </c:if>
            </h2>

            <c:if test="${not empty errorMessage }">
                <div class="error-message">
                        ${errorMessage}
                </div>
            </c:if>

            <form:form modelAttribute="productForm" method="POST" enctype="multipart/form-data">
                <table class="table">
                    <tr>
                        <td class="col-md-2">Codul: </td>
                        <td class="col-md-4">
                            <c:if test="${not productForm.newProduct}">
                                <form:hidden path="code"/>
                                <span style="color:red;">${productForm.code}</span>
                            </c:if>
                            <c:if test="${productForm.newProduct}">
                                <form:input path="code"/>
                                <form:hidden path="newProduct"/>
                            </c:if>
                        </td>
                        <td class="col-md-6"><form:errors path="code" class="error-message"/></td>
                    </tr>

                    <tr>
                        <td class="col-md-2">Nume: </td>
                        <td class="col-md-4"><form:input path="name"/></td>
                        <td class="col-md-6"><form:errors path="name" class="error-message"/></td>
                    </tr>

                    <tr>
                        <td class="col-md-2">Descriere: </td>
                        <td class="col-md-4"><form:textarea path="description"/></td>
                        <td class="col-md-6"><form:errors path="description" class="error-message"/></td>
                    </tr>

                    <tr>
                        <td class="col-md-2">Pret: </td>
                        <td class="col-md-4" ><form:input path="price" cssClass="float-only"/></td>
                        <td class="col-md-6"><form:errors path="price" class="error-message"/></td>
                    </tr>
                    <tr>
                        <td class="col-md-2">Imagine: </td>
                        <td class="col-md-4">
                            <c:if test="${not productForm.newProduct}">
                            <img src="${pageContext.request.contextPath}/productImage?code=${productForm.code}"
                                 width="100"/></td>
                        </c:if>
                        <c:if test="${productForm.newProduct}">
                            <img src="${pageContext.request.contextPath}/productImage?code=" width="100"/></td>
                        </c:if>
                        <td class="col-md-6"></td>
                    </tr>
                    <tr>
                        <td class="col-md-2">Incarcare Imagine</td>
                        <td class="col-md-4"><form:input type="file" path="fileData"/></td>
                        <td class="col-md-6"></td>
                    </tr>


                    <tr>
                        <td class="col-md-2">&nbsp;</td>
                        <td class="col-md-4">
                            <input class="btn btn-default" type="reset" value="Reset"/>
                            <input class="btn btn-primary" type="submit" value="Submit"/>
                        </td>
                        <td class="col-md-6">&nbsp;</td>
                    </tr>
                </table>
            </form:form>


            <jsp:include page="_footer.jsp"/>
        </div>
    </div>
</div>
</body>
</html>