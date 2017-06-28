<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>Introducere informatii studenti</title>

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

            <h2>Introducere informatii studenti </h2>

            <form:form method="POST" modelAttribute="customerForm"
                       action="${pageContext.request.contextPath}/shoppingCartCustomer">

                <table class="table">
                    <tr>
                        <td class="col-md-2">Numele si prenumele: </td>
                        <td class="col-md-4"><form:input path="name"/></td>
                        <td class="col-md-6"><form:errors path="name" class="error-message"/></td>
                    </tr>

                    <tr>
                        <td class="col-md-2">ID_Legitimatie: </td>
                        <td class="col-md-4"><form:input path="ID_Legitimatie"/></td>
                        <td class="col-md-6"><form:errors path="ID_Legitimatie" class="error-message"/></td>
                    </tr>

                    <tr>
                        <td class="col-md-2">CNP: </td>
                        <td class="col-md-4"><form:input path="CNP"/></td>
                        <td class="col-md-6"><form:errors path="CNP" class="error-message"/></td>
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