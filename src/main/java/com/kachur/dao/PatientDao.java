package com.kachur.dao;

import com.kachur.model.Patient;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PatientDao extends JpaRepository<Patient,Long>{
    Patient findByUsername(String username);
    Patient findById(Long id);
    Patient findByEmail(String email);
}
