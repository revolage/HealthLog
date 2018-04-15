<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
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
<header>
    <div class="container">
        <img class="healthlog-logo" src="resources/img/HealthLog-logo.png" alt="">
        <div class="user-logout"><span>${pageContext.request.userPrincipal.name}</span> <div class="patientPhoto"><img src="${doctor.photo}"></div> <img src="resources/img/logout.png" class="logout-btn" onclick="document.forms['logoutForm'].submit()"></div>

    </div>
</header>
<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        </form>
        <div class="container">
            <h2 class="text-center">Мій кабінет</h2>
            <section class="main-patient-information main-doctor-information">
                <div class="col-md-4">
                    <div class="patient-photo">
                        <img src="${doctor.photo}">
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="text-block">
                        <p class="patient-fullname">${doctor.name} ${doctor.surname}</p>
                        <p>Відділ ${doctor.department.name}</p>
                    </div>
                </div>
            </section>
            <h1 class="text-center">Розклад пацієнтів</h1>
            <div class="row">
                <section class="patient-list">
                    <c:if test="${appointmentListPlaned.size() > 0}">
                        <c:forEach items="${appointmentListPlaned}" var="appointment">
                            <div class="patient">
                                <span class="planedAppointment-date">${appointment.date}</span>
                                <div class="patientPhoto"><img src="${appointment.patient.photo}"></div>
                                <span class="patientName">${appointment.patient.name} ${appointment.patient.surname}</span><a href="/patienthistory/${appointment.patient.id}" class="more-info-link" target="_blank" title="Історія пацієнта"><span class="glyphicon glyphicon-list-alt full-patient-info"></span></a>

                                <p class="symptoms">Симптоми: ${appointment.symptoms}</p>
                                <button type="button" class="btn appointment small" data-toggle="modal" data-target="#appointment_id${appointment.id}">
                                    Прийом
                                </button>
                                <span data-patient-id="${appointment.id}" class="glyphicon glyphicon-trash doctor-cancel-btn" id="cancelAppointment-btn" title="Скасувати візит" data-toggle="modal" data-target="#cancelAppointment-modal" class="glyphicon glyphicon-trash"></span>
                                <div class="modal fade" id="cancelAppointment-modal" tabindex="-1" role="dialog">
                                    <div class="vertical-alignment-helper">
                                        <div class="modal-dialog vertical-align-center" role="document">
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
                                    </div>
                                </div><!-- /.modal -->
                                <div class="modal fade" id="appointment_id${appointment.id}" tabindex="-1" role="dialog">
                                    <div class="vertical-alignment-helper">
                                        <div class="modal-dialog vertical-align-center" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title text-center">Прийом пацієнта</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="patientPhoto  atModal"><img src="${appointment.patient.photo}"></div>
                                                <p class="patientName text-center">${appointment.patient.name} ${appointment.patient.surname}</p>
                                                <p class="symptoms text-center">Симптоми: ${appointment.symptoms}</p>
                                                <h2 class="form-signin-heading text-center">Призначити лікування</h2>
                                                <!-- form -->
                                                <form method="POST" action="/appointment/${appointment.id}" class="form-signin">
                                                    <div class="form-group">
                                                        <label class="disableStyles" for="diagnosis">Діагноз</label>
                                                        <textarea name="diagnosis" id="diagnosis" placeholder="Діагноз" class="form-control noresize" rows="2" autofocus="true"></textarea>
                                                        <%--<input name="diagnosis" placeholder="Діагноз" type="text" class="form-control"  autofocus="true"/>--%>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="disableStyles" for="medication">Лікування</label>
                                                        <textarea name="medication" id="medication" placeholder="Лікування" class="form-control noresize" rows="2"></textarea>
                                                        <%--<input name="medication" placeholder="Лікування" type="text"  class="form-control"/>--%>
                                                    </div>
                                                    <div class="form-group">
                                                            <%--<input name="notes" placeholder="Нотатки" type="text"  class="form-control" />--%>
                                                            <label class="disableStyles" for="notes">Нотатки</label>
                                                            <textarea name="notes" id="notes" placeholder="Нотатки" class="form-control noresize" rows="2"></textarea>
                                                        </div>
                                                        <input name="${_csrf.parameterName}" value="${_csrf.token}" type="hidden"/>
                                                        <button type="submit" class="btn btn-lg btn-primary btn-block appointment ">Зберегти</button>
                                                    </form>
                                                        <%--</form:form>--%>
                                            </div>
                                            <div class="modal-footer">
                                                    <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
                                                    <%--<button type="submit" class="btn btn-primary">Save changes</button>--%>
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                    </div>
                                </div><!-- /.modal -->
                            </div><!-- /.patient -->
                        </c:forEach>
                    </c:if>
                </section>
            </div>
        </div>
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
