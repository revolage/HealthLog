<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Welcome</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" >
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet" >
</head>
<body>
<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        </form>
        <h2><span>${pageContext.request.userPrincipal.name}</span> | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
        <div class="container">
            <h1>Розклад пацієнтів</h1>
            <div class="row">
                <section class="patient-list">
                    <c:if test="${patientsList.size() > 0}">
                        <c:forEach items="patientsList" var="patient">
                            <div class="patient">
                                <span class="planedAppointment-date">planedAppointment.Date</span>
                                <div class="patientPhoto"><img src="patient.photo}"></div>
                                <span class="patientName">patient.name patient.surname patient.fathername</span>
                                <p class="symptoms">Симптоми: patient.symptoms</p>
                                <span class="appointment btn-default">Прийом</span>
                            </div>
                        </c:forEach>
                    </c:if>
                </section>
            </div>
        </div>

        <span></span>
        <!--<span>Your email: ${patient.userEmail}</span>-->

    </c:if>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('span[data-toggle=tooltip]').tooltip();
    });
</script>
</body>
</html>
