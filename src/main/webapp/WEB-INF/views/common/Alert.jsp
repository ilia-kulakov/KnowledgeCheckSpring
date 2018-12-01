<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:if test="${alertManager != null}">
    <c:forEach var="alert" items="${alertManager.alerts}">
        <div class="alert alert-${alert.type} alert-dismissible fade show">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong ><spring:message code="app.alert.${alert.type}"/>:</strong>
            <spring:message code="${alert.message}"/>

        </div>
    </c:forEach>

    <c:remove var = "alertManager"/>
</c:if>

