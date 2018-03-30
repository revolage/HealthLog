package net.proselyte.springsecurityapp.auth;

import net.proselyte.springsecurityapp.dao.DoctorDao;
import net.proselyte.springsecurityapp.dao.PatientDao;
import net.proselyte.springsecurityapp.model.Doctor;
import net.proselyte.springsecurityapp.model.Patient;
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
            return new User(user.getUserEmail(), user.getPassword(), roles);

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
