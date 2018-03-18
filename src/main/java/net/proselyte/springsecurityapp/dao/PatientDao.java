package net.proselyte.springsecurityapp.dao;

import net.proselyte.springsecurityapp.model.Patient;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PatientDao extends JpaRepository<Patient,Long>{
    Patient findByUsername(String username);
}
