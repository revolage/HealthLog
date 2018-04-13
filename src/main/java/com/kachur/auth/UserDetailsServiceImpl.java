package com.kachur.auth;

import com.kachur.dao.DoctorDao;
import com.kachur.dao.PatientDao;
import com.kachur.model.Doctor;
import com.kachur.model.Patient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.HashSet;
import java.util.Set;

public class UserDetailsServiceImpl {

    @Autowired
    private PatientDao patientDao;

    @Autowired
    private DoctorDao doctorDao;

    public UserDetails loadUserByEmailAndDomain(String email, UserType userType) throws UsernameNotFoundException {
        Set<GrantedAuthority> roles = new HashSet<>();
        roles.add(new SimpleGrantedAuthority("ROLE_USER"));

        if (UserType.PATIENT == userType) {
            Patient user = patientDao.findByEmail(email);
            if(user == null) {
                throw new UsernameNotFoundException("User was not found");
            }
            return new User(user.getEmail(), user.getPassword(), roles);

        } else if (UserType.DOCTOR == userType) {
            Doctor doctor = doctorDao.findByEmail(email);
            if(doctor == null) {
                throw new UsernameNotFoundException("Doctor was not found");
            }
            return new User(doctor.getEmail(), doctor.getPassword(), roles);
        }
        throw new UsernameNotFoundException("User was not found");
    }



}
