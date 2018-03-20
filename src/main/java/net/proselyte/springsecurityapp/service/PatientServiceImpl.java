package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.dao.PatientDao;
import net.proselyte.springsecurityapp.dao.RoleDao;
import net.proselyte.springsecurityapp.model.Patient;
import net.proselyte.springsecurityapp.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

/**
 * Implemenation of {@link PatientService} interface
 */
@Service
public class PatientServiceImpl implements PatientService {
    @Autowired
    private PatientDao patientDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private PasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(Patient patient) {
        patient.setPassword(bCryptPasswordEncoder.encode(patient.getPassword()));
        Set<Role> roles = new HashSet<Role>();
        roles.add(roleDao.getOne(1L));
        patient.setRoles(roles);
        patientDao.save(patient);
    }

    @Override
    public Patient findByUsername(String username) {
        return patientDao.findByUsername(username);
    }
}
