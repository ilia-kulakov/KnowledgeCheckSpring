<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="container form-register">
    <h1 class="h3 mb-3 font-weight-normal text-center"><s:message code="app.account.register"/></h1>

    <%@ include file = "/WEB-INF/views/common/Alert.jsp" %>

    <s:url var="post_url"  value="/account/register/processing" />
    <sf:form method="POST" modelAttribute="user" class="form-register text-left col-12"  action="${post_url}">

        <div class="form-row">
            <s:message code="app.account.enter_your_first_name" var="placeholder"/>
            <sf:label path="firstName" cssErrorClass="error" class="col-sm-5 col-form-label" for="inputFirstName">
                <s:message code="app.account.first_name"/>:
            </sf:label>
            <sf:input path="firstName" cssErrorClass="error" id="inputFirstName" class="form-control col-sm-7 mb-1"
                   placeholder="${placeholder}" type="text"/>
        </div>
        <div class="form-row">
            <s:message code="app.account.enter_your_last_name" var="placeholder"/>
            <sf:label path="lastName" cssErrorClass="error" class="col-sm-5 col-form-label" for="inputLastName" >
                <s:message code="app.account.last_name"/>:
            </sf:label>
            <sf:input path="lastName" cssErrorClass="error" id="inputLastName" class="form-control col-sm-7 mb-1"
                   placeholder="${placeholder}" type="text"/>
        </div>
        <div class="form-row">
            <s:message code="app.account.enter_your_username" var="placeholder"/>
            <sf:label path="username" cssErrorClass="error" class="col-sm-5 col-form-label" for="inputUsername" >
                <s:message code="app.account.username"/>:
            </sf:label>
            <sf:input path="username" cssErrorClass="error" id="inputUsername" class="form-control col-sm-7 mb-1"
                      placeholder="${placeholder}" type="username"/>
        </div>
        <div class="form-row">
            <s:message code="app.account.enter_your_real_email_address" var="placeholder"/>
            <sf:label path="email" cssErrorClass="error" class="col-sm-5 col-form-label" for="inputEmail" >
                <s:message code="app.account.email"/>:
            </sf:label>
            <sf:input path="email" cssErrorClass="error" id="inputEmail" class="form-control col-sm-7 mb-1"
                   placeholder="${placeholder}" type="email"/>
        </div>
        <div class="form-row">
            <s:message code="app.account.enter_your_password" var="placeholder"/>
            <sf:label path="password" cssErrorClass="error" class="col-sm-5 col-form-label" for="inputPassword" >
                <s:message code="app.account.password"/>:
            </sf:label>
            <sf:input path="password" cssErrorClass="error" id="inputPassword" class="form-control col-sm-7 mb-1"
                   placeholder="${placeholder}" required="" type="password"/>
        </div>
        <div class="form-row">
            <s:message code="app.account.repeat_your_password" var="placeholder"/>
            <sf:label path="repeatPassword" cssErrorClass="error" class="col-sm-5 col-form-label" for="inputRepeatPassword">
                <s:message code="app.account.repeat_password"/>:
            </sf:label>
            <sf:input path="repeatPassword" cssErrorClass="error" id="inputRepeatPassword" class="form-control col-sm-7 mb-1"
                   placeholder="${placeholder}" required="" type="password"/>
        </div>
        <div class="form-row">
            <label class="col-sm-5 col-form-label" for="selectRole" ><s:message code="app.account.role"/>:</label>
            <select id="selectRole" name="role" class="custom-select form-control col-sm-7 mb-1">
                <option disabled>Choose a role</option>
                <c:forEach var="role" items="${roles.list}">
                    <option <c:if test="${role == user.role}">selected</c:if>  value="${role}">
                        <s:message code="${roles.getDescription(role)}"></s:message>
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <button class="btn btn-dark btn-block m-1" type="submit" name="btnNext">
                    <s:message code="app.common.next"/>
                </button>
            </div>
            <div class="col-3"></div>
        </div>
        <div class="row">
            <div class="col text-center">
                <p class="mt-5">
                    <s:message code="app.account.do_you_have_an_account"/>
                    <a href="<s:url value="/account/login" />"><s:message code="app.account.login"/></a>
                </p>
            </div>
        </div>

        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}" />
    </sf:form>

    <script>
        $("input").attr('required', '');
    </script>

</div>
