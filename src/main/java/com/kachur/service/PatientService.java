package com.kachur.service;

import com.kachur.model.Patient;

/**
 * Service class for {@link Patient}
 */
public interface PatientService {
    void save(Patient patient);

    Patient findById(Long id);
    Patient findByUsername(String username);
    Patient findByEmail(String email);

}
