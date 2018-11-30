<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="container form-login">
    <h1 class="h3 mb-3 font-weight-normal text-center"><spring:message code="app.account.please_login"/></h1>

    <c:if test="${param.error != null}">
        <div class="alert alert-danger alert-dismissible fade show">
            <spring:message code="app.account.login_error"/>
            <spring:message code="app.common.try_again"/>
        </div>
    </c:if>

    <%@ include file = "/WEB-INF/views/common/Alert.jsp" %>

    <form class="form-login" method="post" action="<spring:url value="/account/login/processing" />" name="loginForm">
        <div class="form-group">
            <label for="inputUsername" class="sr-only"><spring:message code="app.account.username"/></label>
            <input id="inputUsername" class="form-control" name="username"
                   placeholder="<spring:message code="app.account.your_username"/>" required="" autofocus="" type="username">
        </div>
        <div class="form-group">
            <label for="inputPassword" class="sr-only"><spring:message code="app.account.password"/></label>
            <input id="inputPassword" class="form-control" name="password"
                   placeholder="<spring:message code="app.account.your_password"/>" required="" type="password">
        </div>
        <button class="btn btn-dark btn-block" type="submit"><spring:message code="app.account.login"/></button>

        <p>
            <spring:message code="app.account.you_do_not_have_an_account" />
            <a href="<spring:url value="/account/register"/>" ><spring:message code="app.account.register"/></a>
        </p>
        <p>
            <spring:message code="app.account.you_do_not_remember_a_password"/>
            <a href="<spring:url value="/account/recovery"/>" ><spring:message code="app.account.recovery"/></a>
        </p>

        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}" />
    </form>
</div>
