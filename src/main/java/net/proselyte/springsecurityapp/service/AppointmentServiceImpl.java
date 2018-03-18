package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.dao.AppointmentDao;
import net.proselyte.springsecurityapp.model.Appointment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AppointmentServiceImpl implements AppointmentService {
    @Autowired
    private AppointmentDao appointmentDao;
    @Override
    public void testAppointment() {
        appointmentDao.findAll();
    }

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

}
