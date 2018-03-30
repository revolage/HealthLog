package net.proselyte.springsecurityapp.dao;

import net.proselyte.springsecurityapp.model.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AppointmentDao extends CrudRepository<Appointment, Long> {
    List<Appointment> findAll();
    Appointment findAppointmentById(Long id);
    List<Appointment> findAppointmentsByPatientIdAndIsVisited(Long id, Boolean visited);
    List<Appointment> findAppointmentsByDoctorIdAndIsVisited (Long doctor_id, Boolean isVisited);
    List<Appointment> findAppointmentsByDoctorIdAndIsVisitedOrderByDateAsc (Long doctor_id, Boolean isVisited);
    //List<Appointment> findAppointmentsByDoctorIdAndIsVisitedAndDate (Long doctor_id, Boolean isVisited);

}
