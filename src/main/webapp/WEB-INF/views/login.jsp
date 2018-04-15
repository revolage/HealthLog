<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Авторизація</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<body>
<header>
    <div class="container">
        <img class="healthlog-logo on-login-page" src="resources/img/HealthLog-logo.png" alt="">
    </div>
</header>
<div class="container">
    <form>

    </form>
    <form method="POST" action="${contextPath}/login" class="form-signin">
        <h2 class="form-heading text-center">АВТОРИЗАЦІЯ</h2>
        <div class="radio-group">
            <input type="radio" id="patient" name="userType" value="PATIENT" checked><label for="patient"><img class="active-img" src="resources/img/patient-active.png"><img class="not-active-img" src="resources/img/patient.png"> Пацієнт</label>
            <input type="radio" id="doctor" name="userType" value="DOCTOR"><label for="doctor"><img class="active-img" src="resources/img/doctor-active.png"><img class="not-active-img" src="resources/img/doctor.png"> Лікар</label>
        </div>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <label class="disableStyles" for="email">Електронна пошта</label>
            <input name="email" id="email" type="text" class="form-control" placeholder="Email" autofocus="true"/>
            <span>${message}</span>
        </div>
        <div class="form-group ${error != null ? 'has-error' : ''}">
            <label class="disableStyles" for="password">Пароль</label>
            <input name="password" id="password" type="password" class="form-control" placeholder="Password"/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button class="btn btn-lg btn-primary btn-block appointment" style="margin-top: 30px;" type="submit">Авторизація</button>
            <h4 class="text-center"><a href="${contextPath}/registration">Створити новий акаунт</a></h4>
        </div>

    </form>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>