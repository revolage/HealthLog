<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
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
<header>
    <div class="container">
        <img class="healthlog-logo" src="resources/img/HealthLog-logo.png" alt="">
        <div class="user-logout"><span>${pageContext.request.userPrincipal.name}</span> <div class="patientPhoto"><img src="${patient.photo}"></div> <img src="resources/img/logout.png" class="logout-btn" onclick="document.forms['logoutForm'].submit()"></div>
    </div>
</header>
<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" accept-charset="utf-8" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        </form>
        <h2 class="text-center">Моя медична карта</h2>
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="row">
                        <section class="main-patient-information">
                            <div class="col-md-4">
                                <div class="patient-photo">
                                    <img src="${patient.photo}">
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
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-12">
                            <section class="planed-visits">
                                <div class="planed-visits-title"><p><span class="glyphicon glyphicon-calendar"></span>МАЙБУТНІ ВІЗИТИ</p></div>
                                        <div class="visit-item">
                                            <c:forEach items="${appointmentListPlaned}" var="planedAppointment">
                                                <p>${planedAppointment.date} - ${planedAppointment.doctor.name} ${planedAppointment.doctor.surname}
                                                    <span class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="bottom" data-html="true" title="<p>Дата: ${planedAppointment.date}</p><p>Лікар: ${planedAppointment.doctor.name} ${planedAppointment.doctor.surname}</p><p>Симптоми: ${planedAppointment.symptoms}</p>"></span>
                                                    <span data-patient-id="${planedAppointment.id}" id="cancelAppointment-btn" data-toggle="modal" data-target="#cancelAppointment-modal" class="glyphicon glyphicon-remove-circle"></span>
                                                </p>
                                            </c:forEach>
                                        </div>
                            </section>
                            <div class="modal fade" id="reserveAppointemnt" tabindex="-1" role="dialog">
                                <div class="vertical-alignment-helper">
                                    <div class="modal-dialog vertical-align-center" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title text-center">Запис на прийом</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form method="POST" action="/appointment" class="form-signin">
                                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                                    <label class="disableStyles" for="date">Оберіть дату прийому</label>
                                                    <input type="date" name="date" id="date" class="form-control">
                                                </div>
                                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                                    <label class="disableStyles" for="doctorsList">Оберіть лікаря</label>
                                                    <select name="doctorId" id="doctorsList" class="form-control">
                                                        <c:forEach items="${doctorList}" var="doctor">
                                                            <option value="${doctor.id}">${doctor.name} ${doctor.surname}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                                    <label class="disableStyles" for="doctorsList">Опишіть симптоми</label>
                                                    <input type="text" name="symptoms" id="symptoms" class="form-control" placeholder="Симптоми"/>
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                </div>
                                                </>
                                                <button class="btn btn-lg btn-primary btn-block appointment " type="submit">Записатися</button>
                                            </form>
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                                </div>
                            </div><!-- /.modal -->
                            <div class="modal fade" id="cancelAppointment-modal" tabindex="-1" role="dialog">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <%--<h4 class="modal-title">Скасувати візит?</h4>--%>
                                        </div>
                                        <div class="modal-body">
                                            <form method="POST" action="/appointment/cancel" class="form-signin">
                                                <p>Ви впевнені що ви бажаєте скасувати візит?</p>
                                                <input type="hidden" name="appointmentId" value="">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                <button class="btn btn-lg btn-primary btn-block btn-success" type="submit">Скасувати</button>
                                            </form>

                                        </div>
                                        <div class="modal-footer">
                                            <%--<button type="button" class="btn btn-default" data-dismiss="modal">Ні</button>--%>
                                            <%--<button type="button" class="btn btn-success">Так</button>--%>
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div><!-- /.modal -->
                            <span class="planedAppointment-date">${appointment.date}</span>
                            <div class="patientPhoto"><img src="${appointment.patient.photo}"></div>
                            <span class="patientName">${appointment.patient.name} ${appointment.patient.surname}</span>
                            <button type="button" class="reserveAppointment btn btn-default" data-toggle="modal" data-target="#reserveAppointemnt">
                                Запис на прийом
                            </button>
                            <!--<span class="appointment btn btn-default">Прийом</span>-->
                        </div>
                            <!--<div class="reserveAppointment btn btn-default">Запис на прийом</div>-->

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <section class="patient-history">
                    <c:if test="${appointmentListEnded.size() > 0}">
                        <c:forEach items="${appointmentListEnded}" var="endedAppointment">
                            <div class="history-item">
                                <span class="endedAppointment-date">${endedAppointment.date}</span>
                                <div class="doctorPhoto"><img src="${endedAppointment.doctor.photo}"></div>
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
        <span></span>

    </c:if>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('span[data-toggle=tooltip]').tooltip();
    });
    $('#cancelAppointment-modal').on('show.bs.modal', function(e) {
        var appointment_Id = $(e.relatedTarget).data('patient-id');
        $(e.currentTarget).find('input[name="appointmentId"]').val(appointment_Id);
    });
</script>
</body>
</html>
