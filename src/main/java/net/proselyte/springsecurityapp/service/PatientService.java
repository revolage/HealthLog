package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.model.Patient;

/**
 * Service class for {@link Patient}
 */
public interface PatientService {
    void save(Patient patient);

    Patient findByUsername(String username);
}