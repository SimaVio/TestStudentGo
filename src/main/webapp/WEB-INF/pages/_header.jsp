<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="header-container">
    <h2 align="center"></h2>
    <div class="site-name"><a href="${pageContext.request.contextPath}/">StudentGo</a></div>

    <div class="header-bar">
        <c:if test="${pageContext.request.userPrincipal.name != null}">

            <a href="${pageContext.request.contextPath}/accountInfo">
                <b>${pageContext.request.userPrincipal.name}</b>
            </a>
            &nbsp;|&nbsp;
            <a href="${pageContext.request.contextPath}/logout">Logout</a>

        </c:if>
        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <a href="${pageContext.request.contextPath}/login">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                Login
            </a>
        </c:if>
    </div>
</div>