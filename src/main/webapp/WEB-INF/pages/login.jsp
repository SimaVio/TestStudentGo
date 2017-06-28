<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<security:authorize access="isAuthenticated()">
    <% response.sendRedirect(request.getContextPath()); %>
</security:authorize>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>Login</title>

    <jsp:include page="_styles.jsp"/>

</head>
<body>


<jsp:include page="_header.jsp"/>



<div class="container">
    <div class="row">
        <div class="col-md-12">

            <h2>Login</h2>

            <div class="well">

                <h4>Introduceti numele si parola</h4>
                <br>
                <!-- /login?error=true -->
                <c:if test="${param.error == 'true'}">
                    <div style="color: red; margin: 10px 0px;">
                        Login failed!<br> Reason: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}.
                    </div>
                </c:if>

                <form method="POST"
                      action="${pageContext.request.contextPath}/j_spring_security_check">
                    <table class="table">
                        <tr>
                            <td class="col-md-2">Numele</td>
                            <td class="col-md-10"><input name="userName"/></td>
                        </tr>

                        <tr>
                            <td class="col-md-2">Parola</td>
                            <td class="col-md-10"><input type="password" name="password"/></td>
                        </tr>

                        <tr>
                            <td class="col-md-2">&nbsp;</td>
                            <td class="col-md-10">
                                <input class="btn btn-default" type="reset" value="Reset"/>
                                <input class="btn btn-primary" type="submit" value="Login"/>
                            </td>
                        </tr>
                    </table>
                </form>

                <span class="error-message">${error }</span>

            </div>


            <jsp:include page="_footer.jsp"/>
        </div>
    </div>
</div>
</body>
</html>