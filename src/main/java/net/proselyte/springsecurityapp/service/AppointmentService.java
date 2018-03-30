package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.model.Appointment;

import java.util.List;

public interface AppointmentService {

    Appointment findAppointmentById(Long id);

    List<Appointment> appointmentsOfUserPlaned(Long id);

    List<Appointment> appointmentsOfUserEnded(Long id);

    List<Appointment> appointmentsOfDoctorPlaned(Long doctor_id);

    List<Appointment> appointmentsOfDoctorPlanedSorted(Long doctor_id);

    void createAppointment(Appointment appointment);

    Appointment updateAppointment(Appointment appointment);



}
