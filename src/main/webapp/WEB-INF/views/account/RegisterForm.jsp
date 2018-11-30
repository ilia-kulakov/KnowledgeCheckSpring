<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="container form-register">
    <h1 class="h3 mb-3 font-weight-normal text-center"><s:message code="app.account.register"/></h1>

    <%@ include file = "/WEB-INF/views/common/Alert.jsp" %>

    <sf:form method="POST" modelAttribute="userDto" class="form-register text-left col-12">

        <div class="form-group">
            <s:message code="app.account.enter_your_first_name" var="placeholder"/>
            <sf:label path="firstName" cssErrorClass="form-label text-danger" class="form-label" for="inputFirstName">
                <s:message code="app.account.first_name"/>
            </sf:label>
            <sf:input path="firstName" cssErrorClass="form-control  is-invalid" id="inputFirstName" class="form-control "
                   placeholder="${placeholder}" type="text"/>
            <sf:errors path="firstName" element="small" cssClass="help-block text-danger" />
        </div>
        <div class="form-group">
            <s:message code="app.account.enter_your_last_name" var="placeholder"/>
            <sf:label path="lastName" cssErrorClass="form-label text-danger" class="form-label" for="inputLastName" >
                <s:message code="app.account.last_name"/>
            </sf:label>
            <sf:input path="lastName" cssErrorClass="form-control  is-invalid" id="inputLastName" class="form-control "
                   placeholder="${placeholder}" type="text"/>
            <sf:errors path="lastName" element="small" cssClass="text-danger" />
        </div>
        <div class="form-group">
            <s:message code="app.account.enter_your_username" var="placeholder"/>
            <sf:label path="username" cssErrorClass="form-label text-danger" class="form-label" for="inputUsername" >
                <s:message code="app.account.username"/>
            </sf:label>
            <sf:input path="username" cssErrorClass="form-control  is-invalid" id="inputUsername" class="form-control "
                      placeholder="${placeholder}" type="username"/>
            <sf:errors path="username" element="small" cssClass="text-danger" />
        </div>
        <div class="form-group">
            <s:message code="app.account.enter_your_real_email_address" var="placeholder"/>
            <sf:label path="email" cssErrorClass="form-label text-danger" class="form-label" for="inputEmail" >
                <s:message code="app.account.email"/>
            </sf:label>
            <sf:input path="email" cssErrorClass="form-control  is-invalid" id="inputEmail" class="form-control "
                   placeholder="${placeholder}" type="email"/>
            <sf:errors path="email" element="small" cssClass="text-danger" />
        </div>
        <div class="form-group">
            <s:message code="app.account.enter_your_password" var="placeholder"/>
            <sf:label path="password" cssErrorClass="form-label text-danger" class="form-label" for="inputPassword" >
                <s:message code="app.account.password"/>
            </sf:label>
            <sf:input path="password" cssErrorClass="form-control  is-invalid" id="inputPassword" class="form-control "
                   placeholder="${placeholder}" required="" type="password"/>
            <sf:errors path="password" element="small" cssClass="text-danger" />
        </div>
        <div class="form-group">
            <s:message code="app.account.repeat_your_password" var="placeholder"/>
            <sf:label path="confirmPassword" cssErrorClass="form-label text-danger" class="form-label" for="inputRepeatPassword">
                <s:message code="app.account.repeat_password"/>
            </sf:label>
            <sf:input path="confirmPassword" cssErrorClass="form-control  is-invalid" id="inputRepeatPassword" class="form-control "
                   placeholder="${placeholder}" required="" type="password"/>
            <sf:errors path="confirmPassword" element="small" cssClass="text-danger" />
        </div>
        <div class="form-group">
            <label class="form-label" for="selectRole" ><s:message code="app.account.role"/></label>
            <select id="selectRole" name="role" class="custom-select form-control ">
                <option disabled><s:message code="app.account.choose_a_role"/></option>
                <c:forEach var="role" items="${roles.list}">
                    <option <c:if test="${role == userDto.role}">selected</c:if>  value="${role}">
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
        // $("input").attr('required', '');
    </script>

</div>
