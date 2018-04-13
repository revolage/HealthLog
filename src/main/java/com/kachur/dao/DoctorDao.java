package com.kachur.dao;

import com.kachur.model.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DoctorDao extends JpaRepository<Doctor, Long> {
    List<Doctor> findAll();
    Doctor findById(Long id);
    Doctor findByName(String name);
    Doctor findByEmail(String email);
}
