<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>Informatii cont</title>

    <jsp:include page="_styles.jsp"/>

</head>
<body>


<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>


<div class="container">
    <div class="row">
        <div class="col-md-12">


            <h2>Informatii cont</h2>

            <div class="well">
                <ul>
                    <li><h4>Nume utilizator</h4>
                        <span style="padding-left: 5px;">
                            ${pageContext.request.userPrincipal.name}
                        </span>
                    </li>
                    <li><h4>Role:</h4>
                        <ul>
                            <c:forEach items="${userDetails.authorities}" var="auth">
                                <li>${auth.authority }</li>
                            </c:forEach>
                        </ul>
                    </li>
                </ul>
            </div>

            <jsp:include page="_footer.jsp"/>
        </div>
    </div>
</div>
</body>
</html>