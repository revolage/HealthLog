package com.kachur.service;

import com.kachur.dao.AppointmentDao;
import com.kachur.model.Appointment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AppointmentServiceImpl implements AppointmentService {
    @Autowired
    private AppointmentDao appointmentDao;

    @Override
    public Appointment findAppointmentById(Long id) {
       return appointmentDao.findAppointmentById(id);
    }

    @Override
    public List<Appointment> appointmentsOfUserPlaned(Long id) {
        return appointmentDao.findAppointmentsByPatientIdAndIsVisited(id,false);
    }

    @Override
    public List<Appointment> appointmentsOfUserEnded(Long id) {
        return appointmentDao.findAppointmentsByPatientIdAndIsVisited(id, true);
    }

    @Override
    public List<Appointment> appointmentsOfDoctorPlaned(Long doctor_id) {
        return appointmentDao.findAppointmentsByDoctorIdAndIsVisited(doctor_id, false);
    }

    @Override
    public List<Appointment> appointmentsOfDoctorPlanedSorted(Long doctor_id) {
        return appointmentDao.findAppointmentsByDoctorIdAndIsVisitedOrderByDateAsc(doctor_id, false);
    }

    @Override
    public void createAppointment(Appointment appointment) {

        appointmentDao.save(appointment);
    }

    @Override
    public Appointment updateAppointment(Appointment appointment) {
       return appointmentDao.save(appointment);
    }


}
