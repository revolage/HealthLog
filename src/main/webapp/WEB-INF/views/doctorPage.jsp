<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                    <c:if test="${appointmentListPlaned.size() > 0}">
                        <c:forEach items="${appointmentListPlaned}" var="appointment">
                            <div class="patient">
                                <div class="modal fade" id="appointment_id${appointment.id}" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title">${appointment.patient.name} ${appointment.patient.surname}</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="patientPhoto"><img src="${appointment.patient.photo}"></div>
                                                <p class="symptoms">Симптоми: ${appointment.symptoms}</p>
                                                <h2 class="form-signin-heading">Призначити лікування</h2>
                                                <!-- form -->
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <button type="button" class="btn btn-primary">Save changes</button>
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div><!-- /.modal -->
                                <span class="planedAppointment-date">${appointment.date}</span>
                                <div class="patientPhoto"><img src="${appointment.patient.photo}"></div>
                                <span class="patientName">${appointment.patient.name} ${appointment.patient.surname}</span>
                                <p class="symptoms">Симптоми: ${appointment.symptoms}</p>
                                <button type="button" class="appointment btn btn-primary btn-lg" data-toggle="modal" data-target="#appointment_id${appointment.id}">
                                    Прийом
                                </button>
                                <!--<span class="appointment btn btn-default">Прийом</span>-->
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

    $('#link').click(function () {
        var src = 'http://www.youtube.com/v/FSi2fJALDyQ&amp;autoplay=1';
        $('#myModal').modal('show');
        $('#myModal iframe').attr('src', src);
    });

    $('#myModal button').click(function () {
        $('#myModal iframe').removeAttr('src');
    });
</script>

</body>
</html>
