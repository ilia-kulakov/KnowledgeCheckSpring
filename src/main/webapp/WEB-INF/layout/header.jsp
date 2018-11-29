<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- navbar -->
<nav class="navbar navbar-expand-sm fixed-top bg-dark navbar-dark">
    <a class="navbar-brand" href="<c:url value="/" />">Home</a>
    <sec:authorize access="isAuthenticated()">
        <a class="navbar-brand" href="<c:url value="/account/myprofile" />">My Profile</a>

        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <a class="navbar-brand" href="<c:url value="/account/users" />">Users</a>
        </sec:authorize>

        <sec:authorize access="hasRole('ROLE_TUTOR')">
            <a class="navbar-brand" href="<c:url value="/testboard/mytests" />">My Tests</a>
            <a class="navbar-brand" href="<c:url value="/testboard/studentsresults" />">Students Results</a>
            <a class="navbar-brand" href="<c:url value="/testboard/teststatistics" />">Test Statistics</a>
            <a class="navbar-brand" href="<c:url value="/testboard/subjects" />">Subjects</a>
        </sec:authorize>
    </sec:authorize>
    <!-- Toggler/collapsibe Button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse text-right" id="collapsibleNavbar">
        <sec:authorize access="isAuthenticated()">
            <span class="navbar-text">Welcome <sec:authentication property="principal.username" />!</span>
        </sec:authorize>
        <ul class="navbar-nav">
            <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link" data-value="logout"
                        href="<c:url value="/account/logout" />">
                        Logout
                    </a>
                </li>
            </sec:authorize>
            <sec:authorize access="!isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link" data-value="login"
                        href="<c:url value="/account/login" />">
                        Login
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-value="register"
                        href="<c:url value="/account/register" />">
                        Register
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-value="recovery"
                        href="<c:url value="/account/recovery" />">
                        Password recovery
                    </a>
                </li>
            </sec:authorize>
        </ul>
    </div>
</nav>


