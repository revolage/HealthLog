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
            <div class="row">
                <div class="col-md-8">
                    <section class="main-user-information">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="user-photo">
                                    <img src="${user.photo}">
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="text-block">
                                    <p class="user-fullname">${user.surname} ${user.name} ${user.fathername}</p>
                                    <p>Дата народження: <span>${user.birthday}</span></p>
                                    <p>Група крові: <span>${user.bloodType}</span> </p>
                                    <p>Алергічні реакії: <span>${user.allergies.length() > 0 ? user.allergies : "null"}</span></p>
                                    <p>
                                        Хронічні хвороби:
                                        <c:choose>
                                            <c:when test="${user.chronicDiseases.length() > 0}">
                                                <span>${user.chronicDiseases}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span>Немає</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                    <p>
                                        Особливі примітки:
                                        <c:choose>
                                            <c:when test="${user.specialNotes.length() > 0}">
                                                <span>${user.specialNotes}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span>Немає</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="col-md-4">
                    <section>
                        <div class="row">
                            <col-md-12>
                                <c:forEach items="${appointmentListPlaned}" var="planedAppointment">
                                    <p>Дата: ${planedAppointment.date}</p>
                                    <p>Симптоми: ${planedAppointment.symptoms}</p>
                                </c:forEach>
                            </col-md-12>
                        </div>
                    </section>
                </div>
            </div>
            <div class="row">
                <section class="patient-history">
                    <c:if test="${appointmentListEnded.size() > 0}">
                        <c:forEach items="${appointmentListEnded}" var="endedAppointment">
                            <p>Дата: ${endedAppointment.date}</p>
                            <p>Симптоми: ${endedAppointment.symptoms}</p>
                            <p>Діагноз: ${endedAppointment.diagnosis}</p>
                            <p>Лікування: ${endedAppointment.medication}</p>
                        </c:forEach>
                    </c:if>
                </section>
            </div>
        </div>

        <span></span>
        <!--<span>Your email: ${user.userEmail}</span>-->

    </c:if>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
