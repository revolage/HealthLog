package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.model.Doctor;

import java.util.List;

public interface DoctorService {
    Doctor findDoctorById(Long id);

    List<Doctor> findAllDoctors();

    Doctor findDoctorByName(String name);
    Doctor findDoctorByEmail(String email);
}
