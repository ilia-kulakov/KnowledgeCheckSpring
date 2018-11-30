<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

    <!-- navbar -->
<nav class="navbar navbar-expand-sm fixed-top bg-dark navbar-dark">
    <a class="navbar-brand" href="<spring:url value="/" />"><spring:message code="app.menu.home"/></a>
    <sec:authorize access="isAuthenticated()">
        <a class="navbar-brand" href="<spring:url value="/account/myprofile" />"><spring:message code="app.menu.my_profile"/></a>

        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <a class="navbar-brand" href="<spring:url value="/account/users" />"><spring:message code="app.menu.users"/></a>
        </sec:authorize>

        <sec:authorize access="hasRole('ROLE_TUTOR')">
            <a class="navbar-brand" href="<spring:url value="/testboard/mytests" />"><spring:message code="app.menu.my_tests"/></a>
            <a class="navbar-brand" href="<spring:url value="/testboard/studentsresults" />"><spring:message code="app.menu.students_results"/></a>
            <a class="navbar-brand" href="<spring:url value="/testboard/teststatistics" />"><spring:message code="app.menu.test_statistics"/></a>
            <a class="navbar-brand" href="<spring:url value="/testboard/subjects" />"><spring:message code="app.menu.subjects"/></a>
        </sec:authorize>
    </sec:authorize>
    <!-- Toggler/collapsibe Button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse text-right" id="collapsibleNavbar">
        <sec:authorize access="isAuthenticated()">
            <span class="navbar-text"><spring:message code="app.menu.welcome"/> <sec:authentication property="principal.username" />!</span>
        </sec:authorize>
        <ul class="navbar-nav">
            <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link" data-value="logout"
                        href="<spring:url value="/account/logout" />">
                        <spring:message code="app.account.logout"/>
                    </a>
                </li>
            </sec:authorize>
            <sec:authorize access="!isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link" data-value="login"
                        href="<spring:url value="/account/login" />">
                        <spring:message code="app.account.login"/>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-value="register"
                        href="<spring:url value="/account/register" />">
                        <spring:message code="app.account.register"/>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-value="recovery"
                        href="<spring:url value="/account/recovery" />">
                        <spring:message code="app.account.recovery"/>
                    </a>
                </li>
            </sec:authorize>
        </ul>
    </div>
</nav>


