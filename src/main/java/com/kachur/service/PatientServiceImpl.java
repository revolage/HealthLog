package com.kachur.service;

import com.kachur.dao.PatientDao;
import com.kachur.model.Patient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

/**
 * Implemenation of {@link PatientService} interface
 */
@Service
public class PatientServiceImpl implements PatientService {
    @Autowired
    private PatientDao patientDao;

    @Autowired
    private PasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(Patient patient) {
        patient.setPassword(bCryptPasswordEncoder.encode(patient.getPassword()));
        patientDao.save(patient);
    }

    @Override
    public Patient findById(Long id) {
        return patientDao.findById(id);
    }

    @Override
    public Patient findByUsername(String username) {
        return patientDao.findByUsername(username);
    }

    @Override
    public Patient findByEmail(String email) {
        return patientDao.findByEmail(email);
    }
}
