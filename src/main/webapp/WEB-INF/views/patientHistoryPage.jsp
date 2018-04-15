<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Медична карта пацієнта</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" >
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet" >
</head>
<body>
    <h1 class="text-center">Медична карта пацієнта</h1>
    <section class="patientMainInfo">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="row">
                        <section class="main-patient-information">
                            <div class="col-md-4">
                                <div class="patient-photo">
                                    <img src="../${patient.photo}">
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="text-block">
                                    <p class="patient-fullname">${patient.surname} ${patient.name} ${patient.fathername}</p>
                                    <c:if test="${patient.birthday != null}">
                                        <p>Дата народження: <span>${patient.birthday}</span></p>
                                    </c:if>
                                    <p>Група крові: <span>${patient.bloodType}</span> </p>
                                    <p>Алергічні реакії: <span>${patient.allergies.length() > 0 ? patient.allergies : "Немає"}</span></p>
                                    <p>
                                        Хронічні хвороби:
                                        <c:choose>
                                            <c:when test="${patient.chronicDiseases.length() > 0}">
                                                <span>${patient.chronicDiseases}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span>Немає</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                    <p>
                                        Особливі примітки:
                                        <c:choose>
                                            <c:when test="${patient.specialNotes.length() > 0}">
                                                <span>${patient.specialNotes}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span>Немає</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="patientFullHistory">
        <div class="container">
            <div class="row">
                <section class="patient-history">
                    <c:if test="${endedAppointments.size() > 0}">
                        <c:forEach items="${endedAppointments}" var="endedAppointment">
                            <div class="history-item">
                                <span class="endedAppointment-date">${endedAppointment.date}</span>
                                <div class="doctorPhoto"><img src="../${endedAppointment.doctor.photo}"></div>
                                <span class="doctorName">${endedAppointment.doctor.name} ${endedAppointment.doctor.surname} </span>
                                <span class="departmentName">- [Відділ ${endedAppointment.doctor.department.name}]</span>
                                <p class="symptoms">Симптоми: ${endedAppointment.symptoms}</p>
                                <p>Діагноз: ${endedAppointment.diagnosis}</p>
                                <p>Лікування: ${endedAppointment.medication}</p>
                            </div>
                        </c:forEach>
                    </c:if>
                </section>
            </div>
        </div>
        </div>
    </section>
</body>
</html>
