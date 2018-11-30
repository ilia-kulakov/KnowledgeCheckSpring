<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<p>Copyright &copy; Knowledge Check on Spring MVC</p>

<!-- Dropdown for selecting language -->
<div class="dropdown">
    <button class="btn btn-outline-dark dropdown-toggle" type="button" id="dropdownMenuButton"
    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><spring:message code="app.lang.change"/></button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
        <a class="dropdown-item" href="?lang=en"><spring:message code="app.lang.english"/></a>
        <a class="dropdown-item" href="?lang=ru"><spring:message code="app.lang.russian"/></a>
    </div>
</div>